using Marofh.Models;
using Microsoft.AspNet.Identity;
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
    [ValidateInput(false)]
    public class WorkerController : Controller
    {

        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        private DBEntities db = new DBEntities();

        public WorkerController()
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

        [Authorize]
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


                

                return View(loggedInUser);
            }
            return RedirectToAction("Login", "Account");

        }
        public WorkerController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
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


            
            return View();
        }

        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            model.UserName = model.Email = Guid.NewGuid().ToString() + "@temp.com";
            model.Password = Membership.GeneratePassword(12, 1);
            model.OfficeID = User.Identity.GetUserId();
            model.IsBlocked = false;
            model.IsActivated = true;
            if (model.CityID == 0)
            {
                 model.CityID = null;
            }
            //model.ConfirmPassword = model.Password;
            var errors = ModelState.Values.SelectMany(v => v.Errors);

            //if (ModelState.IsValid)
            //{

            //var user = new ApplicationUser { FName = model.FName,LName = model.LName, UserName = model.UserName, Email = model.Email, Password = model.Password, Mobile = model.Mobile, RoleID = Convert.ToInt32(clsEnum.Roles.Worker) };
            var user = new ApplicationUser
            {
                FName = model.FName,
                LName = model.LName,
                UserName = model.Email,
                Email = model.Email,
                Password = model.Password,
                Mobile = model.Mobile,
                RoleID = Convert.ToInt32(clsEnum.Roles.Worker),
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
                DOB = model.DOB,
                JobsID = model.JobsID,
                ChildernsCount = model.ChildernsCount,
                ExperienceYearsCount = model.ExperienceYearsCount,
                OfficeID = model.OfficeID,
                Religion = model.Religion,
                MaritalStatus = model.MaritalStatus,
                HasDrivingLicense = model.HasDrivingLicense,
                Gender = model.Gender,
                VideoUrl = model.VideoUrl,
                Brief = model.Brief,
                IsActivated = model.IsActivated,
                IsBlocked = model.IsBlocked,
                Status = clsEnum.Status.متاح.ToString()

            };

            //var isEmailAlreadyExists = db.AspNetUsers.Any(x => x.Email == model.Email & x.RoleID==user.RoleID);
            //if (isEmailAlreadyExists)
            //{
            //    ModelState.AddModelError("Email", "User with this email already exists");
            //    ViewBag.Result = "لكن تم التسجيل بهذا البريد الالكترونى من قبل";


            //    return View(model);
            //}

            var result = await UserManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                var roleresult = UserManager.AddToRole(user.Id, clsEnum.Roles.Worker.ToString());


                // تم ايقاف هذا السطر حتى لايتم تسجيل الدخول اتوماتيكيا بعد  تسجيل حساب جديد
                //   await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);


                return RedirectToAction("index", "Office");
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

            return RedirectToAction("index", "Office");
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

        public ActionResult details(int? id)

        {

            int percetage = 0;
            var worker = db.AspNetUsers.Where(i => i.ShortID == id).FirstOrDefault();
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", worker.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", worker.CityID);
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN", worker.JobsID);
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN", 0, worker.WorkerSkills);
                ViewBag.BirthCountryID = new SelectList(db.Countries, "ID", "NameEN", worker.BirthCountryID);
                ViewBag.PassportRealseCountryID = new SelectList(db.Countries, "ID", "NameEN", worker.PassportRealseCountryID);
                ViewBag.ChildernsCount = worker.ChildernsCount;

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", worker.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", worker.CityID);
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR", worker.JobsID);
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR", 0, worker.WorkerSkills);
                ViewBag.BirthCountryID = new SelectList(db.Countries, "ID", "NameAR", worker.BirthCountryID);
                ViewBag.PassportRealseCountryID = new SelectList(db.Countries, "ID", "NameAR", worker.PassportRealseCountryID);
                ViewBag.ChildernsCount = worker.ChildernsCount;


            }



            if (!string.IsNullOrEmpty(worker.FName))
            {
                percetage += 10;
            }

            if (!string.IsNullOrEmpty(worker.VideoUrl))
            {
                percetage += 10;
            }

            if (!string.IsNullOrEmpty(worker.Brief))
            {
                percetage += 10;
            }

            if (worker.WorkerExpertises.Count > 0)
            {
                percetage += 10;
            }

            if (worker.WorkerCertificates.Count > 0)
            {
                percetage += 10;
            }
            if (worker.WorkerCourses.Count > 0)
            {
                percetage += 10;
            }
            if (worker.WorkerSkills.Count > 0)
            {
                percetage += 10;
            }
            if (worker.WorkerWorkingPlaces.Count > 0)
            {
                percetage += 10;
            }
            if (worker.WorkerLanguages.Count > 0)
            {
                percetage += 10;
            }
            if (worker.Galleries.Count > 0)
            {
                percetage += 10;
            }
           

            ViewBag.Percetage = percetage;
            return View(worker);


        }


        [Authorize]
        public ActionResult Profile(int? id)

        {
            if (Request.IsAuthenticated & id != null)
            {
                int percetage = 0;
                var worker = db.AspNetUsers.Where(i => i.ShortID == id).FirstOrDefault();
                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", worker.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", worker.CityID);
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN", worker.JobsID);
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");
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
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.BirthCountryID = new SelectList(db.Countries, "ID", "NameAR", worker.BirthCountryID);
                    ViewBag.PassportRealseCountryID = new SelectList(db.Countries, "ID", "NameAR", worker.PassportRealseCountryID);
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR", worker.NationalityID);

                }

            

                if (!string.IsNullOrEmpty(worker.FName))
                {
                    percetage += 10;
                }

                if (!string.IsNullOrEmpty(worker.VideoUrl))
                {
                    percetage += 10;
                }

                if (!string.IsNullOrEmpty(worker.Brief))
                {
                    percetage += 10;
                }

                if (worker.WorkerExpertises.Count > 0)
                {
                    percetage += 10;
                }

                if (worker.WorkerCertificates.Count > 0)
                {
                    percetage += 10;
                }
                if (worker.WorkerCourses.Count > 0)
                {
                    percetage += 10;
                }
                if (worker.WorkerSkills.Count > 0)
                {
                    percetage += 10;
                }
                if (worker.WorkerWorkingPlaces.Count > 0)
                {
                    percetage += 10;
                }
                if (worker.WorkerLanguages.Count > 0)
                {
                    percetage += 10;
                }
                if (worker.Galleries.Count > 0)
                {
                    percetage += 10;
                }

                ViewBag.Percetage = percetage;
                return View(worker);
            }
            else
            {
                return RedirectToAction("Index", "Office");

            }

        }


        public ActionResult UpdateProfile(AspNetUser profile, string Id, List<string> SkillsID)
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();

            if (Request.IsAuthenticated)
            {
                

                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();
                cWorker.FName = profile.FName;
                cWorker.LName = profile.LName;
                cWorker.DOB = profile.DOB;
                cWorker.CountryID = profile.CountryID;
                cWorker.CityID = profile.CityID;
                cWorker.JobsID = profile.JobsID;
                cWorker.Gender = profile.Gender;
                cWorker.Religion = profile.Religion;
                cWorker.ChildernsCount = profile.ChildernsCount;
                cWorker.Salary = profile.Salary;
                cWorker.Age = profile.Age;
                cWorker.ExperienceYearsCount = profile.ExperienceYearsCount;
                cWorker.MaritalStatus = profile.MaritalStatus;
                cWorker.BirthCountryID = profile.BirthCountryID;
                cWorker.Weight = profile.Weight;
                cWorker.Height = profile.Height;
                cWorker.IsRoomShared = profile.IsRoomShared;
                cWorker.PassportNo = profile.PassportNo;
                cWorker.PassportRealseCountryID = profile.PassportRealseCountryID;
                cWorker.PassportRealseDate = profile.PassportRealseDate;
                cWorker.PassportExpirationDate = profile.PassportExpirationDate;
                cWorker.RequestAmount = profile.RequestAmount;
                db.SaveChanges();




                List<string> currentSkills = new List<string>();
                if (cWorker.WorkerSkills != null & cWorker.WorkerSkills.Count > 0)
                {
                    foreach (WorkerSkill uf in cWorker.WorkerSkills)
                    {
                        currentSkills.Add(uf.ID.ToString());
                    }
                    if (currentSkills != null && SkillsID != null)
                    {
                        if (SkillsID.SequenceEqual(currentSkills))
                        {
                            // do nothing
                        }
                        else
                        {
                            db.WorkerSkills.RemoveRange(db.WorkerSkills.Where(p => p.WorkerID == cWorker.Id));
                            db.SaveChanges();
                        }
                    }
                }

                if (SkillsID != null)
                {
                    if (SkillsID.Count > 0)
                    {
                        foreach (string f in SkillsID)
                        {
                            WorkerSkill skill = new WorkerSkill();
                            skill.WorkerID = cWorker.Id;
                            skill.SkillID = Convert.ToInt32(f);

                            db.WorkerSkills.Add(skill);
                            db.SaveChanges();
                        }
                    }
                }

               
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new MultiSelectList(db.Skills, "ID", "NameEN", cWorker.WorkerSkills);
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN", cWorker.NationalityID);

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new MultiSelectList(db.Skills, "ID", "NameAR", cWorker.WorkerSkills);
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR", cWorker.NationalityID);

                }

    

                return Redirect("/Worker/profile/" + cWorker.ShortID);
            }

            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");
                ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");
                ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR");

            }

       

            return RedirectToAction("Index", "Office");


        }
        public ActionResult UpdateVideoUrl(AspNetUser profile, string Id)
        {
            if (Request.IsAuthenticated)
            {
                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();

                cWorker.VideoUrl = profile.VideoUrl.Substring(0,43).Replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/");
                db.SaveChanges();


                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");

                }

          

                return Redirect("/Worker/profile/" + cWorker.ShortID);


            }

            return RedirectToAction("Index", "Office");


        }
        [HttpPost]
        public ActionResult UpdateBrief(AspNetUser profile, string Id)
        {
            if (Request.IsAuthenticated)
            {
                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();

                cWorker.Brief = profile.Brief;
                db.SaveChanges();


                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");

                }




                return Redirect("/Worker/profile/" + cWorker.ShortID);

            }

            return RedirectToAction("Index", "Office");


        }

        public ActionResult AddWorkerExpertises(WorkerExpertis workerExpertis, string Id)
        {
            if (Request.IsAuthenticated)
            {
                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();

                workerExpertis.WorkerID = Id;
                db.WorkerExpertises.Add(workerExpertis);
                db.SaveChanges();


                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");

                }
                else
                {

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");

                }



                return Redirect("/Worker/profile/" + cWorker.ShortID);

            }

            return RedirectToAction("Index", "Office");
        }

        public ActionResult EditWorkerExpertis(int id)
        {

            var expertis = db.WorkerExpertises.Find(id);
            if (expertis == null)
            {
                return HttpNotFound();
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", expertis.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", expertis.CityID);

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", expertis.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", expertis.CityID);

            }



  
            return PartialView("_EditWorkerExpertis", expertis);

        }

        [HttpPost]
        public ActionResult EditWorkerExpertis(WorkerExpertis obj)
        {


            db.Entry(obj).State = EntityState.Modified;
            db.SaveChanges();

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                return Redirect("/Worker/profile/" + shortId);

            }
            else
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                return Redirect("/Worker/profile/" + shortId);

            }

           

        }

        public ActionResult DeleteWorkerExpertis(int id)
        {

            var expertis = db.WorkerExpertises.Find(id);
            if (expertis == null)
            {
                return HttpNotFound();
            }
            int shortId = expertis.AspNetUser.ShortID;
            db.WorkerExpertises.Remove(expertis);
            db.SaveChanges();
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");

            }

            
            return Redirect("/Worker/profile/" + shortId);

        }
        public ActionResult AddWorkerCertificates(WorkerCertificate certificate, string Id)
        {
            if (Request.IsAuthenticated)
            {
                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();

                certificate.WorkerID = Id;
                db.WorkerCertificates.Add(certificate);
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

        

                return Redirect("/Worker/profile/" + cWorker.ShortID);

            }

            return RedirectToAction("Index", "Office");
        }


        public ActionResult EditWorkerCertificate(int id)
        {

            var certificate = db.WorkerCertificates.Find(id);
            if (certificate == null)
            {
                return HttpNotFound();
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", certificate.CountryID);

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", certificate.CountryID);

            }

         
            //  ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", certificate.CityID);
            return PartialView("_EditWorkerCertificate", certificate);

        }
        [HttpPost]
        public ActionResult EditWorkerCertificate(WorkerCertificate obj)
        {


            db.Entry(obj).State = EntityState.Modified;
            db.SaveChanges();

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                return Redirect("/Worker/profile/" + shortId);

            }
            else
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                return Redirect("/Worker/profile/" + shortId);

            }

      

        }

        public ActionResult DeleteWorkerCertificate(int id)
        {

            var certificate = db.WorkerCertificates.Find(id);
            if (certificate == null)
            {
                return HttpNotFound();
            }
            int shortId = certificate.AspNetUser.ShortID;
            db.WorkerCertificates.Remove(certificate);
            db.SaveChanges();
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", certificate.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", certificate.CityID);

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", certificate.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", certificate.CityID);

            }
       
            return Redirect("/Worker/profile/" + shortId);

        }



        public ActionResult AddWorkerCourses(WorkerCours course, string Id)
        {
            if (Request.IsAuthenticated)
            {
                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();

                course.WorkerID = Id;
                db.WorkerCourses.Add(course);
                db.SaveChanges();
                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");
                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");

                }

        

                return Redirect("/Worker/profile/" + cWorker.ShortID);

            }

            return RedirectToAction("Index", "Office");
        }


        public ActionResult EditWorkerCourses(int id)
        {

            var course = db.WorkerCourses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");

            }


     
            return PartialView("_EditWorkerCourses", course);

        }
        [HttpPost]
        public ActionResult EditWorkerCourses(WorkerCours obj)
        {

            db.Entry(obj).State = EntityState.Modified;
            db.SaveChanges();

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                return Redirect("/Worker/profile/" + shortId);

            }
            else
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                return Redirect("/Worker/profile/" + shortId);

            }

        
       

        }
        public ActionResult DeleteWorkerCourses(int id)
        {

            var course = db.WorkerCourses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            int shortId = course.AspNetUser.ShortID;

            db.WorkerCourses.Remove(course);
            db.SaveChanges();
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");

            }
            else
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
            }

      
            return Redirect("/Worker/profile/" + shortId);

        }


        public ActionResult AddWorkerSkills(WorkerSkill skill, string Id)
        {
            if (Request.IsAuthenticated)
            {
                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();

                skill.WorkerID = Id;
                db.WorkerSkills.Add(skill);
                db.SaveChanges();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");

                }

            

                return Redirect("/Worker/profile/" + cWorker.ShortID);

            }

            return RedirectToAction("Index", "Office");
        }

        public ActionResult EditWorkerSkill(int id)
        {
            var skill = db.WorkerSkills.Find(id);
            if (skill == null)
            {
                return HttpNotFound();
            }

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");

            }
            else
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");

            }


            return PartialView("_EditWorkerSkill", skill);
        }
        [HttpPost]
        public ActionResult EditWorkerSkill(WorkerSkill obj)
        {


            db.Entry(obj).State = EntityState.Modified;
            db.SaveChanges();

            int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
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
   
            return Redirect("/Worker/profile/" + shortId);

        }
        public ActionResult DeleteWorkerSkill(int id)
        {

            var skill = db.WorkerSkills.Find(id);
            if (skill == null)
            {
                return HttpNotFound();
            }
            int shortId = skill.AspNetUser.ShortID;

            db.WorkerSkills.Remove(skill);
            db.SaveChanges();
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");

            }

            return Redirect("/Worker/profile/" + shortId);

        }







        public ActionResult AddWorkerWorkingPlaces(WorkerWorkingPlace place, string Id)
        {
            if (Request.IsAuthenticated)
            {
                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();

                place.WorkerID = Id;
                db.WorkerWorkingPlaces.Add(place);
                db.SaveChanges();
                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {

                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");


                }



                return Redirect("/Worker/profile/" + cWorker.ShortID);

            }

            return RedirectToAction("Index", "Office");
        }

        public ActionResult EditWorkerWorkingPlace(int id)
        {

            var place = db.WorkerWorkingPlaces.Find(id);
            if (place == null)
            {
                return HttpNotFound();
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", place.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", place.CityID);

            }
            else
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", place.CountryID);
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", place.CityID);

            }



            return PartialView("_EditWorkerWorkingPlace", place);

        }
        [HttpPost]
        public ActionResult EditWorkerWorkingPlace(WorkerWorkingPlace obj)
        {


            db.Entry(obj).State = EntityState.Modified;
            db.SaveChanges();
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                return Redirect("/Worker/profile/" + shortId);

            }
            else
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                return Redirect("/Worker/profile/" + shortId);

            }

            

        }
        public ActionResult DeleteWorkerWorkingPlace(int id)
        {

            var place = db.WorkerWorkingPlaces.Find(id);
            if (place == null)
            {
                return HttpNotFound();
            }
            int shortId = place.AspNetUser.ShortID;

            db.WorkerWorkingPlaces.Remove(place);
            db.SaveChanges();
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
            }
            else
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
            }
   
            return Redirect("/Worker/profile/" + shortId);

        }






        public ActionResult AddWorkerLanguages(WorkerLanguage language, string Id)
        {
            if (Request.IsAuthenticated)
            {
                var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();

                language.WorkerID = Id;
                db.WorkerLanguages.Add(language);
                db.SaveChanges();
                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");

                }
                else
                {
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                    ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");

                }

     

                return Redirect("/Worker/profile/" + cWorker.ShortID);

            }

            return RedirectToAction("Index", "Office");
        }
        public ActionResult EditWorkerLanguage(int id)
        {

            var language = db.WorkerLanguages.Find(id);
            if (language == null)
            {
                return HttpNotFound();
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");

            }
            else
            {
                ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");

            }

           

            return PartialView("_EditWorkerLanguage", language);

        }
        [HttpPost]
        public ActionResult EditWorkerLanguage(WorkerLanguage obj)
        {


            db.Entry(obj).State = EntityState.Modified;
            db.SaveChanges();
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameEN");
                ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");
                return Redirect("/Worker/profile/" + shortId);

            }
            else
            {
                int shortId = db.AspNetUsers.Find(obj.WorkerID).ShortID;
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");
                return Redirect("/Worker/profile/" + shortId);

            }

            

            

        }
        public ActionResult DeleteWorkerLanguage(int id)
        {

            var language = db.WorkerLanguages.Find(id);
            if (language == null)
            {
                return HttpNotFound();
            }
            int shortId = language.AspNetUser.ShortID;

            db.WorkerLanguages.Remove(language);
            db.SaveChanges();

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");

            }
            
            return Redirect("/Worker/profile/" + shortId);

        }


        public ActionResult EditWorkerImageProfile(int id)
        {

            var cWorker = db.AspNetUsers.Where(i => i.ShortID == id).FirstOrDefault();
            if (cWorker == null)
            {
                return HttpNotFound();
            }

            return PartialView("_EditWorkerImageProfile", cWorker);

        }
        [HttpPost]
        public ActionResult EditWorkerImageProfile(HttpPostedFileBase ImageUrl, int Id)
        {
            var obj = db.AspNetUsers.Where(i => i.ShortID == Id).FirstOrDefault();

            if (Request.IsAuthenticated)
            {
                if (ImageUrl != null)
                {
                    Guid guid = Guid.NewGuid();
                    string extension = Path.GetExtension(ImageUrl.FileName);
                    string path = Path.Combine(Server.MapPath("~/uploads/worker/"), guid.ToString() + extension);
                    path = path.Replace(" ", "_");
                    ImageUrl.SaveAs(path);

                    obj.ImageUrl = "/uploads/worker/" + guid.ToString() + extension;
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
            
            return Redirect("/Worker/profile/" + shortId);

        }


        [HttpPost]
        public ActionResult AddWorkerGallery(List<HttpPostedFileBase> gallery, string Id)
        {
            if (Request.IsAuthenticated)
            {
                if ((gallery != null))
                {
                    if (gallery[0] != null)
                    {
                        var cWorker = db.AspNetUsers.Where(i => i.Id == Id).FirstOrDefault();
                        foreach (var file in gallery)
                        {
                            if (file.ContentLength > 0)
                            {

                                Guid guid = Guid.NewGuid();
                                string extension = Path.GetExtension(file.FileName);
                                string path = Path.Combine(Server.MapPath("~/uploads/worker/"), guid.ToString() + extension);
                                path = path.Replace(" ", "_");
                                file.SaveAs(path);
                                Gallery g = new Gallery();
                                g.WorkerID = Id;
                                g.ImageUrl = "/uploads/worker/" + guid.ToString() + extension;
                                db.Galleries.Add(g);
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
                            ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameEN");

                        }
                        else
                        {
                            ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                            ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                            ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                            ViewBag.SkillsID = new SelectList(db.Skills, "ID", "NameAR");
                            ViewBag.LanguageID = new SelectList(db.Languages, "ID", "NameAR");

                        }


                        return Redirect("/Worker/profile/" + cWorker.ShortID);
                    }
                }

                return RedirectToAction("Index", "Office");




            }

            return RedirectToAction("Index", "Office");
        }


        public ActionResult DeleteImageFromGallery(int id)
        {

            var gallery = db.Galleries.Find(id);
            if (gallery == null)
            {
                return HttpNotFound();
            }
            int shortId = gallery.AspNetUser.ShortID;

            db.Galleries.Remove(gallery);
            db.SaveChanges();

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");

            }


          
            return Redirect("/Worker/profile/" + shortId);

        }



        [HttpPost]
        public ActionResult GetNationalitiesByJobIDAndGenderID(int jobId, bool gender)
        {
            // true = Male 
            // false = Female
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();



            int BengaliId = Convert.ToInt32(clsEnum.Nationalities.Bengali);
            int CambodianId = Convert.ToInt32(clsEnum.Nationalities.Cambodian);
            int EgyptienId = Convert.ToInt32(clsEnum.Nationalities.Egyptien);
            int EritreanId = Convert.ToInt32(clsEnum.Nationalities.Eritrean);
            int FilipinoId = Convert.ToInt32(clsEnum.Nationalities.Filipino);
            int IndianId = Convert.ToInt32(clsEnum.Nationalities.Indian);
            int kennyId = Convert.ToInt32(clsEnum.Nationalities.kenny);
            int MadagascarId = Convert.ToInt32(clsEnum.Nationalities.Madagascar);
            int MaliId = Convert.ToInt32(clsEnum.Nationalities.Mali);
            int MauritanianId = Convert.ToInt32(clsEnum.Nationalities.Mauritanian);
            int NigerianId = Convert.ToInt32(clsEnum.Nationalities.Nigerian);
            int PakistaniId = Convert.ToInt32(clsEnum.Nationalities.Pakistani);
            int SouthAfricanId = Convert.ToInt32(clsEnum.Nationalities.SouthAfrican);
            int SriLankanId = Convert.ToInt32(clsEnum.Nationalities.SriLankan);
            int SudaneseId = Convert.ToInt32(clsEnum.Nationalities.Sudanese);
            int TanzanianId = Convert.ToInt32(clsEnum.Nationalities.Tanzanian);
            int UgandanId = Convert.ToInt32(clsEnum.Nationalities.Ugandan);
            int UzbekId = Convert.ToInt32(clsEnum.Nationalities.Uzbek);
            int VietnameseId = Convert.ToInt32(clsEnum.Nationalities.Vietnamese);



            int CookerFemaleId = Convert.ToInt32(clsEnum.Jobs.CookerFemale);
            int CookerMaleId = Convert.ToInt32(clsEnum.Jobs.CookerMale);
            int NannyFemaleId = Convert.ToInt32(clsEnum.Jobs.NannyFemale);
            int NurseFemaleId = Convert.ToInt32(clsEnum.Jobs.NurseFemale);
            int NurseMaleId = Convert.ToInt32(clsEnum.Jobs.NurseMale);
            int PersonalDriverId = Convert.ToInt32(clsEnum.Jobs.PersonalDriver);
            int PhysiotherapistFemaleId = Convert.ToInt32(clsEnum.Jobs.PhysiotherapistFemale);
            int PhysiotherapistMaleId = Convert.ToInt32(clsEnum.Jobs.PhysiotherapistMale);
            int SapphireMaleId = Convert.ToInt32(clsEnum.Jobs.SapphireMale);
            int workerFemaleId = Convert.ToInt32(clsEnum.Jobs.workerFemale);
            int workerMaleId = Convert.ToInt32(clsEnum.Jobs.workerMale);

            if (culture.Contains("en-us"))
            {

                SelectList obj = new SelectList(db.Nationalities, "ID", "NameEN", 0);
                if (jobId == workerMaleId & gender) // عامل
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                   || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == workerFemaleId & gender == false) // عاملة
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   //   p.ID == SudaneseId
                   p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                   || p.ID == BengaliId
                   //|| p.ID ==TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   //|| p.ID ==EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == NannyFemaleId & gender == false) // مربية
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   //   p.ID == SudaneseId
                   p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   //|| p.ID ==PakistaniId
                   // || p.ID ==BengaliId
                   //|| p.ID ==TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   //|| p.ID ==EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == PersonalDriverId & gender) // سائق
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == NurseMaleId & gender) // ممرض
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == NurseFemaleId & gender == false) // ممرضة
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                    //p.ID == SudaneseId
                    p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   // || p.ID ==PakistaniId
                   //|| p.ID ==BengaliId
                   // || p.ID ==TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   // || p.ID ==EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   //|| p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == CookerMaleId & gender) // طباخ
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   //  || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == CookerFemaleId & gender == false) // طباخة
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                    //  p.ID == SudaneseId
                    p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                  //  || p.ID == PakistaniId
                  || p.ID == BengaliId
                   //  || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   // || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   //  || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == PhysiotherapistMaleId & gender) // أخصائي علاج طبيعي
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == PhysiotherapistFemaleId & gender == false) // أخصائية علاج طبيعي
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                    // p.ID == SudaneseId
                    p.ID == FilipinoId
                 // || p.ID == NigerianId
                 // || p.ID == IndianId
                 // || p.ID == PakistaniId
                 //|| p.ID == BengaliId
                 // || p.ID == TanzanianId
                 // || p.ID == SriLankanId
                 || p.ID == VietnameseId
                   // || p.ID == EgyptienId
                   // || p.ID == MauritanianId
                   // || p.ID == UgandanId
                   // || p.ID == EritreanId
                   // || p.ID == MadagascarId
                   // || p.ID == UzbekId
                   // || p.ID == CambodianId
                   // || p.ID == MaliId
                   // || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                if (jobId == SapphireMaleId & gender) // سفرجي 
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameEN", 0);
                    return Json(obj);
                }
                return Json(obj);


            }
            else
            {
                SelectList obj = new SelectList(db.Nationalities, "ID", "NameAR", 0);
                if (jobId == workerMaleId & gender) // عامل
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                   || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == workerFemaleId & gender == false) // عاملة
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   //   p.ID == SudaneseId
                   p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                   || p.ID == BengaliId
                   //|| p.ID ==TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   //|| p.ID ==EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == NannyFemaleId & gender == false) // مربية
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   //   p.ID == SudaneseId
                   p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   //|| p.ID ==PakistaniId
                   // || p.ID ==BengaliId
                   //|| p.ID ==TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   //|| p.ID ==EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == PersonalDriverId & gender) // سائق
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == NurseMaleId & gender) // ممرض
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == NurseFemaleId & gender == false) // ممرضة
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                    //p.ID == SudaneseId
                    p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   // || p.ID ==PakistaniId
                   //|| p.ID ==BengaliId
                   // || p.ID ==TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   // || p.ID ==EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   //|| p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == CookerMaleId & gender) // طباخ
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   //  || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == CookerFemaleId & gender == false) // طباخة
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                    //  p.ID == SudaneseId
                    p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                  //  || p.ID == PakistaniId
                  || p.ID == BengaliId
                   //  || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   // || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   //  || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == PhysiotherapistMaleId & gender) // أخصائي علاج طبيعي
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == PhysiotherapistFemaleId & gender == false) // أخصائية علاج طبيعي
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                    // p.ID == SudaneseId
                    p.ID == FilipinoId
                 // || p.ID == NigerianId
                 // || p.ID == IndianId
                 // || p.ID == PakistaniId
                 //|| p.ID == BengaliId
                 // || p.ID == TanzanianId
                 // || p.ID == SriLankanId
                 || p.ID == VietnameseId
                   // || p.ID == EgyptienId
                   // || p.ID == MauritanianId
                   // || p.ID == UgandanId
                   // || p.ID == EritreanId
                   // || p.ID == MadagascarId
                   // || p.ID == UzbekId
                   // || p.ID == CambodianId
                   // || p.ID == MaliId
                   // || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                if (jobId == SapphireMaleId & gender) // سفرجي 
                {
                    obj = new SelectList(db.Nationalities.Where(p =>
                   p.ID == SudaneseId
                   || p.ID == FilipinoId
                   || p.ID == NigerianId
                   || p.ID == IndianId
                   || p.ID == PakistaniId
                  || p.ID == BengaliId
                   || p.ID == TanzanianId
                   || p.ID == SriLankanId
                   || p.ID == VietnameseId
                   || p.ID == EgyptienId
                   || p.ID == MauritanianId
                   || p.ID == UgandanId
                   || p.ID == EritreanId
                   || p.ID == MadagascarId
                   || p.ID == UzbekId
                   || p.ID == CambodianId
                   || p.ID == MaliId
                   || p.ID == SouthAfricanId
                   || p.ID == kennyId), "ID", "NameAR", 0);
                    return Json(obj);
                }
                return Json(obj);




            }




          



        }

    }
}
