using Marofh.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Threading;

namespace Marofh.Controllers
{
    [Authorize]
    public class KafilController : Controller
    {
    
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        private DBEntities db = new DBEntities();
        int workerRoleId = Convert.ToInt32(clsEnum.Roles.Worker);
        public KafilController()
        {

        }

        // GET: Base
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

        public ActionResult test()
        {

            return View();
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

        //public ActionResult Index()
        //{
           
        //    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
        //    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
        //    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");

        //    // فلتره العمالة الغير متاحيين 

        //    var result = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)
        //                  where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
        //                  where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
        //                  select x).ToList();


          
        //    return View(result);
           
        //}

        //  public ActionResult Index(string JobsID,string NationalityID,bool? Gender,string minAge,string maxAge)
        //{
        //    //?JobsID=1&NationalityID=&Gender=True&minAge=&maxAge=#
        //    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
        //    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
        //    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");

        //    // فلتره العمالة الغير متاحيين 

        //    var result = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)
        //                  where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
        //                  where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
        //                  select x).ToList();


        //    if (!string.IsNullOrEmpty(JobsID))
        //    {
        //        int _JobsID = Convert.ToInt32(JobsID);
        //        result = result.Where(p => p.JobsID == _JobsID).ToList();
        //    } 
        //    if (!string.IsNullOrEmpty(NationalityID))
        //    {
        //        int _NationalityID = Convert.ToInt32(NationalityID);
        //        result = result.Where(p => p.NationalityID == _NationalityID).ToList();
        //    }


        //    if (Gender != null)
        //    {
        //        result = result.Where(p => p.Gender == Gender).ToList();

        //    }
        //    if (!string.IsNullOrEmpty(minAge))
        //    {
        //        int _minAge = Convert.ToInt32(minAge);
        //        result = result.Where(p => p.Age >= _minAge).ToList();
        //    }
        //    if (!string.IsNullOrEmpty(maxAge))
        //    {
        //        int _maxAge = Convert.ToInt32(maxAge);
        //        result = result.Where(p => p.Age <= _maxAge).ToList();
        //    }


          
        //    return View(result);
           
        //}

        [Authorize]
        public ActionResult FavoriteList()
        {
           
            string userId = User.Identity.GetUserId();

            return View(db.FavoriteLists.Where(p=>p.KafilID== userId));
        } 

        public ActionResult Index(int? nid,string CountryID, string minAge, string maxAge, string minExperienceYearsCount, string maxExperienceYearsCount, bool? Gender, string JobsID, bool? Religion, string ExperienceYearsCount)
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();

            string userId = User.Identity.GetUserId();
           AspNetUser loggedInUser = ViewModel.GetAspNetUser(userId);
            if(culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", loggedInUser.CityID);
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", loggedInUser.CityID);
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");

            }

       

            // فلتره العمالة الغير متاحيين 

            var availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

                                     where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
                                     where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
                                     select x).ToList();



            if (nid != null)
            {
                Notification notification = db.Notifications.Where(p => p.ID == nid & p.KafilID == userId & p.IsRead == false).FirstOrDefault();
                if (notification != null)
                {
                    notification.IsRead = true;
                    db.SaveChanges();
                    return View(availablesWorkers);

                }
                else
                {
                    return RedirectToAction("Index");

                }


            }

            string[] queryList = Request.QueryString.AllKeys;
            List<string> JobIDList = new List<string>();
            List<string> NationalityIDList = new List<string>();
            List<string> GenderList = new List<string>();
            List<string> ReligionList = new List<string>();
            if (queryList.Count() == 0)
            {
                 return View(availablesWorkers);
            }

            else
            {
                if(culture.Contains("en-us"))
                {

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", loggedInUser.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");

                }
                 else
                {

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", loggedInUser.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");

                }



                ViewBag.minAge = minAge;    
                ViewBag.maxAge = maxAge;   
                
