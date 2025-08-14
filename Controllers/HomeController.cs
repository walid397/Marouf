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
using static clsEnum;

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
        public ActionResult Result(
            int? nid,
            string CountryID,
            string[] NationalityID,
            string maxAge,
            string minExperienceYearsCount,
            string maxExperienceYearsCount,
            bool? Gender,
            string[] JobsID,
            bool? Religion,
            string ExperienceYearsCount,
            string RequestAmountSort,
            string[] HasChilderns,
            string yearsOfExperience,
            List<int> CountryIds,
            string [] MaritalStatus,
            string SalarySort,
            string[] Range,
            string [] Education,
            string[] Height,
            string[] RoomSharing,
            string[] City,
            string[] Countries,
                string[] Skills ,  
            string[] Weight,
                string[] extra2 // <<<<< هنا



            )
        {
            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();

            ViewBag.CountryID = new SelectList(db.Countries, "ID", culture.Contains("en-us") ? "NameEN" : "NameAR");
            ViewBag.CityID = new SelectList(db.Cities, "ID", culture.Contains("en-us") ? "NameEN" : "NameAR");
            ViewBag.JobsID = new SelectList(db.Jobs, "ID", culture.Contains("en-us") ? "NameEN" : "NameAR");
            ViewBag.NationalityID = new SelectList(db.Nationalities, "ID", culture.Contains("en-us") ? "NameEN" : "NameAR");
            ViewBag.Cities = db.Cities.ToList();
            ViewBag.Countries = db.Countries.ToList();
            ViewBag.Skills = db.Skills.ToList(); // <<<<< تمرير المهارات

            if (NationalityID != null)
            {
                ViewBag.NationalityID = db.Nationalities
                    .Where(n => NationalityID.Contains(n.ID.ToString()))
                    .Select(n => new SelectListItem
                    {
                        Value = n.ID.ToString(),
                        Text = culture.Contains("en-us") ? n.NameEN : n.NameAR
                    }).ToList();
            }

            if (JobsID != null)
            {
                ViewBag.JobsID = db.Jobs
                    .Where(j => JobsID.Contains(j.ID.ToString()))
                    .Select(j => new SelectListItem
                    {
                        Value = j.ID.ToString(),
                        Text = culture.Contains("en-us") ? j.NameEN : j.NameAR
                    }).ToList();
            }

            ViewBag.SelectedRanges = Range?.ToList() ?? new List<string>();
            ViewBag.maxAge = maxAge;
            ViewBag.yearsOfExperience = yearsOfExperience;
            ViewBag.workareas = CountryIds;
            ViewBag.minExperienceYearsCount = minExperienceYearsCount;
            ViewBag.maxExperienceYearsCount = maxExperienceYearsCount;

            var availablesWorkers = db.AspNetUsers
                .Where(x => x.RoleID == workerRoleId)
                .Where(x => !db.WorkerRequests.Any(r => r.WorkerID == x.Id && r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString()))
                .Where(x => !db.ReportedWorkers.Any(y => x.Id == y.WorkerID))
                .ToList();

            if (NationalityID != null && NationalityID.Any())
            {
                availablesWorkers = availablesWorkers
                    .Where(x => NationalityID.Contains(x.NationalityID.ToString()))
                    .ToList();
            }

            if (JobsID != null && JobsID.Any())
            {
                availablesWorkers = availablesWorkers
                    .Where(x => JobsID.Contains(x.JobsID.ToString()))
                    .ToList();
            }

            if (!string.IsNullOrEmpty(CountryID))
            {
                int _CountryID = Convert.ToInt32(CountryID);
                availablesWorkers = availablesWorkers.Where(p => p.CountryID == _CountryID).ToList();
            }

            if (Gender.HasValue)
            {
                availablesWorkers = availablesWorkers.Where(p => p.Gender == Gender.Value).ToList();
            }

            if (Range != null && Range.Any())
            {
                foreach (var item in Range)
                {
                    if (item.Contains("-"))
                    {
                        var parts = item.Split('-');
                        int from = int.Parse(parts[0]);
                        int to = int.Parse(parts[1]);
                        availablesWorkers = availablesWorkers.Where(p => p.Age >= from && p.Age <= to).ToList();
                    }
                    else if (item == "أكبر من 44")
                    {
                        availablesWorkers = availablesWorkers.Where(p => p.Age > 44).ToList();
                    }
                }
            }

            if (Religion.HasValue)
            {
                availablesWorkers = availablesWorkers.Where(p => p.Religion == Religion.Value.ToString()).ToList();
            }

            if (!string.IsNullOrEmpty(minExperienceYearsCount))
            {
                int minExp = int.Parse(minExperienceYearsCount);
                availablesWorkers = availablesWorkers.Where(p => p.ExperienceYearsCount >= minExp).ToList();
            }

            if (!string.IsNullOrEmpty(maxExperienceYearsCount))
            {
                int maxExp = int.Parse(maxExperienceYearsCount);
                availablesWorkers = availablesWorkers.Where(p => p.ExperienceYearsCount <= maxExp).ToList();
            }

            // مبلغ الاستقدام
            if (!string.IsNullOrEmpty(RequestAmountSort))
            {
                if (RequestAmountSort == "desc")
                    availablesWorkers = availablesWorkers.OrderByDescending(r => r.RequestAmount).ToList();
                else
                    availablesWorkers = availablesWorkers.OrderBy(r => r.RequestAmount).ToList();
            }

            // الراتب (يغطي على اللي فوق لو اتحدد)
            if (!string.IsNullOrEmpty(SalarySort))
            {
                if (SalarySort == "desc")
                    availablesWorkers = availablesWorkers.OrderByDescending(w => w.Salary).ToList();
                else if (SalarySort == "asc")
                    availablesWorkers = availablesWorkers.OrderBy(w => w.Salary).ToList();
            }



            if (HasChilderns != null && HasChilderns.Any())
            {
                var hasChildrenValues = HasChilderns;

                // لو اختار الاتنين → ما نفلترش (يعني نعرض الكل)
                if (!(hasChildrenValues.Contains("yes") && hasChildrenValues.Contains("no")))
                {
                    if (hasChildrenValues.Contains("yes"))
                    {
                        availablesWorkers = availablesWorkers
                            .Where(a => a.ChildernsCount > 0)
                            .ToList();
                    }
                    else if (hasChildrenValues.Contains("no"))
                    {
                        availablesWorkers = availablesWorkers
                            .Where(a => a.ChildernsCount == 0 || a.ChildernsCount == null)
                            .ToList();
                    }
                }
            }
            if (extra2 != null && extra2.Any())
            {
                // لو اختار الاتنين → نعرض الكل (مفيش فلترة)
                if (!(extra2.Contains("1") && extra2.Contains("2")))
                {
                    bool filterRecommended = extra2.Contains("1"); // 1 = مرشح
                    bool filterNotRecommended = extra2.Contains("2"); // 2 = غير مرشح

                    availablesWorkers = availablesWorkers.Where(w =>
                    {
                        bool isRecommended = db.WorkerRequests.Any(p =>
                            p.WorkerID == w.Id &&
                            (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() ||
                             p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())
                        );

                        if (filterRecommended)
                            return isRecommended; // مرشح
                        else if (filterNotRecommended)
                            return !isRecommended; // غير مرشح
                        else
                            return true;
                    }).ToList();
                }
            }


            if (!string.IsNullOrEmpty(yearsOfExperience))
            {
                if (yearsOfExperience.Contains('-'))
                {
                    var parts = yearsOfExperience.Split('-');
                    int from = int.Parse(parts[0]);
                    int to = int.Parse(parts[1]);
                    availablesWorkers = availablesWorkers.Where(p => p.ExperienceYearsCount >= from && p.ExperienceYearsCount <= to).ToList();
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

            if (CountryIds != null && CountryIds.Any())
            {
                // لو اختار "0" → بدون خبرة (لا يوجد WorkerWorkingPlaces)
                if (CountryIds.Contains(0))
                {
                    availablesWorkers = availablesWorkers
                        .Where(w => !w.WorkerWorkingPlaces.Any())
                        .ToList();
                }

                // لو اختار "9" → خبرة بالسعودية
                if (CountryIds.Contains(9))
                {
                    availablesWorkers = availablesWorkers
                        .Where(w => w.WorkerWorkingPlaces.Any(p => p.CountryID == 9))
                        .ToList();
                }

                // لو اختار "1" → خبرة بالخليج (غير السعودية)
                if (CountryIds.Contains(1))
                {
                    availablesWorkers = availablesWorkers
                        .Where(w => w.WorkerWorkingPlaces.Any(p => p.Country.IsGulf && p.CountryID != 9))
                        .ToList();
                }

                // لو اختار "2" → خبرة بالخارج (غير الخليج والسعودية)
                if (CountryIds.Contains(2))
                {
                    availablesWorkers = availablesWorkers
                        .Where(w => w.WorkerWorkingPlaces.Any(p => !p.Country.IsGulf && p.CountryID != 9))
                        .ToList();
                }
            }
            if (MaritalStatus != null && MaritalStatus.Any())
            {
                availablesWorkers = availablesWorkers
                    .Where(w => MaritalStatus.Contains(w.MaritalStatus))
                    .ToList();
            }




            if (Education != null && Education.Any())
            {
                var selectedEducations = Education.Select(e => e.Trim().ToLower()).ToList();
                availablesWorkers = availablesWorkers
                    .Where(w => !string.IsNullOrEmpty(w.Education) && selectedEducations.Contains(w.Education.Trim().ToLower()))
                    .ToList();
            }


            if (Weight != null && Weight.Any())
            {
                availablesWorkers = availablesWorkers.Where(w =>
                    Weight.Any(range =>
                        (range == "<50" && w.Weight < 40) ||
                        (range == "50-60" && w.Weight > 50 && w.Weight <= 60) ||
                        (range == "60-70" && w.Weight > 60 && w.Weight <= 70) ||
                        (range == "70-80" && w.Weight > 70 && w.Weight <= 80) ||
                        (range == ">80" && w.Weight > 80)
                    )
                ).ToList();
            }



            if (Height != null && Height.Any())
            {
                availablesWorkers = availablesWorkers.Where(w =>
                    Height.Any(range =>
                        (range == "<150" && w.Height < 150) ||
                        (range == "150-160" && w.Height >= 150 && w.Height <= 160) ||
                        (range == "160-170" && w.Height > 160 && w.Height <= 170) ||
                        (range == "170-180" && w.Height > 170 && w.Height <= 180) ||
                        (range == ">180" && w.Height > 180)
                    )
                ).ToList();


            }
            // فلترة مشاركة الغرفة
            if (RoomSharing != null && RoomSharing.Any())
            {
                var roomSharingValues = RoomSharing.Select(bool.Parse).ToList();
                availablesWorkers = availablesWorkers
                    .Where(w => w.IsRoomShared.HasValue && roomSharingValues.Contains(w.IsRoomShared.Value))
                    .ToList();
            }


            // فلترة بالمهارات
            if (Skills != null && Skills.Any())
            {
                var skillIds = Skills.Select(int.Parse).ToList();
                availablesWorkers = availablesWorkers
                    .Where(w => w.WorkerSkills.Any(s => skillIds.Contains(s.ID)))
                    .ToList();
            }
            // فلترة بالدول
            if (Countries != null && Countries.Any())
            {
                var countryIds = Countries.Select(int.Parse).ToList();
                availablesWorkers = availablesWorkers
                    .Where(w => w.CountryID.HasValue && countryIds.Contains(w.CountryID.Value))
                    .ToList();
            }


            if (City != null && City.Any())
            {
                var cityIds = City.Select(int.Parse).ToList();
                availablesWorkers = availablesWorkers
                    .Where(w => w.CityID.HasValue && cityIds.Contains(w.CityID.Value))
                    .ToList();
            }



            if (!availablesWorkers.Any())
            {
                TempData["NoResults"] = "true";
            }

            if (Request.IsAjaxRequest())
            {
                return PartialView("_WorkersDetails", availablesWorkers);
            }

            return View(availablesWorkers);
        }            //public ActionResult Result(string NationalityID, string JobsID)
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

