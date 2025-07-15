using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Threading;
using System.Reflection;
using Marofh.Models;
using Resources;

namespace Marofh.Controllers
{
    public class HomeController : Controller
    {
        DBEntities db = new DBEntities();
        int workerRoleId = Convert.ToInt32(clsEnum.Roles.Worker);


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

            // cookie.Value = "ar-sa";
            cookie.Expires = DateTime.Now.AddYears(1);

            Response.Cookies.Add(cookie);
            return RedirectToAction("Index");

        }


        [AllowAnonymous]


        public ActionResult Index()
        {
            // Save culture in a cookie

            // HttpCookie cookie = Request.Cookies["_culture"];
            // if (cookie == null)
            // {
            //     cookie = new HttpCookie("_culture");
            // }


            //// cookie.Value = "ar-sa";
            // cookie.Expires = DateTime.Now.AddYears(1);
            //  Response.Cookies.Add(cookie);

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {

                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN");
            }
            else
            {

                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR");
            }


            var page = db.Pages.FirstOrDefault(p => p.NameEN == "About" || p.NameEN == "Contactus");
            if (page == null)
            {
                return HttpNotFound();
            }
            ViewBag.Page = page;
            return View(ViewBag.Page);
        }
        public ActionResult Result(int? nid, string CountryID, string[] NationalityID, string Range, string maxAge, string minExperienceYearsCount, string maxExperienceYearsCount, bool? Gender, string[] JobsID, bool? Religion, string ExperienceYearsCount, string RequestAmountSort, string HasChilderns, string yearsOfExperience, List<int> CountryIds , string MaritalStatus , string SalarySort)
        {

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            if (culture.Contains("en-us"))
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");
                ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN");

            }
            else
            {
                ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
                ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR");

            }
            if (NationalityID != null)
            {
                var selectedNationalities = db.Nationalities
                    .Where(n => NationalityID.Contains(n.ID.ToString()))
                    .Select(n => new SelectListItem
                    {
                        Value = n.ID.ToString(),
                        Text = culture.Contains("en-us") ? n.NameEN : n.NameAR
                    }).ToList();

                ViewBag.NationalityID = selectedNationalities;
            }
            else
            {
                ViewBag.NationalityID = db.Nationalities
                    .Select(n => new SelectListItem
                    {
                        Value = n.ID.ToString(),
                        Text = culture.Contains("en-us") ? n.NameEN : n.NameAR
                    }).ToList();
            }

            if (JobsID != null)
            {
                var selectedJobs = db.Jobs
                    .Where(j => JobsID.Contains(j.ID.ToString()))
                    .Select(j => new SelectListItem
                    {
                        Value = j.ID.ToString(),
                        Text = culture.Contains("en-us") ? j.NameEN : j.NameAR
                    }).ToList();

                ViewBag.JobsID = selectedJobs;
            }
            else
            {
                ViewBag.JobsID = db.Jobs
                    .Select(j => new SelectListItem
                    {
                        Value = j.ID.ToString(),
                        Text = culture.Contains("en-us") ? j.NameEN : j.NameAR
                    }).ToList();
            }


            // فلتره العمالة الغير متاحيين 

            var availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