                ViewBag.minExperienceYearsCount = minExperienceYearsCount;    
                ViewBag.maxExperienceYearsCount = maxExperienceYearsCount;

                foreach (String key in Request.QueryString.AllKeys)
                {
                    if (key.ToString() == "JobsID")
                    {
                        JobIDList.AddRange(Request.QueryString[key].Split(','));
                    }
                    if (key.ToString() == "NationalityID")
                    {
                        NationalityIDList.AddRange(Request.QueryString[key].Split(','));
                    }
                    if (key.ToString() == "Gender")
                    {
                        GenderList.AddRange(Request.QueryString[key].Split(','));
                    }  if (key.ToString() == "Religion")
                    {
                        ReligionList.AddRange(Request.QueryString[key].Split(','));
                    }
                }

                 
                    if (!string.IsNullOrEmpty(CountryID) & JobIDList.Count > 0)
                    {
                   
                        int _CountryID = Convert.ToInt32(CountryID);
                         availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId & p.CountryID == _CountryID)

                                                 where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
                                                 where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
                                                 where JobIDList.Any(j => j.Contains(x.JobsID.ToString()))
                                                 select x).ToList();

                    }
                    if (!string.IsNullOrEmpty(CountryID) & JobIDList.Count == 0)
                    {
                   
                        int _CountryID = Convert.ToInt32(CountryID);
                         availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId & p.CountryID == _CountryID)

                                                 where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
                                                 where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
                                                 select x).ToList();

                    }

                    if ( GenderList.Count != 2 & GenderList.Count != 0)
                    {
                        // فى حاله ان النوع المطلوب هو اما ذكر او انثى فقط 
                        // اما فى حاله تم احتيار النوعين فلا يوجد لها استخدام
                       
                            foreach (var gender in GenderList)
                            {
                                bool _gender = Convert.ToBoolean(gender);
                                availablesWorkers = availablesWorkers.Where(p => p.Gender == _gender).ToList();
                            }
                        
                    }
                   
                    if (!string.IsNullOrEmpty(minAge))
                    {
                        int _minAge = Convert.ToInt32(minAge);
                        availablesWorkers = availablesWorkers.Where(p => p.Age >= _minAge).ToList();
                    }

                    if (!string.IsNullOrEmpty(maxAge))
                    {
                        int _maxAge = Convert.ToInt32(maxAge);
                        availablesWorkers = availablesWorkers.Where(p => p.Age <= _maxAge).ToList();
                    }

                if (ReligionList.Count == 1 & ReligionList.Count != 0)
                {
                    // فى حاله ان النوع المطلوب هو اما مسلم او غير فقط 
                    // اما فى حاله تم احتيار النوعين فلا يوجد لها استخدام
                
                        foreach (var religion in ReligionList)
                        {
                            availablesWorkers = availablesWorkers.Where(p => p.Religion == religion).ToList();
                        }
                   
                }

                if (!string.IsNullOrEmpty(minExperienceYearsCount))
                    {
                        int _minExperienceYearsCount = Convert.ToInt32(minExperienceYearsCount);
                        availablesWorkers = availablesWorkers.Where(p => p.ExperienceYearsCount >= _minExperienceYearsCount).ToList();
                    }
                    if (!string.IsNullOrEmpty(maxExperienceYearsCount))
                    {
                        int _maxExperienceYearsCount = Convert.ToInt32(maxExperienceYearsCount);
                        availablesWorkers = availablesWorkers.Where(p => p.ExperienceYearsCount <= _maxExperienceYearsCount).ToList();
                    }

                    return View(availablesWorkers);
               
            }
         


        }
        public KafilController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
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



            if(culture.Contains("en-us"))
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
            //model.ConfirmPassword = model.Password;
            var errors = ModelState.Values.SelectMany(v => v.Errors);

            //if (ModelState.IsValid)
            //{

            //var user = new ApplicationUser { FName = model.FName,LName = model.LName, UserName = model.UserName, Email = model.Email, Password = model.Password, Mobile = model.Mobile, RoleID = Convert.ToInt32(clsEnum.Roles.Kafil) };
            var user = new ApplicationUser
            {
                FName = model.FName,
                LName = model.LName,
                UserName = model.Email,
                Email = model.Email,
                Password = model.Password,
                Mobile = model.Mobile,
                RoleID = Convert.ToInt32(clsEnum.Roles.Kafil),
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
                LastLoggedInDate = DateTime.Now,
               IsActivated = model.IsActivated,
                IsBlocked = model.IsBlocked

            };

            var isEmailAlreadyExists = db.AspNetUsers.Any(x => x.Email == model.Email & x.RoleID == user.RoleID);
            if (isEmailAlreadyExists)
            {
                ModelState.AddModelError("Email", "User with this email already exists");
                int countryId = Convert.ToInt32(clsEnum.Countries.SaudiArabia);
                if (culture.Contains("en-us"))
                {
                    ViewBag.Result = "This e-mail address is already registered... Please use another e-mail ";
                    ViewBag.CountryID = new SelectList(db.Countries.Where(p => p.ID == countryId), "ID", "NameEN", countryId);
                    ViewBag.CityID = new SelectList(db.Cities.Where(p => p.CountryID == countryId), "ID", "NameEN", model.CityID);

                }
             else
                {
                    ViewBag.Result = " هذا البريد الالكترونى مسجل من قبل ... برجاء استخدام بريد اخر";
                    ViewBag.CountryID = new SelectList(db.Countries.Where(p => p.ID == countryId), "ID", "NameAR", countryId);
                    ViewBag.CityID = new SelectList(db.Cities.Where(p => p.CountryID == countryId), "ID", "NameAR", model.CityID);

                }

             

         


                return View(model);
            }
            var result = await UserManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                var roleresult = UserManager.AddToRole(user.Id, clsEnum.Roles.Kafil.ToString());

            
                if (culture.Contains("en-us"))
                {
                 
                    ViewModel.SendMessage(user.Email, "Activate your account in ESTQDAMI", "", user.Id);
                    ViewModel.SendNotification("ESTQDAMI Work team welcomes you", null, user.Id, null, null, clsEnum.NotificationTypes.FirstLogin.ToString());
                }
                else
                {
               
                      ViewModel.SendMessage(user.Email, "تنشيط حسابك فى استقدامي", "", user.Id);
                    ViewModel.SendNotification("فريق عمل استقدامي يرحب بك", null, user.Id, null, null, clsEnum.NotificationTypes.FirstLogin.ToString());

                }
                                          
           

            

                return RedirectToAction("ConfirmationMessage", "Account");
            }
            AddErrors(result);
            //}
            //else
            //{
            //    List<string> errors1 = new List<string>();
            //    foreach (ModelState modelState in ViewData.ModelState.Values)
            //    {
            //        foreach (ModelError error in modelState.Errors)
            //        {
            //            errors1.Add(error.ErrorMessage);
            //            ViewBag.Errors += error.ErrorMessage + "##";
            //        }
            //    }

            //}

            // If we got this far, something failed, redisplay form
            //return View(model);
            return RedirectToAction("index", "Home");

        }



        [HttpPost]
        [Authorize]

        public JsonResult AddToFavoriteByAjax(string wId)
        {
            string retval = "";
            try
            {
                string userId = User.Identity.GetUserId();
                if (db.FavoriteLists.Any(p => p.WorkerID == wId & p.KafilID == userId) == false)
                {
                    FavoriteList list = new FavoriteList();
                    list.WorkerID = wId;
                    list.KafilID = userId;
                    db.FavoriteLists.Add(list);
                    db.SaveChanges();
                    retval = "AddedToFavoriteList";
                }
                else
                {
                    retval = "AlreadyExistedInFavoriteList";
                }
                return Json(retval, JsonRequestBehavior.AllowGet);

            }
            catch (Exception)
            {

                retval = "Exception";
            }
            return Json(retval, JsonRequestBehavior.AllowGet);
        }   
              
        [Authorize]
        [HttpPost]
        public JsonResult ReportWorkerByAjax(string wId,string HasFakeData, string HasInappropriateImages, string OtherReason, string Notes)
        {
            string retval = "";
            try
            {
                string userId = User.Identity.GetUserId();
                if (db.ReportedWorkers.Any(p => p.WorkerID == wId & p.KafilID == userId) == false)
                {
                    ReportedWorker rw = new ReportedWorker();
                    rw.WorkerID = wId;
                    rw.KafilID = userId;
                    rw.OfficeID = ViewModel.GetAspNetUser(wId).OfficeID;
                    rw.ReportDate = DateTime.Now;
                    rw.HasFakeData = Convert.ToBoolean(HasFakeData);
                    rw.HasInappropriateImages = Convert.ToBoolean(HasInappropriateImages);
                    rw.OtherReason = Convert.ToBoolean(OtherReason);
                    rw.Notes = Notes;
                    rw.Status = clsEnum.ReportedWorkerStatus.تحت_المراجعة_من_قبل_الادارة.ToString();
                    db.ReportedWorkers.Add(rw);
                    db.SaveChanges();
                    retval = "Reported";
                }
                else
                {
                    retval = "AlreadyReportedBefore";
                }
                return Json(retval, JsonRequestBehavior.AllowGet);

            }
            catch (Exception)
            {

                retval = "Exception";
            }
            return Json(retval, JsonRequestBehavior.AllowGet);
        }   
        
       
               [Authorize] 

               [HttpPost]
        public JsonResult RemoveFromFavoriteByAjax(int id)
        {
            string retval = "";
            try
            {
                
               var worker =db.FavoriteLists.Find(id);
                db.FavoriteLists.Remove(worker);
                    db.SaveChanges();
                    retval = "RemovedFromMyFavoriteList";
               
                return Json(retval, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {

                retval = "Exception";
            }
            return Json(retval, JsonRequestBehavior.AllowGet);
        }
        
        [HttpPost]
        [Authorize]

        public JsonResult SendWorkerRequest(string wId)
        {
            string retval = "";
            try
            {
                string userId = User.Identity.GetUserId();
                if (db.WorkerRequests.Any(p => p.WorkerID == wId & p.KafilID==userId) == false)
                {
                    WorkerRequest kWorker = new WorkerRequest();
                    kWorker.WorkerID = wId;
                    kWorker.KafilID = userId;
                    kWorker.OfficeID = ViewModel.GetAspNetUser(wId).OfficeID;
                    kWorker.RequestDate =DateTime.Now;
                    kWorker.RequestStatus = clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString();
                    db.WorkerRequests.Add(kWorker);
                    db.SaveChanges();
                    retval = "ResquestHasBeenSent";
                }
                else
                {
                    retval = "SentBefore";
                }
                return Json(retval, JsonRequestBehavior.AllowGet);

            }
            catch (Exception)
            {

                retval = "Exception";
            }
            return Json(retval, JsonRequestBehavior.AllowGet);
        }


        [Authorize]
        public ActionResult WorkerProfile(int? id)

        {
            if (Request.IsAuthenticated & id != null)
            {

                var worker = db.AspNetUsers.Where(i => i.ShortID == id).FirstOrDefault();


                // زيادة عدد المشاهدات
                if (worker.ViewCount == null)
                {
                    worker.ViewCount = 1;
                }
                else
                {
                    worker.ViewCount += 1;
                }
                db.SaveChanges();
                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", worker.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", worker.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN", worker.JobsID);
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.BirthCountryID = new SelectList(db.Countries, "ID", "NameEN", worker.BirthCountryID);
                    ViewBag.PassportRealseCountryID = new SelectList(db.Countries, "ID", "NameEN", worker.PassportRealseCountryID);
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN", worker.NationalityID);

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", worker.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", worker.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR", worker.JobsID);
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.BirthCountryID = new SelectList(db.Countries, "ID", "NameAR", worker.BirthCountryID);
                    ViewBag.PassportRealseCountryID = new SelectList(db.Countries, "ID", "NameAR", worker.PassportRealseCountryID);
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR", worker.NationalityID);
                }


                


                return View(worker);
            }
            else
            {
                return RedirectToAction("Index");

            }

        }


        [Authorize]
        public ActionResult Profile(int? id)

        {
            if (Request.IsAuthenticated & id != null)
            {
                int percetage = 0;
                var kafil = db.AspNetUsers.Where(i => i.ShortID == id).FirstOrDefault();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", kafil.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", kafil.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN", kafil.JobsID);
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN", 0, kafil.WorkerSkills);
                    ViewBag.BirthCountryID = new SelectList(db.Countries, "ID", "NameEN", kafil.BirthCountryID);
                    ViewBag.PassportRealseCountryID = new SelectList(db.Countries, "ID", "NameEN", kafil.PassportRealseCountryID);

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", kafil.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", kafil.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR", kafil.JobsID);
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR", 0, kafil.WorkerSkills);
                    ViewBag.BirthCountryID = new SelectList(db.Countries, "ID", "NameAR", kafil.BirthCountryID);
                    ViewBag.PassportRealseCountryID = new SelectList(db.Countries, "ID", "NameAR", kafil.PassportRealseCountryID);

                }

               

              

                ViewBag.Percetage = percetage;
                return View(kafil);
            }
            else
            {
                return RedirectToAction("Index", "Office");

            }

        }


        public ActionResult EditKafilImageProfile(int id)
        {

            var cWorker = db.AspNetUsers.Where(i => i.ShortID == id).FirstOrDefault();
            if (cWorker == null)
            {
                return HttpNotFound();
            }

            return PartialView("_EditKafilImageProfile", cWorker);

        }
        [HttpPost]
        public ActionResult EditKafilImageProfile(HttpPostedFileBase ImageUrl, int Id)
        {
            var obj = db.AspNetUsers.Where(i => i.ShortID == Id).FirstOrDefault();

            if (Request.IsAuthenticated)
            {
                if (ImageUrl != null)
                {
                    Guid guid = Guid.NewGuid();
                    string extension = Path.GetExtension(ImageUrl.FileName);
                    string path = Path.Combine(Server.MapPath("~/uploads/kafil/"), guid.ToString() + extension);
                    path = path.Replace(" ", "_");
                    ImageUrl.SaveAs(path);

                    obj.ImageUrl = "/uploads/kafil/" + guid.ToString() + extension;
                }
                else
                {
                    obj.ImageUrl = "/Content/front/assets/img/user.png";
                }
                db.Entry(obj).State = EntityState.Modified;
                db.SaveChanges();
            }
            //int shortId = obj.ShortID;
            //ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
            //ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
            //ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
            //ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
            return RedirectToAction("Index");

        }
        [Authorize]
        public ActionResult UpdateProfile(AspNetUser profile)
        {
            if (Request.IsAuthenticated)
            {
                var UserName = User.Identity.GetUserName();
                var loggedInUser = db.AspNetUsers.Where(i => i.UserName == UserName).FirstOrDefault();

                loggedInUser.FName = profile.FName;
                loggedInUser.LName = profile.LName;
                loggedInUser.Email = profile.Email;
                loggedInUser.Mobile = profile.Mobile;
                loggedInUser.CountryID = profile.CountryID; 
                loggedInUser.CityID = profile.CityID;
                db.SaveChanges();


                //ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", loggedInUser.CountryID);
                //ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", loggedInUser.CityID);
                //ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR", loggedInUser.JobsID);

            }

            return RedirectToAction("Index");


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
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", user.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", user.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN", user.JobsID);

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", user.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", user.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR", user.JobsID);

                }

        

            }
            return RedirectToAction("Index");


        }

    }
}
