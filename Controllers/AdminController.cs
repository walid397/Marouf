using Marofh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using System.IO;

namespace Marofh.Controllers
{
    [Authorize(Roles = "Administrators")]
    public class AdminController : Controller
    {
        // GET: Dashboard
        DBEntities db = new DBEntities();
        int officeRoleId = Convert.ToInt32(clsEnum.Roles.Office);
        int kafilRoleId = Convert.ToInt32(clsEnum.Roles.Kafil);
        int workerRoleId = Convert.ToInt32(clsEnum.Roles.Worker);

        public ActionResult Index()
        {
            return View(db);
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

        public ActionResult ManageMails()
        {
            ViewBag.OfficeID = new SelectList(db.AspNetUsers.Where(p => p.RoleID == officeRoleId), "Id", "OfficeName");

            return View(db.Mails);
        }
        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult SendReply(Mail mail, HttpPostedFileBase FileUrl)
        {

            mail.OperatorID = User.Identity.GetUserId();
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
                    return RedirectToAction("ManageMails");
                }
            }
            db.Mails.Add(mail);
            db.SaveChanges();

            return RedirectToAction("ManageMails");
        }
        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult SendNewMessage(Mail mail, HttpPostedFileBase FileUrl)
        {

            mail.OperatorID = User.Identity.GetUserId();
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
                    return RedirectToAction("ManageMails");
                }
            }
            db.Mails.Add(mail);
            db.SaveChanges();

            return RedirectToAction("ManageMails");
        }

        public ActionResult GetMessageDetails(int id)
        {
            var mail = this.db.Mails.Find(id);
            mail.IsRead = true;
            db.SaveChanges();

            var mails = db.Mails.Where(p => p.ID == id || p.MailID == id);
            if (mails == null)
            {
                return HttpNotFound();
            }

            return PartialView("_GetMessageDetails", mails);

        }

        public ActionResult ManageMessages()
        {
            return View(db.ContactUsMessages);
        }
        public ActionResult ManageWallet()
        {

            return View(db.WorkerRequests);
        }

        [HttpPost]
        public ActionResult ManageWallet(FormCollection formCollection)
        {
            string[] ids = formCollection["ID"].Split(new char[] { ',' });
            foreach (string id in ids)
            {
                var request = this.db.WorkerRequests.Find(int.Parse(id));

                request.PaidStatus = clsEnum.WorkerRequestStatus.طلبات_مسددة.ToString();
                request.PaidDate = DateTime.Now;

                this.db.SaveChanges();
            }
            return RedirectToAction("ManageWallet");
        }
        public ActionResult ManageReportedWorkers()
        {

            return View(db.ReportedWorkers);
        }

        public ActionResult ReviewByOffice(int id)
        {
            var report = db.ReportedWorkers.Find(id);
            report.Status = clsEnum.ReportedWorkerStatus.تحت_المراجعة_من_قبل_المكتب.ToString();
            db.SaveChanges();
            return RedirectToAction("ManageReportedWorkers");
        }

        public ActionResult BlockWorker(int id)
        {
            var report = db.ReportedWorkers.Find(id);
            report.Status = clsEnum.ReportedWorkerStatus.حساب_معلق.ToString();
            db.SaveChanges();
            return RedirectToAction("ManageReportedWorkers");
        }

        //تم عمل هذه  الفنكشن  واضافة   
        // k
        // لأنه يحدث خطأ بس  اثنين  فنكشن بنفس   الاسم
        public ActionResult BlockkWorker(int id)
        {
            var report = db.ReportedWorkers.Find(id);
            report.Status = clsEnum.ReportedWorkerStatus.حساب_معلق.ToString();
            db.SaveChanges();
            return RedirectToAction("ManageReportedWorkers");
        }
        public ActionResult BlockWorker(string id)
        {
            var user = db.AspNetUsers.Find(id);
            user.IsBlocked = true;
            db.SaveChanges();
            return RedirectToAction("AllWorkers");
        }
        public ActionResult UnBlockWorker(string id)
        {
            var user = db.AspNetUsers.Find(id);
            user.IsBlocked = false;
            db.SaveChanges();
            return RedirectToAction("AllWorkers");
        }
        public ActionResult BlockOffice(string id)
        {
            var user = db.AspNetUsers.Find(id);
            user.IsBlocked = true;
            db.SaveChanges();
            return RedirectToAction("AllOffices");
        }
        public ActionResult UnBlockOffice(string id)
        {
            var user = db.AspNetUsers.Find(id);
            user.IsBlocked = false;
            db.SaveChanges();
            return RedirectToAction("AllOffices");
        }
        public ActionResult UnVerifiedOffices()
        {

            return View(db.AspNetUsers.Where(p => p.RoleID == officeRoleId & p.IsVerifed == false || p.RoleID == officeRoleId & p.IsVerifed == null));
        }

        public ActionResult VerifiedOffices()
        {

            return View(db.AspNetUsers.Where(p => p.RoleID == officeRoleId & p.IsVerifed == true));
        }
        public ActionResult AllOffices()
        {

            return View(db.AspNetUsers.Where(p => p.RoleID == officeRoleId));
        }
        public ActionResult AllKafils()
        {

            return View(db.AspNetUsers.Where(p => p.RoleID == kafilRoleId));
        }
        public ActionResult AllWorkers()
        {

            return View(db.AspNetUsers.Where(p => p.RoleID == workerRoleId));
        }

        // GET: Dashboard/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Dashboard/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Dashboard/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Dashboard/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Dashboard/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Dashboard/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Dashboard/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }


        public ActionResult ConfirmPayRequest(int id)
        {

            var request = db.WorkerRequests.Find(id);

            if (request == null)

            {
                return HttpNotFound();
            }

            return PartialView("_ConfirmPayRequest", request);

        }
        [HttpPost]
        public ActionResult ConfirmPayRequest(WorkerRequest request, decimal PaiedAmount)
        {

            var temp = db.WorkerRequests.Find(request.ID);

            if (temp == null)

            {
                return HttpNotFound();
            }
            if (temp.Balance == PaiedAmount)
            {
                temp.PaidStatus = clsEnum.WorkerRequestStatus.طلبات_مسددة.ToString();
                temp.PaidDate = DateTime.Now;
            }
            // temp.Balance -= PaiedAmount;

            db.SaveChanges();
            return RedirectToAction("ManageWallet", "Admin");

        }
        public ActionResult SetRequestBalanceToZero(int id)
        {

            var temp = db.WorkerRequests.Find(id);

            if (temp == null)

            {
                return HttpNotFound();
            }
            //يترك بقينه لكى نتمكن من احتساب اجمالى المردود
            //temp.Balance = 0;

            temp.RefundDate = DateTime.Now;
            temp.PaidStatus = clsEnum.WorkerRequestStatus.طلبات_مردودة.ToString();


            db.SaveChanges();
            return RedirectToAction("ManageWallet", "Admin");

        }
        public ActionResult VerifyOffice(int id)
        {

            var office = db.AspNetUsers.Where(p => p.ShortID == id).FirstOrDefault();

            if (office == null)

            {
                return HttpNotFound();
            }
            office.IsVerifed = true;

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {

                ViewModel.SendNotification("Your request has been documented by ESTQDAMI work team ", office.Id, null, User.Identity.GetUserId(), null, clsEnum.NotificationTypes.VerifiyingOffice.ToString());
            }
            else
            {
                ViewModel.SendNotification("تم توثيق طلبك من خلال فريق عمل استقدامي", office.Id, null, User.Identity.GetUserId(), null, clsEnum.NotificationTypes.VerifiyingOffice.ToString());

            }

            

            db.SaveChanges();
            return RedirectToAction("UnVerifiedOffices", "Admin");

        }
        public ActionResult ConvertMessageToReaded(int id)
        {

            var msg = db.ContactUsMessages.Find(id);
            if (msg == null)
            {
                return HttpNotFound();
            }
            msg.IsRead = true;
            db.SaveChanges();
            return RedirectToAction("ManageMessages", "Admin");
        }
        public ActionResult DeleteMessage(int id)
        {

            var msg = db.ContactUsMessages.Find(id);
            if (msg == null)
            {
                return HttpNotFound();
            }
            db.ContactUsMessages.Remove(msg);
            db.SaveChanges();
            return RedirectToAction("ManageMessages", "Admin");

        }

        public ActionResult DeleteWorker(int? id)
        {
            if (Request.IsAuthenticated)
            {

                var worker = db.AspNetUsers.Where(p => p.ShortID == id).FirstOrDefault();
                if (worker != null)
                {
                    // حذف كل ماهو متعلق بهذا العامل
                    db.WorkerWorkingPlaces.RemoveRange(db.WorkerWorkingPlaces.Where(p => p.AspNetUser.ShortID == id));
                    db.WorkerCourses.RemoveRange(db.WorkerCourses.Where(p => p.AspNetUser.ShortID == id));
                    db.WorkerExpertises.RemoveRange(db.WorkerExpertises.Where(p => p.AspNetUser.ShortID == id));
                    db.WorkerLanguages.RemoveRange(db.WorkerLanguages.Where(p => p.AspNetUser.ShortID == id));
                    db.WorkerRequests.RemoveRange(db.WorkerRequests.Where(p => p.AspNetUser1.ShortID == id));

                    // حذف  العامل
                    db.AspNetUsers.Remove(worker);
                    db.SaveChanges();
                }



            }
            return RedirectToAction("ManageReportedWorkers");

        }

        public ActionResult GetKafilRequests(int id)
        {

            if (Request.IsAuthenticated)
            {

                var kafil = db.AspNetUsers.Where(p => p.ShortID == id).FirstOrDefault();
                if (kafil != null)
                {
                    return PartialView("_GetKafilRequests", kafil);
                }


            }

            return PartialView("_GetKafilRequests", null);
        }
    }
}