                                     where !db.WorkerRequests.Any(r => r.WorkerID == x.Id && r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
                                     where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
                                     select x).ToList();




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
                if (culture.Contains("en-us"))
                {

                    if (!string.IsNullOrEmpty(CountryID))
                    {
                        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN", CountryID);

                    }
                    else
                    {
                        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameEN");

                    }
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameEN");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameEN");

                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameEN");

                }
                else
                {

                    if (!string.IsNullOrEmpty(CountryID))
                    {
                        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR", CountryID);
                    }
                    else
                    {
                        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");

                    }
                    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
                    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");
                    ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", "NameAR");



                }





                ViewBag.Range = Range;
                ViewBag.maxAge = maxAge;

                ViewBag.yearsOfExperience = yearsOfExperience;
                ViewBag.workareas = CountryIds;
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
                    }
                    if (key.ToString() == "Religion")
                    {
                        ReligionList.AddRange(Request.QueryString[key].Split(','));
                    }
                }

                if (NationalityIDList.Count > 0 & JobIDList.Count > 0)
                {

                    availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

                                         where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
                                         where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
                                         where NationalityIDList.Any(j => j.Contains(x.NationalityID.ToString()))
                                         where JobIDList.Any(j => j.Contains(x.JobsID.ToString()))
                                         select x).ToList();

                }
                else
                {
                    if (NationalityIDList.Count > 0 & JobIDList.Count == 0)
                    {

                        availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

                                             where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
                                             where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
                                             where NationalityIDList.Any(j => j.Contains(x.NationalityID.ToString()))
                                             select x).ToList();

                    }
                    if (NationalityIDList.Count == 0 & JobIDList.Count > 0)
                    {

                        availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

                                             where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
                                             where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
                                             where JobIDList.Any(j => j.Contains(x.JobsID.ToString()))
                                             select x).ToList();

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

                if (GenderList.Count != 2 & GenderList.Count != 0)
                {
                    // فى حاله ان النوع المطلوب هو اما ذكر او انثى فقط 
                    // اما فى حاله تم احتيار النوعين فلا يوجد لها استخدام

                    foreach (var gender in GenderList)
                    {
                        bool _gender = Convert.ToBoolean(gender);
                        availablesWorkers = availablesWorkers.Where(p => p.Gender == _gender).ToList();
                    }

                }

                if (!string.IsNullOrEmpty(Range))
                {
                    if (Range.Contains('-'))
                    {

                        var RangeString = Range.Split('-');
                        var FromRange = int.Parse(RangeString[0]);
                        var ToRange = int.Parse(RangeString[1]);
                        //int _minAge = Convert.ToInt32(Range);
                        //availablesWorkers = availablesWorkers.Where(p => p.Age >= _minAge).ToList();
                        availablesWorkers = availablesWorkers.Where(p => p.Age >= FromRange && p.Age <= ToRange).ToList();
                    }
                    else
                    {
                        availablesWorkers = availablesWorkers.Where(p => p.Age >= 44).ToList();

                    }

                }

                //if (!string.IsNullOrEmpty(maxAge))
                //{
                //    int _maxAge = Convert.ToInt32(maxAge);
                //    availablesWorkers = availablesWorkers.Where(p => p.Age <= _maxAge).ToList();
                //}

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
                if (RequestAmountSort == "desc")
                {

                    availablesWorkers = availablesWorkers.OrderByDescending(r => r.RequestAmount).ToList();
                }
                else
                {
                    availablesWorkers = availablesWorkers.OrderBy(r => r.RequestAmount).ToList();

                }
                if(SalarySort == "desc")
                {
                    availablesWorkers = availablesWorkers.OrderByDescending(w => w.Salary).ToList();

                }
                else if (SalarySort == "asc")
                {
                    availablesWorkers = availablesWorkers.OrderBy(w => w.Salary).ToList();

                }
                if (Request.IsAjaxRequest())
                {
                    return PartialView("_WorkersDetails", availablesWorkers);
                }

                if (HasChilderns == "yes")
                {

                    availablesWorkers = availablesWorkers.Where(a => a.ChildernsCount > 0).ToList();
                }
                else
                {
                    availablesWorkers = availablesWorkers.Where(a => a.ChildernsCount == 0 || a.ChildernsCount == null).ToList();

                }

                if (!string.IsNullOrEmpty(yearsOfExperience))
                {
                    if (yearsOfExperience.Contains('-'))
                    {

                        var yearsOfExperienceString = yearsOfExperience.Split('-');
                        var FromRange = int.Parse(yearsOfExperienceString[0]);
                        var ToRange = int.Parse(yearsOfExperienceString[1]);
                        availablesWorkers = availablesWorkers.Where(p => p.ExperienceYearsCount >= FromRange && p.ExperienceYearsCount <= ToRange).ToList();
                    }
                    else if (yearsOfExperience == "اكبر من 10")
                    {
                        availablesWorkers = availablesWorkers.Where(p => p.ExperienceYearsCount > 10).ToList();

                    }
                    else
                    {
                        availablesWorkers = availablesWorkers.Where(p => p.ExperienceYearsCount == null).ToList();

                    }

                }
                if (CountryIds != null)
                {
                    var selected = new HashSet<int>(CountryIds);

                    if (selected.SetEquals(new[] { 0 }))
                    {
                        // بدون خبرة
                        availablesWorkers = availablesWorkers
                            .Where(w => !w.WorkerWorkingPlaces.Any())
                            .ToList();
                    }
                    else if (selected.SetEquals(new[] { 9 }))
                    {
                        // السعودية فقط
                        availablesWorkers = availablesWorkers
                            .Where(w => w.WorkerWorkingPlaces.Any(p => p.CountryID == 9))
                            .ToList();
                    }
                    else if (selected.SetEquals(new[] { 1 }))
                    {
                        // الخليج فقط
                        availablesWorkers = availablesWorkers
                            .Where(w => w.WorkerWorkingPlaces.Any(p => p.Country.IsGulf && p.CountryID != 9))
                            .ToList();
                    }
                    else if (selected.SetEquals(new[] { 2 }))
                    {
                        // خارج الخليج فقط
                        availablesWorkers = availablesWorkers
                            .Where(w => w.WorkerWorkingPlaces.Any(p => !p.Country.IsGulf && p.CountryID != 9))
                            .ToList();
                    }
                    else if (selected.SetEquals(new[] { 1, 2 }))
                    {
                        // خليج + خارج الخليج بدون السعودية
                        availablesWorkers = availablesWorkers
                            .Where(w =>
                                !w.WorkerWorkingPlaces.Any() ||
                                (w.WorkerWorkingPlaces.Any(p => p.CountryID != 9) &&
                                 !w.WorkerWorkingPlaces.Any(p => p.CountryID == 9)))
                            .ToList();
                    }
                    else if (selected.SetEquals(new[] { 1, 2, 9 }))
                    {
                        // كل أنواع الخبرة
                        availablesWorkers = availablesWorkers
                            .Where(w => w.WorkerWorkingPlaces.Any())
                            .ToList();
                    }
                    else if (CountryIds.Contains(2) && CountryIds.Contains(9) && CountryIds.Contains(1))
                    {
                        availablesWorkers = availablesWorkers.Where(w => w.WorkerWorkingPlaces.Any()).ToList();
                    }
                }
                if(MaritalStatus=="اعزب")
                {
                    availablesWorkers = availablesWorkers.Where(w => w.MaritalStatus=="اعزب").ToList();

                }
                if (MaritalStatus == "متزوج")
                {
                    availablesWorkers = availablesWorkers.Where(w => w.MaritalStatus == "متزوج").ToList();

                }
                if (MaritalStatus == "مطلق")
                {
                    availablesWorkers = availablesWorkers.Where(w => w.MaritalStatus == "مطلق").ToList();

                }
                if (!availablesWorkers.Any())
                    {
                        TempData["NoResults"] = "true";
                    }



                }
                    return View(availablesWorkers);



            }
            //public ActionResult Result(string NationalityID, string JobsID)
            //{
            //    string userId = User.Identity.GetUserId();
            //    ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
            //    ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
            //    ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");

            //    // فلتره العمالة الغير متاحيين 

            //    var availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

            //                             where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
            //                             where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
            //                             select x).ToList();



            //    string[] queryList = Request.QueryString.AllKeys;
            //    List<string> JobIDList = new List<string>();
            //    List<string> NationalityIDList = new List<string>();
            //    if (queryList.Count() == 0)
            //    {
            //        return View(availablesWorkers);
            //    }

            //    else
            //    {
            //        ViewBag.CountryID = new SelectList(db.Countries, "ID", "NameAR");
            //        ViewBag.CityID = new SelectList(db.Cities, "ID", "NameAR");
            //        ViewBag.JobsID = new SelectList(db.Jobs, "ID", "NameAR");




            //        foreach (String key in Request.QueryString.AllKeys)
            //        {
            //            if (key.ToString() == "JobsID")
            //            {
            //                JobIDList.AddRange(Request.QueryString[key].Split(','));
            //            }
            //            if (key.ToString() == "NationalityID")
            //            {
            //                NationalityIDList.AddRange(Request.QueryString[key].Split(','));
            //            }

            //        }


            //        if (NationalityIDList.Count > 0 & JobIDList.Count > 0)
            //        {

            //            availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

            //                                 where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
            //                                 where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
            //                                 where NationalityIDList.Any(j => j.Contains(x.NationalityID.ToString()))
            //                                 where JobIDList.Any(j => j.Contains(x.JobsID.ToString()))
            //                                 select x).ToList();

            //        }
            //        else
            //        {
            //            if (NationalityIDList.Count > 0 & JobIDList.Count == 0)
            //            {

            //                availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

            //                                     where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
            //                                     where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
            //                                     where NationalityIDList.Any(j => j.Contains(x.NationalityID.ToString()))
            //                                     select x).ToList();

            //            }if (NationalityIDList.Count == 0 & JobIDList.Count > 0)
            //            {

            //                availablesWorkers = (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)

            //                                     where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
            //                                     where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
            //                                     where JobIDList.Any(j => j.Contains(x.JobsID.ToString()))
            //                                     select x).ToList();

            //            }
            //        }


            //        return View(availablesWorkers);

            //    }



            //}




        public ActionResult About()
        {
            return View();
        }
        public ActionResult Contact()
        {

            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public JsonResult SendMessage(ContactUsMessage messagee)
        {
            string retval = "";
            try
            {
                db.ContactUsMessages.Add(messagee);
                db.SaveChanges();
                retval = "MessageHasBeenSent";

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

