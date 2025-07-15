using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace Marofh.Controllers
{
    [Authorize(Roles = "Administrators")]
    public class NewsLettersController : Controller
    {
        private DBEntities db = new DBEntities();

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
        // GET: NewsLetters
        [ValidateInput(false)]
        public ActionResult Index(string Message,string Subject)
        {
            if (!String.IsNullOrEmpty(Message) & !String.IsNullOrEmpty(Subject))
            {
                SmtpClient smtp = new SmtpClient();

                MailMessage mail = new MailMessage("info@ebdasoft.com", "info@dorr-sa.com");
                mail.CC.Add("fady@ebdasoft.com");
                mail.Subject = Subject;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;

                mail.Body = Message;
                //  smtp.Send(mail);
                //return RedirectToAction("thanks", "Messages");
                ViewBag.Result = "تم الارسال بنجاح";
            }
       
            return View(db.NewsLetters.ToList());
        }

        // GET: NewsLetters/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsLetter newsLetter = db.NewsLetters.Find(id);
            if (newsLetter == null)
            {
                return HttpNotFound();
            }
            return View(newsLetter);
        }

        // GET: NewsLetters/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: NewsLetters/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NewsLetter newsLetter)
        {
            if (ModelState.IsValid)
            {
                db.NewsLetters.Add(newsLetter);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(newsLetter);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult Subscribe(string Email)
        {
            if (ModelState.IsValid)
            {
                if (db.NewsLetters.Where(p => p.Email == Email).FirstOrDefault()!= null)
                {
                    return RedirectToAction("subscribed_before", "messages");
                   
                }
                else
                {
                    NewsLetter n = new NewsLetter();
                    n.Email = Email;
                    n.IsSubscribed = true;
                    db.NewsLetters.Add(n);
                    db.SaveChanges();
                    return RedirectToAction("subscribed", "messages");
                }
            }

            return RedirectToAction("subscribed_before", "messages");
        }
        // GET: NewsLetters/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsLetter newsLetter = db.NewsLetters.Find(id);
            if (newsLetter == null)
            {
                return HttpNotFound();
            }
            return View(newsLetter);
        }

        // POST: NewsLetters/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NewsLetter newsLetter)
        {
            if (ModelState.IsValid)
            {
                db.Entry(newsLetter).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(newsLetter);
        }

        // GET: NewsLetters/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsLetter newsLetter = db.NewsLetters.Find(id);
            if (newsLetter == null)
            {
                return HttpNotFound();
            }
            return View(newsLetter);
        }

        // POST: NewsLetters/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NewsLetter newsLetter = db.NewsLetters.Find(id);
            db.NewsLetters.Remove(newsLetter);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
