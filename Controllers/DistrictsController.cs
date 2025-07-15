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
    public class DistrictsController : Controller
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
        // GET: Districts
        public ActionResult Index()
        {
            var district = db.Districts.Include(d => d.City);
            return View(district.ToList());
        }

        // GET: Districts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            District district = db.Districts.Find(id);
            if (district == null)
            {
                return HttpNotFound();
            }
            return View(district);
        }

        // GET: Districts/Create
        public ActionResult Create()
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");

            }
            else
            {

                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
            }

            
            return View();
        }

        // POST: Districts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(District district)
        {
            if (ModelState.IsValid)
            {
                db.Districts.Add(district);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", district.CityID);

            }
            else
            {
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", district.CityID);

            }

            
            return View(district);
        }

        // GET: Districts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            District district = db.Districts.Find(id);
            if (district == null)
            {
                return HttpNotFound();
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", district.CityID);

            }
            else
            {
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", district.CityID);

            }


            
            return View(district);
        }

        // POST: Districts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(District district)
        {
            if (ModelState.IsValid)
            {
                db.Entry(district).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN", district.CityID);

            }
            else
            {

                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR", district.CityID);
            }

            
            return View(district);
        }

        // GET: Districts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            District district = db.Districts.Find(id);
            if (district == null)
            {
                return HttpNotFound();
            }
            return View(district);
        }

        // POST: Districts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            District district = db.Districts.Find(id);
            db.Districts.Remove(district);
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


        [HttpPost]
        public ActionResult GetDistrictsByCityID(int cityId)
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {

                SelectList obj = new SelectList(db.Districts.Where(p => p.CityID == cityId), "ID", "NameEN", 0);
                return Json(obj);
            }
            else
            {

                SelectList obj = new SelectList(db.Districts.Where(p => p.CityID == cityId), "ID", "NameAR", 0);
                return Json(obj);
            }

            
            
        }

        [HttpPost]
        public JsonResult GetDistrictByID(string id)
        {
            string latlag = "";
            if (!string.IsNullOrEmpty(id))
            {
                int Id = Convert.ToInt32(id);
                District district = db.Districts.Find(Id);
                latlag = district.Latitude + "#" + district.Longitude;
            }
            else
            {
                // هذا  لمنع  ظهور   الخطأ  في حالة قام باختيار مدينة--  ثم  رجع  للخيار اختر مدينة
                //ونقوم بتحميل خريطة الرياض
                int Id = 5;
                City city = db.Cities.Find(Id);
                latlag = city.Latitude + "#" + city.Longitude;

            }

            return Json(latlag, JsonRequestBehavior.AllowGet);
        }  
        
        [HttpPost]
        public JsonResult GetLocationByDistrictID(string districtId)
        {
            string latlag = "";
            if (!string.IsNullOrEmpty(districtId))
            {

                int Id = Convert.ToInt32(districtId);
                District district = db.Districts.Find(Id);
                latlag = district.Latitude + "#" + district.Longitude;
            }
            else
            {
                // هذا  لمنع  ظهور   الخطأ  في حالة قام باختيار مدينة--  ثم  رجع  للخيار اختر مدينة
                //ونقوم بتحميل خريطة الرياض
                int Id = 5;
                City city = db.Cities.Find(Id);
                latlag = city.Latitude + "#" + city.Longitude;

            }

            return Json(latlag, JsonRequestBehavior.AllowGet);
        }

    }
}
