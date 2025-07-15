using Marofh.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Threading;

namespace Marofh.Controllers
{
    [Authorize(Roles = "Office")]
    [ValidateInput(false)]
    public class OfficeController : Controller
    {

        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        private DBEntities db = new DBEntities();

        public OfficeController()
        {

        }

        protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        {
            string cultureName = null;

            // Attempt to read the culture cookie from Request
            HttpCookie cultureCookie = Request.Cookies["_culture"];
            if (cultureCookie != null)
                cultureName = cultureCookie.Value;
            else
                cultureName = Request.UserLanguages != null && Request.UserLanguages.Length > 0 ? Request.UserLanguages[0] : null; // obtain it from HTTP header AcceptLanguages


            // Modify current thread's cultures           
            Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

            return base.BeginExecuteCore(callback, state);
        }


        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }

            //  return RedirectToAction("Index", "Home");

            if (string.IsNullOrEmpty(returnUrl))
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return Redirect(returnUrl);
            }

        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
        
        [Authorize]
    
        public ActionResult Index(int? nid)
        {
            if (Request.IsAuthenticated)
            {
                var UserName = User.Identity.GetUserName();
                var loggedInUser = db.AspNetUsers.Where(i => i.UserName == UserName).FirstOrDefault();


                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN");
                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR");

                }


 


                //List<AspNetUser> availableWorkerList = new List<AspNetUser>();
                //List<AspNetUser> unAvailableWorkerList = new List<AspNetUser>();
                //List<AspNetUser> requestedWorkerList = new List<AspNetUser>();
                //foreach (AspNetUser worker in db.AspNetUsers.Where(p => p.OfficeID == loggedInUser.Id))
                //{
                //    if (db.WorkerRequests.Where(p => p.WorkerID == worker.Id).Count() == 0)
                //    {
                //        availableWorkerList.Add(worker);
                //    }
                //    else
                //    {
                //        if (db.WorkerRequests.Where(p => p.WorkerID == worker.Id & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).Count() > 0)
                //        {
                //            requestedWorkerList.Add(worker);
                //        }
                //        if (db.WorkerRequests.Where(p => p.WorkerID == worker.Id & p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString()).Count() > 0)
                //        {
                //            unAvailableWorkerList.Add(worker);

                //        }
                //    }
                //}
                List<AspNetUser> officeWorkersList = db.AspNetUsers.Where(i => i.OfficeID == loggedInUser.Id).ToList();
                ViewBag.availableWorkerList = officeWorkersList.Where(p => p.Status == clsEnum.Status.متاح.ToString()).ToList();
                ViewBag.unAvailableWorkerList = officeWorkersList.Where(p => p.Status == clsEnum.Status.غير_متاح.ToString()).ToList();
                ViewBag.requestedWorkerList = officeWorkersList.Where(p => p.Status == clsEnum.Status.مرشح_الى_كفيل.ToString()).ToList();


                if (IsSent)
                {
                    ViewBag.SentConfirmation = "True";
                    IsSent = false;
                }

                int percetage = 0;
                if (!string.IsNullOrEmpty(loggedInUser.OfficeName))
                {
                    percetage += 25;
                }

                if (loggedInUser.Branches.Count > 0)
                {
                    percetage += 25;
                }

                if (loggedInUser.OfficeServices.Count > 0)
                {
                    percetage += 25;
                }

                if (loggedInUser.OfficeDocuments.Count > 0)
                {
                    percetage += 25;
                }
                ViewBag.Percetage = percetage;

                if (nid != null)
                {
                    Notification notification = db.Notifications.Where(p => p.ID == nid & p.OfficeID == loggedInUser.Id & p.IsRead == false).FirstOrDefault();
                    if(notification != null)
                    {
                        notification.IsRead = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        return RedirectToAction("Index");

                    }


                }
              
                return View(loggedInUser);
            }
            return RedirectToAction("Login", "Account");

        }
        [HttpPost]
        public ActionResult Index()
        {
            if (Request.IsAuthenticated)
            {
              
                    var UserName = User.Identity.GetUserName();
                    var loggedInUser = db.AspNetUsers.Where(i => i.UserName == UserName).FirstOrDefault();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                }

             

                //List<AspNetUser> availableWorkerList = new List<AspNetUser>();
                //List<AspNetUser> unAvailableWorkerList = new List<AspNetUser>();
                //List<AspNetUser> requestedWorkerList = new List<AspNetUser>();
                //foreach (AspNetUser worker in db.AspNetUsers.Where(p => p.OfficeID == loggedInUser.Id))
                //{
                //    if (db.WorkerRequests.Where(p => p.WorkerID == worker.Id).Count() == 0)
                //    {
                //        availableWorkerList.Add(worker);
                //    }
                //    else
                //    {
                //        if (db.WorkerRequests.Where(p => p.WorkerID == worker.Id & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).Count() > 0)
                //        {
                //            requestedWorkerList.Add(worker);
                //        }
                //        if (db.WorkerRequests.Where(p => p.WorkerID == worker.Id & p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString()).Count() > 0)
                //        {
                //            unAvailableWorkerList.Add(worker);

                //        }
                //    }
                //}

                List<AspNetUser> officeWorkersList = db.AspNetUsers.Where(i => i.OfficeID == loggedInUser.Id).ToList();
                ViewBag.availableWorkerList = officeWorkersList.Where(p => p.Status == clsEnum.Status.متاح.ToString()).ToList();
                ViewBag.unAvailableWorkerList = officeWorkersList.Where(p => p.Status == clsEnum.Status.غير_متاح.ToString()).ToList();
                ViewBag.requestedWorkerList = officeWorkersList.Where(p => p.Status == clsEnum.Status.مرشح_الى_كفيل.ToString()).ToList();

                if (IsSent)
                {
                    ViewBag.SentConfirmation = "True";
                    IsSent = false;
                }


                return View(loggedInUser);

            }
            return RedirectToAction("Login", "Account");

        }

      

        [HttpPost]
        public ActionResult UpdateProfile(AspNetUser profile)
        {
            if (Request.IsAuthenticated)
            {
                var UserName = User.Identity.GetUserName();
                var loggedInUser = db.AspNetUsers.Where(i => i.UserName == UserName).FirstOrDefault();

                loggedInUser.FName = profile.FName;
                loggedInUser.LName = profile.LName;
                loggedInUser.Email = profile.Email;
                loggedInUser.OfficeName = profile.OfficeName;
                loggedInUser.Mobile = profile.Mobile;
                loggedInUser.OfficeAddress = profile.OfficeAddress;
                loggedInUser.NID = profile.NID;

                db.SaveChanges();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", loggedInUser.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", loggedInUser.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN", loggedInUser.JobsID);
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", loggedInUser.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", loggedInUser.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR", loggedInUser.JobsID);
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

   
            }

            return RedirectToAction("Index", "Office");


        }  
        [HttpPost]
        public ActionResult UpdateAddress(AspNetUser profile)
        {
            if (Request.IsAuthenticated)
            {
                var UserName = User.Identity.GetUserName();
                var loggedInUser = db.AspNetUsers.Where(i => i.UserName == UserName).FirstOrDefault();

                loggedInUser.CountryID = profile.CountryID;
                loggedInUser.CityID = profile.CityID;
                loggedInUser.District = profile.District;
                loggedInUser.Longitude = profile.Longitude;
                loggedInUser.Latitude = profile.Latitude;
                db.SaveChanges();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", loggedInUser.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", loggedInUser.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN", loggedInUser.JobsID);
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", loggedInUser.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", loggedInUser.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR", loggedInUser.JobsID);
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

         
            }

            return RedirectToAction("Index", "Office");


        }
        public ActionResult CreateBranch(Branch branch)
        {
            if (Request.IsAuthenticated)
            {

                branch.OfficeID = User.Identity.GetUserId();
                db.Branches.Add(branch);
                db.SaveChanges();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

          
            }

            return RedirectToAction("Index");
        }
        public ActionResult EditBranch(int id)
        {

            var branch = db.Branches.Find(id);
            if (branch == null)
            {
                return HttpNotFound();
            }

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", branch.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", branch.CityID);
            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", branch.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", branch.CityID);
            }


    
            return PartialView("_EditBranch", branch);

        }
        [HttpPost]
        public ActionResult EditBranch(Branch branch)
        {

            if (ModelState.IsValid)
            {
                db.Entry(branch).State = EntityState.Modified;
                db.SaveChanges();

            }


            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

            }


   
            return RedirectToAction("Index");

        }

        public ActionResult CreateService(OfficeService service)
        {
            if (Request.IsAuthenticated)
            {

                service.OfficeID = User.Identity.GetUserId();
                db.OfficeServices.Add(service);
                db.SaveChanges();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

        
            }

            return RedirectToAction("Index");
        }
        public ActionResult EditService(int id)
        {

            var service = db.OfficeServices.Find(id);
            if (service == null)

            {
                return HttpNotFound();
            }

            return PartialView("_EditService", service);

        }   
        [HttpPost]
        public ActionResult EditService(OfficeService service)
        {

            if (ModelState.IsValid)
            {
                db.Entry(service).State = EntityState.Modified;
                db.SaveChanges();

            }

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

            }
            else
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

            }


            return RedirectToAction("Index");

        }
      
        public ActionResult CreateOfficeDocuments(OfficeDocument document, HttpPostedFileBase FileUrl)
        {
            if (Request.IsAuthenticated)
            {
                Guid guid = Guid.NewGuid();
                string extension = Path.GetExtension(FileUrl.FileName);
                string path = Path.Combine(Server.MapPath("~/uploads/files/"), guid.ToString() + extension);
                path = path.Replace(" ", "_");
                FileUrl.SaveAs(path);
                document.FileUrl = "/uploads/files/" + guid.ToString() + extension;
                document.OfficeID = User.Identity.GetUserId();
                db.OfficeDocuments.Add(document);
                db.SaveChanges();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

   
            }

            return RedirectToAction("Index");


        }
     
        public ActionResult EditOfficeDocuments(int id)
        {

            var document = db.OfficeDocuments.Find(id);
            if (document == null)

            {
                return HttpNotFound();
            }

            return PartialView("_EditOfficeDocuments", document);

        }   public ActionResult RemoveOfficeDocuments(int id)
        {

            var document = db.OfficeDocuments.Find(id);
            db.OfficeDocuments.Remove(document);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
   [HttpPost]
        public ActionResult EditOfficeDocuments(OfficeDocument document, HttpPostedFileBase FileUrl)
        {
            if (Request.IsAuthenticated)
            {
                if (FileUrl != null)
                {

                    Guid guid = Guid.NewGuid();
                    string extension = Path.GetExtension(FileUrl.FileName);
                    string path = Path.Combine(Server.MapPath("~/uploads/files/"), guid.ToString() + extension);
                    path = path.Replace(" ", "_");
                    FileUrl.SaveAs(path);
                    document.FileUrl = "/uploads/files/" + guid.ToString() + extension;
                    document.OfficeID = User.Identity.GetUserId();

                    db.Entry(document).State = EntityState.Modified;
                    db.SaveChanges();
                }

            }

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

            }


          
            return RedirectToAction("Index");

        }
        static bool IsSent;
        public ActionResult FirstAcceptance(int id)
        {
            if (Request.IsAuthenticated)
            {
                var request = db.WorkerRequests.Find(id);
                request.RequestStatus = clsEnum.WorkerRequestStatus.قبول_أولى.ToString();
                request.PaidStatus = clsEnum.WorkerRequestStatus.قيمة_مبدئية.ToString();
                IsSent = true;
                db.SaveChanges();


                var worker = db.AspNetUsers.Find(request.WorkerID);
                worker.Status = clsEnum.Status.مرشح_الى_كفيل.ToString();
                db.SaveChanges();

                string workerName = request.AspNetUser1.FName + " " + request.AspNetUser1.LName;

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();

                          

              
                if (culture.Contains("en-us"))
                {
                    ViewModel.SendNotification(string.Format("The status of your request has been modified for \" {0} \" to first acceptance", workerName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewModel.SendNotification(string.Format("تم تعديل حالة طلبك بخصوص \" {0} \" الى قبول أولى", workerName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

           

            }
          

            return RedirectToAction("Index");


        }
        public ActionResult FirstDecline(int id)
        {
            if (Request.IsAuthenticated)
            {
                var request = db.WorkerRequests.Find(id);
                request.RequestStatus = clsEnum.WorkerRequestStatus.رفض_أولى.ToString();
                db.SaveChanges();
                string workerName = request.AspNetUser1.FName + " " + request.AspNetUser1.LName;
             

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {

                    ViewModel.SendNotification(string.Format("The status of your request has been modified for \" {0} \" to a first refusal", workerName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                }
                else
                {
                    ViewModel.SendNotification(string.Format("تم تعديل حالة طلبك بخصوص \" {0} \" الى رفض أولى", workerName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

                
            }

            return RedirectToAction("Index");


        }
        public ActionResult FinalAcceptance(int id)
        {
            if (Request.IsAuthenticated)
            {
                var request = db.WorkerRequests.Find(id);
                request.RequestStatus = clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString();
                if(string.IsNullOrEmpty(request.PaidStatus) || request.Balance==0)
                {
                    request.PaidStatus = clsEnum.WorkerRequestStatus.طلبات_مستحقة.ToString();

                    // زيادة قيممة المحفظة
                   request.Balance += 300;
                }

                db.SaveChanges();

                var worker = db.AspNetUsers.Find(request.WorkerID);
                worker.Status = clsEnum.Status.غير_متاح.ToString();
                db.SaveChanges();

                string workerName = request.AspNetUser1.FName + " " + request.AspNetUser1.LName;


               

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {

                    ViewModel.SendNotification(string.Format("Your request has been approved \" {0} \" ", workerName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewModel.SendNotification(string.Format("تم اعتماد طلبك بخصوص \" {0} \" ", workerName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

            }

            return RedirectToAction("Index");


        }  
        public ActionResult ShowKafilMobileNumber(int id)
        {
            if (Request.IsAuthenticated)
            {
                var request = db.WorkerRequests.Find(id);
                request.PaidStatus = clsEnum.WorkerRequestStatus.طلبات_مستحقة.ToString();

                // زيادة قيممة المحفظة
                request.Balance += 300;
                db.SaveChanges();

                string workerName = request.AspNetUser1.FName + " " + request.AspNetUser1.LName;

               

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewModel.SendNotification(string.Format("300 riyals have been added to your wallet related to your order \" {0} \" ", workerName), request.OfficeID, null, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewModel.SendNotification(string.Format("تم اضافة 300 ريال على محفظتك متعلقة بخصوص طلبك \" {0} \" ", workerName), request.OfficeID, null, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                }


               
            }

            return RedirectToAction("Index");


        }  
        
        public ActionResult FinalDecline(int id)
        {
            if (Request.IsAuthenticated)
            {
                var request = db.WorkerRequests.Find(id);
                request.RequestStatus = clsEnum.WorkerRequestStatus.تم_رفض_الاعتماد.ToString();
                db.SaveChanges();

                string workerName = request.AspNetUser1.FName + " " + request.AspNetUser1.LName;

         

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewModel.SendNotification(string.Format("The status of your request has been modified for \" {0} \" to a final refusal", workerName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewModel.SendNotification(string.Format("تم تعديل حالة طلبك بخصوص \" {0} \" الى رفض نهائى", workerName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.Requests.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }
        
            }

            return RedirectToAction("Index");


        }
        public ActionResult KafilBlock(int id)
        {
            if (Request.IsAuthenticated)
            {
                var request = db.WorkerRequests.Find(id);
                request.RequestStatus = clsEnum.WorkerRequestStatus.طلبات_محظورة.ToString();

                BlokedUser user = new BlokedUser();
                user.KafilID = request.KafilID;
                user.OfficeID = request.OfficeID;
                user.Date = DateTime.Now;
                db.BlokedUsers.Add(user);

                db.SaveChanges();

                string officeName = request.AspNetUser2.OfficeName;
             

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewModel.SendNotification(string.Format("Your interaction has been blocked with \" {0}\"", request.AspNetUser2.OfficeName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.BlockedOrUnBlocked.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewModel.SendNotification(string.Format("تم حظر تعاملك مع \" {0}\"", request.AspNetUser2.OfficeName), null, request.KafilID, null, request.ID, clsEnum.NotificationTypes.BlockedOrUnBlocked.ToString());

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

              
            }

            return RedirectToAction("Index");


        }
        public ActionResult UnBlockUser(int id)
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();

            if (Request.IsAuthenticated)
            {
                var user = db.BlokedUsers.Find(id);     
                string officeName = user.AspNetUser.OfficeName;

                if (!string.IsNullOrEmpty(officeName))
                {
                    if (culture.Contains("en-us"))
                    {
                        ViewModel.SendNotification(string.Format("Your Interaction Has been unblocked with \" {0}\"", officeName), null, user.KafilID, null, null, clsEnum.NotificationTypes.BlockedOrUnBlocked.ToString());

                    }
                    else
                    {
                        ViewModel.SendNotification(string.Format("تم الغاء حظر تعاملك مع \" {0}\"", officeName), null, user.KafilID, null, null, clsEnum.NotificationTypes.BlockedOrUnBlocked.ToString());

                    }

                   

                }

                db.BlokedUsers.Remove(user);

                db.SaveChanges();

               
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }


                
            }

            return RedirectToAction("Index");


        }
        public OfficeController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }


        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }


        // GET: /Account/Register
        [AllowAnonymous]
      
        public ActionResult Register()
        {
            int countryId = Convert.ToInt32(clsEnum.Countries.SaudiArabia);
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries.Where(p => p.ID == countryId), "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities.Where(p => p.CountryID == countryId), "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries.Where(p => p.ID == countryId), "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities.Where(p => p.CountryID == countryId), "ID", "NameAR");

            }

            
            return View();
        }

        // POST: /Account/Register
       [HttpPost]
[AllowAnonymous]
[ValidateAntiForgeryToken]
public async Task<ActionResult> Register(RegisterViewModel model)
{
    var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
    model.UserName = model.Email;
    model.IsBlocked = false;
    model.IsActivated = true;

    var user = new ApplicationUser
    {
        FName = model.FName,
        LName = model.LName,
        UserName = model.Email,
        Email = model.Email,
        Password = model.Password,
        Mobile = model.Mobile,
        RoleID = Convert.ToInt32(clsEnum.Roles.Office),
        CountryID = model.CountryID,
        CityID = model.CityID,
        NationalityID = model.NationalityID,
        WhatsAppNo = model.WhatsAppNo,
        HRLicenseNo = model.HRLicenseNo,
        HRLicenseExpiryDate = model.HRLicenseExpiryDate,
        CommercialRegisterNO = model.CommercialRegisterNO,
        CommercialRegisterExpirationDate = model.CommercialRegisterExpirationDate,
        EmployeeFName = model.EmployeeFName,
        EmployeeLName = model.EmployeeLName,
        EmployeeEmail = model.EmployeeEmail,
        EmployeeMobile = model.EmployeeMobile,
        OfficeName = model.OfficeName,
        NID = model.NID,
        LastLoggedInDate = DateTime.Now,
        IsActivated = model.IsActivated,
        IsBlocked = model.IsBlocked
    };

    var isEmailAlreadyExists = db.AspNetUsers.Any(x => x.Email == model.Email && x.RoleID == user.RoleID);
    if (isEmailAlreadyExists)
    {
        ModelState.AddModelError("Email", "User with this email already exists");

        int countryId = Convert.ToInt32(clsEnum.Countries.SaudiArabia);

        if (culture.Contains("en-us"))
        {
            ViewBag.Result = "This e-mail address is already registered... Please use another e-mail";
            ViewBag.CountryID = new SelectList(db.Countries.Where(p => p.ID == countryId), "ID", "NameAR", countryId);
            ViewBag.CityID = new SelectList(db.Cities.Where(p => p.CountryID == countryId), "ID", "NameAR", model.CityID);
        }
        else
        {
            ViewBag.Result = "هذا البريد الالكترونى مسجل من قبل ... برجاء استخدام بريد اخر";
            ViewBag.CountryID = new SelectList(db.Countries.Where(p => p.ID == countryId), "ID", "NameEN", countryId);
            ViewBag.CityID = new SelectList(db.Cities.Where(p => p.CountryID == countryId), "ID", "NameEN", model.CityID);
        }

        return View(model);
    }

    var result = await UserManager.CreateAsync(user, model.Password);
    if (result.Succeeded)
    {
        var roleresult = UserManager.AddToRole(user.Id, clsEnum.Roles.Office.ToString());

        // ✅ تسجيل الدخول مباشرة
        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);

        // ✅ إرسال رسالة ترحيب وتفعيل
        if (culture.Contains("en-us"))
        {
            ViewModel.SendMessage(user.Email, "Activate your account in ESTQDAMI", "", user.Id);
            ViewModel.SendNotification("ESTQDAMI Work team welcomes you", user.Id, null, null, null, clsEnum.NotificationTypes.FirstLogin.ToString());
        }
        else
        {
            ViewModel.SendMessage(user.Email, "تنشيط حسابك فى استقدامي", "", user.Id);
            ViewModel.SendNotification("فريق عمل استقدامي يرحب بك", user.Id, null, null, null, clsEnum.NotificationTypes.FirstLogin.ToString());
        }
                TempData["ShowContractModal"] = true;

                // ✅ توجيه المستخدم مباشرة إلى صفحة مكتبه
                return RedirectToLocal("/office/");
    }

    // ✅ في حالة فشل التسجيل نرجع نفس الصفحة مع الأخطاء
    AddErrors(result);
    return View(model);
}



        [Authorize]
        [HttpPost]
        public async Task<ActionResult> UpdateUserPassword(string Password)
        {
            if (Request.IsAuthenticated)
            {
                var UserName = User.Identity.GetUserName();
                var id = User.Identity.GetUserId();
                var temp = db.AspNetUsers.Where(i => i.UserName == UserName).First();

                //     Find User
                var user = await db.AspNetUsers.Where(x => x.Id == id).SingleOrDefaultAsync();
                user.Password = Password;
                db.SaveChanges();

                await UserManager.RemovePasswordAsync(id);
                //     Add a user password only if one does not already exist
                await UserManager.AddPasswordAsync(id, Password);


                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }


                

            }
            return RedirectToAction("Index");


        }
        [Authorize]
       
         public  ActionResult DeleteWorker(int shortId)
        {
            if (Request.IsAuthenticated)
            {

                var worker = db.AspNetUsers.Where(p=>p.ShortID==shortId).FirstOrDefault();
                if (worker != null)
                {
                    // حذف كل ماهو متعلق بهذا العامل
                    db.WorkerWorkingPlaces.RemoveRange(db.WorkerWorkingPlaces.Where(p => p.AspNetUser.ShortID == shortId));
                    db.WorkerCourses.RemoveRange(db.WorkerCourses.Where(p => p.AspNetUser.ShortID == shortId));
                    db.WorkerExpertises.RemoveRange(db.WorkerExpertises.Where(p => p.AspNetUser.ShortID == shortId));
                    db.WorkerLanguages.RemoveRange(db.WorkerLanguages.Where(p => p.AspNetUser.ShortID == shortId));
                    db.WorkerRequests.RemoveRange(db.WorkerRequests.Where(p => p.AspNetUser1.ShortID == shortId));

                    db.FavoriteLists.RemoveRange(db.FavoriteLists.Where(p => p.WorkerID == worker.Id));
                   
                    // حذف  العامل
                    db.AspNetUsers.Remove(worker);
                    db.SaveChanges();
                }

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }


                

            }
            return RedirectToAction("Index");

        }
        
        [Authorize]
       
         public  ActionResult ReturnWorkerToBeAvailable(int shortId)
        {
            if (Request.IsAuthenticated)
            {

                var worker = db.AspNetUsers.Where(p=>p.ShortID==shortId).FirstOrDefault();
                if (worker != null)
                {
//سوف يتم اتاحة هذا العامل مرة اخرى

worker.Status = clsEnum.Status.متاح.ToString(); 
                    db.SaveChanges();
                }

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }


               

            }
            return RedirectToAction("Index");

        } 
        [Authorize]
        public  ActionResult DeleteBranch(int id)
        {
            if (Request.IsAuthenticated)
            {

                var branch = db.Branches.Find(id);
                if (branch != null)
                {
                    db.Branches.Remove(branch);
                    db.SaveChanges();
                }

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

             

            }
            return RedirectToAction("Index");

        }
          public  ActionResult DeleteOfficeService(int id)
        {
            if (Request.IsAuthenticated)
            {

                var officeService = db.OfficeServices.Find(id);
                if (officeService != null)
                {
                    db.OfficeServices.Remove(officeService);
                    db.SaveChanges();
                }

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

                }

         

            }
            return RedirectToAction("Index");

        }


        [HttpPost]
        [Authorize]
        public JsonResult SendContract()
        {   
           
            // Checking no of files injected in Request object  
            if (Request.Files.Count > 0)
            {
                try
                {
                    //  Get all files from Request object  
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                       
                        //string path = AppDomain.CurrentDomain.BaseDirectory + "Uploads/";  
                        //string filename = Path.GetFileName(Request.Files[i].FileName);  

                        HttpPostedFileBase file = files[i];
                        string fname;

                        // Checking for Internet Explorer  
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                        }

                     
                        Guid guid = Guid.NewGuid();
                        string extension = Path.GetExtension(file.FileName);
                        string path = Path.Combine(Server.MapPath("~/uploads/contracts/"), guid.ToString() + extension);
                        path = path.Replace(" ", "_");
                        file.SaveAs(path);

                        var UserName = User.Identity.GetUserName();
                        var id = User.Identity.GetUserId();
                        var temp = db.AspNetUsers.Where(p=> p.UserName == UserName).First();
                        temp.ContractUrl = "/uploads/contracts/" + guid.ToString() + extension;
                        db.SaveChanges();
                       

                    }
                    // Returns message that successfully uploaded  
                    return Json("File Uploaded Successfully!");
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("No files selected.");
            }

        }

        public ActionResult EditOfficeImageProfile(int id)
        {

            var cWorker = db.AspNetUsers.Where(i => i.ShortID == id).FirstOrDefault();
            if (cWorker == null)
            {
                return HttpNotFound();
            }

            return PartialView("_EditOfficeImageProfile", cWorker);

        }
        [HttpPost]
        public ActionResult EditOfficeImageProfile(HttpPostedFileBase ImageUrl, int Id)
        {
            var obj = db.AspNetUsers.Where(i => i.ShortID == Id).FirstOrDefault();

            if (Request.IsAuthenticated)
            {
                if (ImageUrl != null)
                {
                    Guid guid = Guid.NewGuid();
                    string extension = Path.GetExtension(ImageUrl.FileName);
                    string path = Path.Combine(Server.MapPath("~/uploads/office/"), guid.ToString() + extension);
                    path = path.Replace(" ", "_");
                    ImageUrl.SaveAs(path);

                    obj.ImageUrl = "/uploads/office/" + guid.ToString() + extension;
                }
                else
                {
                    obj.ImageUrl = "/Content/front/assets/img/user.png";
                }
                db.Entry(obj).State = EntityState.Modified;
                db.SaveChanges();
            }
            int shortId = obj.ShortID;

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
            }

 
            return RedirectToAction("Index");

        }

        public ActionResult PayRequest(int id)
        {

            var request = db.WorkerRequests.Find(id);

            if (request == null)

            {
                return HttpNotFound();
            }

            return PartialView("_PayRequest", request);

        }
        [HttpPost]
        public ActionResult PayRequest(WorkerRequest request, decimal PaiedAmount,HttpPostedFileBase ReceiptUrl)
        {

            var temp = db.WorkerRequests.Find(request.ID);

            if (temp == null)

            {
                return HttpNotFound();
            }
            if (temp.Balance == PaiedAmount)
            {
                if (ReceiptUrl != null)
                {
                    Guid guid = Guid.NewGuid();
                    string extension = Path.GetExtension(ReceiptUrl.FileName);
                    string path = Path.Combine(Server.MapPath("~/uploads/receipts/"), guid.ToString() + extension);
                    path = path.Replace(" ", "_");
                    ReceiptUrl.SaveAs(path);

                    temp.ReceiptUrl = "/uploads/receipts/" + guid.ToString() + extension;
              
                temp.PaidStatus = clsEnum.WorkerRequestStatus.تحت_المراجعة.ToString();
                temp.PaidDate = DateTime.Now; 
                }
            }
            // temp.Balance -= PaiedAmount;

            db.SaveChanges();
            return RedirectToAction("Wallet", "Office");

        }

        [Authorize]
        public ActionResult Wallet()
        {
            string userId = User.Identity.GetUserId();
            return View(db.WorkerRequests.Where(p => p.OfficeID == userId));
        }


        public ActionResult MailDetail()
        {
            return View();
        }
         public ActionResult Inbox()
        {
            string userId = User.Identity.GetUserId();
            return View(db.Mails.Where(p=>p.OfficeID==userId));
        }
      


        public ActionResult Message(int id)
        {
            string userId = User.Identity.GetUserId();
            var mail = this.db.Mails.Where(p => p.ID == id & p.OfficeID==userId).FirstOrDefault();
            if (mail != null)
            {
                mail.IsRead = true;
                db.SaveChanges();
                ViewBag.MailID = id;
                return View(db.Mails.Where(p => p.ID == id & p.OfficeID == userId || p.MailID == id & p.OfficeID == userId));
            }
            return RedirectToAction("Inbox");
        }


        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult SendReply(Mail mail, HttpPostedFileBase FileUrl)
        {

            mail.OfficeID = User.Identity.GetUserId();
            mail.IsRead = false;
            mail.Date = DateTime.Now;
            if (FileUrl != null)
            {
                if (FileUrl.ContentLength > 0)
                {
                    Guid guid = Guid.NewGuid();
                    string extension = Path.GetExtension(FileUrl.FileName);
                    string path = Path.Combine(Server.MapPath("~/uploads/receipts/"), guid.ToString() + extension);
                    path = path.Replace(" ", "_");
                    FileUrl.SaveAs(path);

                    mail.FileUrl = "/uploads/receipts/" + guid.ToString() + extension;
                    db.Mails.Add(mail);
                    db.SaveChanges();
                    return RedirectToAction("Inbox");
                }
            }
            db.Mails.Add(mail);
            db.SaveChanges();
            return RedirectToAction("Inbox");
        }

        [Authorize]
        [HttpPost]
        public ActionResult PayBulkRequests(FormCollection tblRequests)
        {
            try
            {
                string[] ids = tblRequests["ID"].Split(new char[] { ',' });
                List<WorkerRequest> list = new List<WorkerRequest>();
                foreach (string id in ids)
                {
                    var request = this.db.WorkerRequests.Find(int.Parse(id));
                    list.Add(request);
                    int x = list.Count();

                }
                Session["requests"] = list;

                return PartialView("_PayBulkRequests", list);
            }
            catch (Exception)
            {

                return RedirectToAction("Wallet", "Office");

            }


        }
        [Authorize]
        [HttpPost]
        public ActionResult PayBulkRequestsByOffice(decimal PaiedAmount, HttpPostedFileBase ReceiptUrl)
        {



            foreach (WorkerRequest  temp in Session["requests"]as List<WorkerRequest>)
            {

                var request = db.WorkerRequests.Find(temp.ID);

                if (ReceiptUrl != null)
                {
                    Guid guid = Guid.NewGuid();
                    string extension = Path.GetExtension(ReceiptUrl.FileName);
                    string path = Path.Combine(Server.MapPath("~/uploads/receipts/"), guid.ToString() + extension);
                    path = path.Replace(" ", "_");
                    ReceiptUrl.SaveAs(path);

                    request.ReceiptUrl = "/uploads/receipts/" + guid.ToString() + extension;

                    request.PaidStatus = clsEnum.WorkerRequestStatus.تحت_المراجعة.ToString();
                    request.PaidDate = DateTime.Now;
                    db.SaveChanges();
                }
            }
            // temp.Balance -= PaiedAmount;

        
            return RedirectToAction("Wallet", "Office");

        }
        [HttpPost]
        [Authorize]

        public JsonResult ValidateUniqueValues(string id,string value)
        {
            string retval = "";
            try
            {
                //string userId = User.Identity.GetUserId();
                //if (db.FavoriteLists.Any(p => p.WorkerID == wId & p.KafilID == userId) == false)
                //{
                //    FavoriteList list = new FavoriteList();
                //    list.WorkerID = wId;
                //    list.KafilID = userId;
                //    db.FavoriteLists.Add(list);
                //    db.SaveChanges();
                //    retval = "AddedToFavoriteList";
                //}
                //else
                //{
                //    retval = "AlreadyExistedInFavoriteList";
                //}
                return Json(retval, JsonRequestBehavior.AllowGet);

            }
            catch (Exception)
            {

                retval = "Exception";
            }
            return Json(retval, JsonRequestBehavior.AllowGet);
        }
        


    }
}
