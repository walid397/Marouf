using Marofh.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Threading;
using System.Collections.Generic;

namespace Marofh.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        //protected override IAsyncResult BeginExecuteCore(AsyncCallback callback, object state)
        //{
        //    string cultureName = null;

        //    // Attempt to read the culture cookie from Request
        //    HttpCookie cultureCookie = Request.Cookies["_culture"];
        //    if (cultureCookie != null)
        //        cultureName = cultureCookie.Value;
        //    else
        //        cultureName = Request.UserLanguages != null && Request.UserLanguages.Length > 0 ? Request.UserLanguages[0] : null; // obtain it from HTTP header AcceptLanguages


        //    // Modify current thread's cultures           
        //    Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureName);
        //    Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;

        //    return base.BeginExecuteCore(callback, state);
        //}


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

        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
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

        //// GET: /Account/Login
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken()]
        //public ActionResult Login(string returnUrl)
        //{
        //    ViewBag.ReturnUrl = returnUrl;

        //    return View();
        //}
          // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login()
        {

            return View();
        }
         [AllowAnonymous]
        public ActionResult ConfirmationMessage()
        {

            return View();
        }
         [AllowAnonymous]
        public ActionResult VerifiedAccount()
        {

            return View();
        }


        public ViewResult testmail()
        {
            if (ModelState.IsValid)
            {
                MailMessage mail = new MailMessage();
                mail.To.Add("fady.khafagy@gmail.com");
                mail.From = new MailAddress("marofhwebsite@gmail.com");
                mail.Subject = "Test from Fady";
                string Body = "test fady test";
                mail.Body = Body;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("marofhwebsite@gmail.com", "@Marofh@2021@"); // Enter seders User name and password  
                smtp.EnableSsl = true;
                smtp.Send(mail);
                return View();   
            }
            else
            {
                return View();
            }
        }

        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken()]
        //public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        //{
        //    model.Email = model.UserName;
        //    if (!ModelState.IsValid)
        //    {
        //        // This doesn't count login failures towards account lockout
        //        // To enable password failures to trigger account lockout, change to shouldLockout: true
        //        var result = await SignInManager.PasswordSignInAsync(model.UserName, model.Password, model.RememberMe, shouldLockout: false);
        //        switch (result)
        //        {
        //            case SignInStatus.Success:
        //                return RedirectToLocal(returnUrl);
        //            // return RedirectToLocal("/admin/");
        //            case SignInStatus.LockedOut:
        //                return View("Lockout");
        //            case SignInStatus.RequiresVerification:
        //                return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });
        //            case SignInStatus.Failure:
        //            default:
        //                ModelState.AddModelError("", "برجاء التاكد من اسم المستخدم وكلمة المرور");
        //                return View(model);
        //        }
        //    }
        //    return View(model);
        //}


        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [HttpPost]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl, string rurl)
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();

            if (!ModelState.IsValid)
                return View(model);

            // نجيب المستخدم عن طريق الإيميل أو الجوال
            var user = db.AspNetUsers.FirstOrDefault(u =>
                u.Email.Equals(model.Identifier, StringComparison.OrdinalIgnoreCase) ||
                u.Mobile == model.Identifier);

            if (user == null)
            {
                ModelState.AddModelError("", culture.Contains("en-us")
                    ? "Error .. Mobile number or email is incorrect"
                    : "خطأ .. رقم الجوال أو البريد الإلكتروني غير صحيح");
                return View(model);
            }

            // تسجيل الدخول باستخدام UserName من قاعدة البيانات
            var result = await SignInManager.PasswordSignInAsync(user.UserName, model.Password, model.RememberMe, shouldLockout: false);

            switch (result)
            {
                case SignInStatus.Success:

                    // كوكز التذكير
                    if (model.RememberMe)
                    {
                        var cookie = FormsAuthentication.GetAuthCookie(user.UserName, model.RememberMe);
                        cookie.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(cookie);
                    }
                    else
                    {
                        FormsAuthentication.SetAuthCookie(user.UserName, model.RememberMe);
                    }

                    // التحقق من التنشيط
                    if (Convert.ToBoolean(user.IsActivated) == false)
                    {
                        ViewBag.Result = culture.Contains("en-us")
                            ? "Error .. Please activate your account first so that you can use ESTQDAMI platform"
                            : "خطأ .. برجاء تنشيط حسابك أولاً حتى تتمكن من استخدام منصة إستقدامي";

                        ModelState.AddModelError("", ViewBag.Result);
                        return View();
                    }

                    // حفظ آخر دخول
                    user.LastLoggedInDate = DateTime.Now;
                    db.SaveChanges();

                    // التوجيه حسب الدور
                    if (await UserManager.IsInRoleAsync(user.Id, clsEnum.Roles.Administrators.ToString()))
                        return RedirectToLocal("/admin/");

                    if (await UserManager.IsInRoleAsync(user.Id, clsEnum.Roles.Office.ToString()))
                        return RedirectToLocal("/office/");

                    if (await UserManager.IsInRoleAsync(user.Id, clsEnum.Roles.Kafil.ToString()))
                        return RedirectToLocal("/Kafil/");

                    if (!string.IsNullOrEmpty(returnUrl))
                        return RedirectToLocal(returnUrl);
                    else
                        return RedirectToLocal(rurl);

                case SignInStatus.LockedOut:
                    return View("Lockout");

                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });

                case SignInStatus.Failure:
                default:
                    ViewBag.Result = culture.Contains("en-us")
                        ? "Error .. Please check your username and password "
                        : "خطأ .. برجاء مراجعة اسم المستخدم وكلمة المرور";

                    ModelState.AddModelError("", culture.Contains("en-us")
                        ? "Please verify your username and password"
                        : "برجاء التأكد من اسم المستخدم وكلمة المرور");

                    return View();
            }
        }




        [AllowAnonymous]
        public async Task<ActionResult> ActivateAccount(string userId)
        {
            AspNetUser user = db.AspNetUsers.Find(userId);
            if (user != null)
            {
                user.IsActivated = true;
                user.LastLoggedInDate = DateTime.Now;
                db.SaveChanges();

                // تسجيل الدخول مباشرة بعد التفعيل
                var result = await SignInManager.PasswordSignInAsync(user.UserName, user.Password, true, shouldLockout: false);
            }

            return RedirectToAction("Index", "Home");
        }


        //
        // GET: /Account/VerifyCode
        [AllowAnonymous]
        public async Task<ActionResult> VerifyCode(string provider, string returnUrl, bool rememberMe)
        {
            // Require that the user has already logged in via username/password or external login
            if (!await SignInManager.HasBeenVerifiedAsync())
            {
                return View("Error");
            }
            return View(new VerifyCodeViewModel { Provider = provider, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/VerifyCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyCode(VerifyCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // The following code protects for brute force attacks against the two factor codes. 
            // If a user enters incorrect codes for a specified amount of time then the user account 
            // will be locked out for a specified amount of time. 
            // You can configure the account lockout settings in IdentityConfig
            var result = await SignInManager.TwoFactorSignInAsync(model.Provider, model.Code, isPersistent: model.RememberMe, rememberBrowser: model.RememberBrowser);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(model.ReturnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "Invalid code.");
                    return View(model);
            }
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        [AllowAnonymous]
        public async Task<ActionResult> CreateUser(AspNetUser user, string UserName, string Password, string Email, string FName,string LName, string Mobile)
        {

            if (ModelState.IsValid)
            {
                await CreateDBUser(UserName, Password, Email, FName, LName, Mobile);

                return RedirectToLocal("/messages/registered");
            }
            return View(user);
        }
        ApplicationUser user1;
        public async Task CreateDBUser(string userName, string password, string email, string fname,string lname, string mobile)
        {
            user1 = new ApplicationUser()
            {
                UserName = userName,
                Email = email,
                EmailConfirmed = true,
                LockoutEnabled = false,
                Password = password,
                Mobile = mobile,
                FName = fname,
                LName = lname

            };

            //  user1.ImageUrl = "/Content/frontend/assets/images/reviewer.jpg";
            var result = await UserManager.CreateAsync(user1, password);


            if (result.Succeeded)
            {

                var roleresult = UserManager.AddToRole(user1.Id, clsEnum.Roles.Administrators.ToString());

            }
        }
        public bool IsValidMailAddress(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        [HttpPost]
        [AllowAnonymous]
        public JsonResult IsRegistered(string email)

        {
            string retval = "";
            try
            {

                if (IsValidMailAddress(email))
                {

                    if (email.Contains(".") & !email.EndsWith(".") & !email.EndsWith(" "))
                    {

                        if (db.AspNetUsers.Any(r => r.Email == email.Trim()))
                        {
                            retval = "Registered";
                        }
                        else
                        {
                            retval = "NotRegistered";
                        }
                    }
                    else
                    {
                        retval = "NotVaild";
                    }
                    return Json(retval, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {

                retval = "NotVaild";
            }

            retval = "NotVaild";
            return Json(retval, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [AllowAnonymous]
        public JsonResult CheckMobile(string mobile)

        {
            string retval = "";
            try
            {
                if (!string.IsNullOrEmpty(mobile))
                {
                    if (mobile.Length == 10) 
                    {                  

                    if (db.AspNetUsers.Any(r => r.Mobile == mobile.Trim()))
                    {
                        retval = "MobileExisted";
                    }
                    else
                    {
                        retval = "MobileNotExisted";
                    }
                    }
                    else
                    {
                        retval = "LessThanTen";
                    }
                }
                else
                {

                }
                return Json(retval, JsonRequestBehavior.AllowGet);

            }
            catch (Exception)
            {

                retval = "NotVaild";
            }

            retval = "NotVaild";
            return Json(retval, JsonRequestBehavior.AllowGet);
        }

        //      [HttpPost]
        [AllowAnonymous]
        public JsonResult IsUniq(string name)
        {
            string retval = "";
            if (Regex.IsMatch(name, "^[A-Za-z0-9-_\\s]*$"))
            {

                if (name.Length >= 8)
                {


                    if (db.AspNetUsers.Any(r => r.FName == name.Trim()))
                    {
                        retval = "false";
                    }
                    else
                    {
                        retval = "true";
                    }
                }
                else
                {
                    retval = "TooShort";
                }
                return Json(retval, JsonRequestBehavior.AllowGet);
            }
            retval = "NotEnglish";
            return Json(retval, JsonRequestBehavior.AllowGet);
        }
        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            model.UserName = model.Email;
            //model.ConfirmPassword = model.Password;
            var errors = ModelState.Values.SelectMany(v => v.Errors);

            //if (ModelState.IsValid)
            //{

            var user = new ApplicationUser { FName = model.FName,LName = model.LName, UserName = model.UserName, Email = model.Email, Password = model.Password, Mobile = model.Mobile,RoleID= Convert.ToInt32(clsEnum.Roles.Administrators) };
            var isEmailAlreadyExists = db.AspNetUsers.Any(x => x.Email == model.Email);
            if (isEmailAlreadyExists)
            {
                ModelState.AddModelError("Email", "User with this email already exists");
                return RedirectToAction("registered_before", "messages");
            }
            var result = await UserManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);

                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                // Send an email with this link
                // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");

                var roleresult = UserManager.AddToRole(user.Id, clsEnum.Roles.Administrators.ToString());


                return RedirectToAction("index", "Home");
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
            return View(model);
           // return RedirectToAction("index", "Home");
        }

        //
        // GET: /Account/ConfirmEmail
        [AllowAnonymous]
        public async Task<ActionResult> ConfirmEmail(string userId, string code)
        {
            if (userId == null || code == null)
            {
                return View("Error");
            }
            var result = await UserManager.ConfirmEmailAsync(userId, code);
            return View(result.Succeeded ? "ConfirmEmail" : "Error");
        }

        //
        // GET: /Account/ForgotPassword
        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        //
        // POST: /Account/ForgotPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ForgotPassword(ForgotPasswordViewModel model)
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (ModelState.IsValid)
            {


                var user = await UserManager.FindByNameAsync(model.Email);
                if (user != null)
                {

                    // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                    // Send an email with this link
                    string code = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
                    var callbackUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                    if (culture.Contains("en-us"))
                    {
                        await UserManager.SendEmailAsync(user.Id, "استرجاع حسابك فى استقدامي", "مرحبا بك فى منصة استقدامي لتغير كلمة المرور الخاص بك برجاء الضغط  <a href=\"" + callbackUrl + "\">هنا</a>");

                    }
                    else
                    {
                        await UserManager.SendEmailAsync(user.Id, "Recover your account in ESTQDAMI", "Welcome to ESTQDAMI platform. To change your password, please click   <a href=\"" + callbackUrl + "\">Here</a>");

                    }


               

                    return RedirectToAction("ForgotPasswordConfirmation", "Account");
                }
            }
            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ForgotPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ForgotPasswordConfirmation()
        {
            return View();
        }

        //
        // GET: /Account/ResetPassword
        [AllowAnonymous]
        public ActionResult ResetPassword(string code)
        {
            return code == null ? View("Error") : View();
        }

        //
        // POST: /Account/ResetPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var user = await UserManager.FindByNameAsync(model.Email);
            if (user == null)
            {
                // Don't reveal that the user does not exist
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            var result = await UserManager.ResetPasswordAsync(user.Id, model.Code, model.Password);
            if (result.Succeeded)
            {
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            AddErrors(result);
            return View();
        }

        //
        // GET: /Account/ResetPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ResetPasswordConfirmation()
        {
            return View();
        }

        //
        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // Request a redirect to the external login provider
            return new ChallengeResult(provider, Url.Action("External4Callback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/SendCode
        [AllowAnonymous]
        public async Task<ActionResult> SendCode(string returnUrl, bool rememberMe)
        {
            var userId = await SignInManager.GetVerifiedUserIdAsync();
            if (userId == null)
            {
                return View("Error");
            }
            var userFactors = await UserManager.GetValidTwoFactorProvidersAsync(userId);
            var factorOptions = userFactors.Select(purpose => new SelectListItem { Text = purpose, Value = purpose }).ToList();
            return View(new SendCodeViewModel { Providers = factorOptions, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/SendCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SendCode(SendCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            // Generate the token and send it
            if (!await SignInManager.SendTwoFactorCodeAsync(model.SelectedProvider))
            {
                return View("Error");
            }
            return RedirectToAction("VerifyCode", new { Provider = model.SelectedProvider, ReturnUrl = model.ReturnUrl, RememberMe = model.RememberMe });
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }

            // Sign in the user with this external login provider if the user already has a login
            var result = await SignInManager.ExternalSignInAsync(loginInfo, isPersistent: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(returnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = false });
                case SignInStatus.Failure:
                default:
                    // If the user does not have an account, then prompt the user to create an account
                    ViewBag.ReturnUrl = returnUrl;
                    ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
                    return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { Email = loginInfo.Email });
            }
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Manage");
            }

            if (ModelState.IsValid)
            {
                // Get the information about the user from the external login provider
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user);
                if (result.Succeeded)
                {
                    result = await UserManager.AddLoginAsync(user.Id, info.Login);
                    if (result.Succeeded)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        return RedirectToLocal(returnUrl);
                    }
                }
                AddErrors(result);
            }

            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // POST: /Account/LogOff
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (_userManager != null)
                {
                    _userManager.Dispose();
                    _userManager = null;
                }

                if (_signInManager != null)
                {
                    _signInManager.Dispose();
                    _signInManager = null;
                }
            }

            base.Dispose(disposing);
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

            if(string .IsNullOrEmpty(returnUrl))
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


        private DBEntities db = new DBEntities();
        public  ActionResult BrokerProfile()
        {
            if (Request.IsAuthenticated)
            {
                var UserName = User.Identity.GetUserName();
                var comp = db.AspNetUsers.Where(i => i.UserName == UserName).First();
                return View(comp);

            }
            else
            {
                return RedirectToLocal("/Account/Login");
            }

        }

        [Authorize]
        [HttpPost]
        public ActionResult BrokerProfile(AspNetUser aspNetUsers)
        {
            if (Request.IsAuthenticated)
            {
                Message = string.Empty;
                var UserName = User.Identity.GetUserName();
                var temp = db.AspNetUsers.Where(i => i.UserName == UserName).First();


                temp.FName = aspNetUsers.FName;
                temp.LName = aspNetUsers.LName;
                temp.CommercialRegisterNO = aspNetUsers.CommercialRegisterNO;
                temp.CommercialRegisterExpirationDate = aspNetUsers.CommercialRegisterExpirationDate;
                temp.LicenseNo = aspNetUsers.LicenseNo;
                temp.LicenseNoExpirationDate = aspNetUsers.LicenseNoExpirationDate;
         
                db.SaveChanges();

                return RedirectToLocal("/Broker/CreateProperty");


            }


            return View("BrokerProfile", aspNetUsers);
   

        }




        [Authorize]
        public ActionResult UserProfile()
        {
            if (Request.IsAuthenticated)
            {
                var UserName = User.Identity.GetUserName();
                var comp = db.AspNetUsers.Where(i => i.UserName == UserName).First();

                var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
                if (culture.Contains("en-us"))
                {
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN");
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.RoleID = new SelectList(db.AspNetRoles.Where(p => p.IsShow == true), "ID", "NameEN", comp.RoleID);

                }
                else
                {
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR");
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.RoleID = new SelectList(db.AspNetRoles.Where(p => p.IsShow == true), "ID", "NameAR", comp.RoleID);

                }




      

                return View(comp);

            }
            else
            {
                return RedirectToLocal("/Account/Login");
            }
        }

        static string Message = string.Empty;
        [Authorize]
        [HttpPost]
        public async Task<ActionResult> UserProfile(AspNetUser aspNetUsers)
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();

            if (Request.IsAuthenticated)
            {
                Message = string.Empty;
                var UserName = User.Identity.GetUserName();
                var temp = db.AspNetUsers.Where(i => i.UserName == UserName).First();


                // البيانات الشخصية

                temp.Email = aspNetUsers.Email;

                if (aspNetUsers.FName.Length < 8)
                {
                    if (culture.Contains("en-us"))
                    {
                        ViewBag.Message = Message = "The name field cannot be less than 8 characters";
                        ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN", aspNetUsers.NationalityID);
                        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", aspNetUsers.CountryID);
                        ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", aspNetUsers.CityID);

                    }
                    else
                    {
                        ViewBag.Message = Message = "لا يمكن ان يقل حقل الاسم عن 8 أحرف";
                        ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR", aspNetUsers.NationalityID);
                        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", aspNetUsers.CountryID);
                        ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", aspNetUsers.CityID);

                    }             

          
                    return View("UserProfile", aspNetUsers);
                }
                if (temp.FName == aspNetUsers.FName && temp.Id != User.Identity.GetUserId())
                {
                    if (culture.Contains("en-us"))
                    {
                        ViewBag.Message = Message = "- اسم المستخدم " + aspNetUsers.FName + " مستخدم من قبل من خلال مستخدم اخر ";
                        ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR", aspNetUsers.NationalityID);
                        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", aspNetUsers.CountryID);
                        ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", aspNetUsers.CityID);
                        ViewBag.RoleID = new SelectList(db.AspNetRoles.Where(p => p.IsShow == true), "ID", "NameAR", aspNetUsers.RoleID);

                    }
                    else
                    {
                        ViewBag.Message = Message = "- UserName " + aspNetUsers.FName + " Previously used by another user";
                        ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN", aspNetUsers.NationalityID);
                        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", aspNetUsers.CountryID);
                        ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", aspNetUsers.CityID);
                        ViewBag.RoleID = new SelectList(db.AspNetRoles.Where(p => p.IsShow == true), "ID", "NameEN", aspNetUsers.RoleID);

                    }

                    

                    return View("UserProfile", aspNetUsers);
                }



                temp.UserName = aspNetUsers.Email;
                temp.RoleID = aspNetUsers.RoleID;
                temp.FName = aspNetUsers.FName;  
                temp.LName = aspNetUsers.LName;
                temp.NationalityID = aspNetUsers.NationalityID;
                temp.Mobile = aspNetUsers.Mobile;
                temp.WhatsAppNo = aspNetUsers.WhatsAppNo;
                temp.CountryID = aspNetUsers.CountryID;
                temp.CityID = aspNetUsers.CityID;

                //بيانات العمل

            
                temp.CommercialRegisterNO = aspNetUsers.CommercialRegisterNO;            

                db.SaveChanges();

                if (culture.Contains("en-us"))
                {
                    ViewBag.Message = Message = "Data saved successfully ";

                }
                else
                {
                    ViewBag.Message = Message = "تم حفظ البيانات بنجاح ";

                }



              

                if (!string.IsNullOrEmpty(aspNetUsers.Password))
                {
                    temp.Password = aspNetUsers.Password;

                    var store = new UserStore<ApplicationUser>(db);
                    var manager = new UserManager<ApplicationUser>(store);

                    if (manager.HasPassword(User.Identity.GetUserId()))
                    {

                        manager.RemovePassword(User.Identity.GetUserId());
                    }
                    var newPasswordHash = manager.PasswordHasher.HashPassword(temp.Password);
                    ApplicationUser user = manager.FindById(temp.Id);
                    await store.SetPasswordHashAsync(user, newPasswordHash);
                    await manager.UpdateAsync(user);
                    if (culture.Contains("en-us"))
                    {
                        ViewBag.Message = Message = "Data saved successfully ";
                    }
                    else
                    {
                        ViewBag.Message = Message = "تم حفظ البيانات بنجاح ";
                    }
                   

                }

                if (culture.Contains("en-us"))
                {
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR", aspNetUsers.NationalityID);
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", aspNetUsers.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", aspNetUsers.CityID);
                    ViewBag.RoleID = new SelectList(db.AspNetRoles.Where(p => p.IsShow == true), "ID", "NameAR", aspNetUsers.RoleID);

                }
                else
                {
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN", aspNetUsers.NationalityID);
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", aspNetUsers.CountryID);
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", aspNetUsers.CityID);
                    ViewBag.RoleID = new SelectList(db.AspNetRoles.Where(p => p.IsShow == true), "ID", "NameEN", aspNetUsers.RoleID);

                }

                

               if(temp.RoleID==Convert.ToInt32(clsEnum.Roles.Administrators))
                {
                    return RedirectToLocal("/pages/plans");
                }
                return View("UserProfile", aspNetUsers);

            }
            else
            {
                return RedirectToLocal("/Account/UserProfile");
            }
        }


      
     

    }

}