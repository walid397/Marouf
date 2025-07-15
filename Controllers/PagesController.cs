using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Marofh;
using System.Threading;

namespace Marofh.Controllers
{    [ValidateInput(false)]
    //[Authorize(Roles = "Administrators")]
    public class PagesController : Controller
    {

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


        // Used to set language culture. 
        //Called during radio button click event
        public ActionResult SetCulture(string culture)
        {
            // Save culture in a cookie

            HttpCookie cookie = Request.Cookies["_culture"];
            if (cookie == null)
            {
                cookie = new HttpCookie("_culture");
            }

            if (culture == "en")
            {
                cookie.Value = "en-us";
            }
            if (culture == "ar")
            {
                cookie.Value = "ar-sa";
            }

            cookie.Value = "ar-sa";
            cookie.Expires = DateTime.Now.AddYears(1);

            Response.Cookies.Add(cookie);
            return RedirectToAction("Index");

        }

        private DBEntities db = new DBEntities();

        // GET: Pages
     
        public ActionResult Index()
        {
            return View(db.Pages);
        }
        [AllowAnonymous]
        public ActionResult Plans()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult Contacts()
        {
            return View(db.Contacts.FirstOrDefault());
        }
  

        // GET: Pages/Details/5   
        [AllowAnonymous]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }


        // GET: Pages/Create
        public ActionResult Create()
        {
            return View();
        }
      

        // POST: Pages/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Page page)
        {
            if (ModelState.IsValid)
            {
             
                db.Pages.Add(page);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            return View(page);
        }

        // GET: Pages/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }
        // GET: Pages/inner/5
        [AllowAnonymous]
        public ActionResult inner(int? id)
        {
            ViewBag.PId = id;
            return View(db);
  
        }

        // POST: Pages/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Page page)
        {
            if (ModelState.IsValid)
            {
               
                db.Entry(page).State = EntityState.Modified;
                db.SaveChanges();
              //  return RedirectToAction("Index");
            }
            return View(page);
        }

        // GET: Pages/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        // POST: Pages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Page page = db.Pages.Find(id);
            db.Pages.Remove(page);
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
