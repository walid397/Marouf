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
    public class CitiesController : Controller
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
        // GET: Cities
        public ActionResult Index(int? CountryID)
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();

            if (culture.Contains("en-us"))
            {
                if (CountryID == null)
                {
                    var city = db.Cities.Include(c => c.Country);
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    return View(city.ToList());
                }
                else
                {
                    var city = db.Cities.Where(p => p.CountryID == CountryID).Include(c => c.Country);
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                    return View(city.ToList());
                }

            }
            else
            {
                if (CountryID == null)
                {
                    var city = db.Cities.Include(c => c.Country);
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    return View(city.ToList());
                }
                else
                {
                    var city = db.Cities.Where(p => p.CountryID == CountryID).Include(c => c.Country);
                    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                    return View(city.ToList());
                }

            }

            
           
        }

        // GET: Cities/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            City city = db.Cities.Find(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // GET: Cities/Create
        public ActionResult Create()
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
            }

            
            return View();
        }

        // POST: Cities/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(City city)
        {
            if (ModelState.IsValid)
            {
                db.Cities.Add(city);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", city.CountryID);

            }
            else
            {

                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", city.CountryID);
            }

            
            return View(city);
        }

        // GET: Cities/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            City city = db.Cities.Find(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", city.CountryID);
            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", city.CountryID);

            }

            
            return View(city);
        }

        [HttpPost]
        public JsonResult GetCityByID(string id)
        {
            string latlag = "";
            if (!string.IsNullOrEmpty(id))
            {
             
                int Id = Convert.ToInt32(id);
                City city = db.Cities.Find(Id);
                latlag = city.Latitude + "#" + city.Longitude;
            }
            else
            {
                // هذا  لمنع  ظهور   الخطأ  في حالة قام باختيار مدينة--  ثم  رجع  للخيار اختر مدينة
                //ونقوم بتحميل خريطة الرياض
                int Id =5;
                City city = db.Cities.Find(Id);
                latlag = city.Latitude + "#" + city.Longitude;

            }         

            return Json(latlag, JsonRequestBehavior.AllowGet);
        }  
       
        [HttpPost]
        public ActionResult GetCitiesByCountryID(int countryId)
        {

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                SelectList obj = new SelectList(db.Cities.Where(p => p.CountryID == countryId), "ID", "NameEN", 0);
                return Json(obj);

            }
            else
            {
                SelectList obj = new SelectList(db.Cities.Where(p => p.CountryID == countryId), "ID", "NameAR", 0);
                return Json(obj);
            }

         
        }
        // POST: Cities/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(City city)
        {
            if (ModelState.IsValid)
            {
                db.Entry(city).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", city.CountryID);

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", city.CountryID);

            }

            
            return View(city);
        }

        // GET: Cities/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            City city = db.Cities.Find(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // POST: Cities/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            City city = db.Cities.Find(id);
            db.Cities.Remove(city);
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
