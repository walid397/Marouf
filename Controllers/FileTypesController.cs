using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using Marofh;

namespace Marofh.Controllers
{
    public class FileTypesController : Controller
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
        public ActionResult Index()
        {
            return View(db.FileTypes.ToList());
        }

        // GET: FileTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FileType fileType = db.FileTypes.Find(id);
            if (fileType == null)
            {
                return HttpNotFound();
            }
            return View(fileType);
        }

        // GET: FileTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: FileTypes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( FileType fileType)
        {
            if (ModelState.IsValid)
            {
                db.FileTypes.Add(fileType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(fileType);
        }

        // GET: FileTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FileType fileType = db.FileTypes.Find(id);
            if (fileType == null)
            {
                return HttpNotFound();
            }
            return View(fileType);
        }

        // POST: FileTypes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( FileType fileType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(fileType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(fileType);
        }

        // GET: FileTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FileType fileType = db.FileTypes.Find(id);
            if (fileType == null)
            {
                return HttpNotFound();
            }
            return View(fileType);
        }

        // POST: FileTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FileType fileType = db.FileTypes.Find(id);
            db.FileTypes.Remove(fileType);
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
