using Marofh;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using System.Web.Mvc;
using System.Text;
using System.IO;
using System.Web.Hosting;
using Newtonsoft.Json;
using Microsoft.AspNet.Identity;
using System.Data.Entity;
using System.Net.Mail;

namespace Marofh.Models
{

    public static class ViewModel
    {
        public static DBEntities db = new DBEntities();
        static int workerRoleId = Convert.ToInt32(clsEnum.Roles.Worker);

        //public static List<Page> ListMenu { get; set; }

        public static List<Page> GetPagesMenu()
        {
            db = new DBEntities();
            return db.Pages.ToList();
        }



        public static List<FAQ> GetFAQs()
        {
            db = new DBEntities();
            return db.FAQs.ToList();
        }
        public static List<Skill> GetAllSkills()
        {
            db = new DBEntities();
            return db.Skills.ToList();
        }
        public static List<Job> GetAllJobs()
        {
            db = new DBEntities();
            var result = db.Jobs.ToList();
            return db.Jobs.ToList();
        }
        public static List<Nationality> GetAllNationalities()
        {
            db = new DBEntities();
            return db.Nationalities.ToList();
        }





        public static List<Mail> GetMailsByOfficeID(string userId)
        {
            db = new DBEntities();
            return db.Mails.Where(p => p.OfficeID == userId).ToList();
        }



        public static List<Service> GetServices()
        {
            db = new DBEntities();
            return db.Services.ToList();
        }




        public static Contact GetContactDetails()
        {
            db = new DBEntities();
            Contact contact = db.Contacts.FirstOrDefault();
            return contact;


        }
        public static AspNetUser GetCurrentUser(string UserId)
        {

            db = new DBEntities();
            AspNetUser user = db.AspNetUsers.Where(p => p.Id == UserId).FirstOrDefault();
            return user;


        }
        public static string GetAspNetUserName(string UserId)
        {

            db = new DBEntities();
            AspNetUser user = db.AspNetUsers.Find(UserId);
            if (user != null)
            {
                return user.FName;
            }

            return "---";

        }
        public static AspNetUser GetAspNetUser(string UserId)
        {

            db = new DBEntities();
            AspNetUser user = db.AspNetUsers.Where(p => p.Id == UserId).FirstOrDefault();
            if (user != null)
            {
                return user;
            }

            return null;

        }

        public static int GetUserRole(string UserId)
        {

            db = new DBEntities();
            AspNetUser user = db.AspNetUsers.Find(UserId);
            return Convert.ToInt32(user.RoleID);


        }




        public static int GetWorkersCount(string UserId, int roleId)
        {

            db = new DBEntities();
            return db.AspNetUsers.Where(p => p.RoleID == roleId & p.
                                OfficeID == UserId).Count();


        }
        public static IEnumerable<AspNetUser> GetRecentWorkers()
        {

            db = new DBEntities();
            return (from x in db.AspNetUsers.Where(p => p.RoleID == workerRoleId)
                    where !db.WorkerRequests.Any(r => r.WorkerID == x.Id & r.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString())
                    where !db.ReportedWorkers.Any(y => x.Id == y.WorkerID)
                    select x);


        }
        public static bool CheckIfWorkerInFavoriteMyList(string UserId, string workerId)
        {

            db = new DBEntities();
            if (db.FavoriteLists.Where(p => p.WorkerID == workerId & p.KafilID == UserId).Count() > 0)
            {
                return true;
            }
            else { return false; }

        }
        public static bool CheckThisWorkerHasBeenRequestBefore(string UserId, string workerId)
        {

            db = new DBEntities();
            if (db.WorkerRequests.Where(p => p.WorkerID == workerId & p.KafilID == UserId).Count() > 0)
            {
                return true;
            }
            else { return false; }

        }

        public static List<AspNetUser> GetWorkersByOfficeID(string userId)
        {
            db = new DBEntities();
            return db.AspNetUsers.Where(p => p.OfficeID == userId).ToList();
        }
        public static bool IsVerifiedOffice(string userId)
        {
            db = new DBEntities();
            return Convert.ToBoolean(db.AspNetUsers.Find(userId).IsVerifed);
        }
        public static string GetWorkerStatusByID(string workerId)
        {

            var culture = System.Threading.Thread.CurrentThread.CurrentUICulture.Name.ToLowerInvariant();
            db = new DBEntities();
            if (db.WorkerRequests.Where(p => p.WorkerID == workerId).Count() == 0)
            {
                if (culture.Contains("en-us"))
                {
                    return "Available ";
                }
                else
                {
                    return "متاح";
                }
            }
            else
            {
                if (db.WorkerRequests.Where(p => p.WorkerID == workerId & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).Count() > 0)
                {

                    if (culture.Contains("en-us"))
                    {
                        return "Acandidate for a Sponsor";

                    }
                    else
                    {
                        return "مرشح لكفيل";

                    }

                }
                if (db.WorkerRequests.Where(p => p.WorkerID == workerId & p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString()).Count() > 0)
                {
                    if (culture.Contains("en-us"))
                    {

                        return "Not Available ";
                    }
                    else
                    {
                        return "غير متاح";

                    }


                }
            }
            if (culture.Contains("en-us"))
            {
                return "Available ";

            }
            else
            {
                return "متاح";

            }


        }

        public static string XF_GetWorkerRequestDateByWorkerID(string workerId)
        {
            db = new DBEntities();
            if (db.WorkerRequests.Where(p => p.WorkerID == workerId).Count() == 0)
            {
                return string.Empty;
            }
            else
            {
                if (db.WorkerRequests.Where(p => p.WorkerID == workerId & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).Count() > 0)
                {
                    WorkerRequest request = db.WorkerRequests.Where(p => p.WorkerID == workerId & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).OrderByDescending(p => p.ID).FirstOrDefault();
                    return request.RequestDate.Value.ToString("yyyy/MM/dd");
                }
                if (db.WorkerRequests.Where(p => p.WorkerID == workerId & p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString()).Count() > 0)
                {
                    return string.Empty;
                }
            }
            return string.Empty;

        }
        public static string XF_GetWorkerRequestKafilMobileNOByWorkerID(string workerId)
        {
            db = new DBEntities();
            if (db.WorkerRequests.Where(p => p.WorkerID == workerId).Count() == 0)
            {
                return string.Empty;
            }
            else
            {
                if (db.WorkerRequests.Where(p => p.WorkerID == workerId & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).Count() > 0)
                {
                    WorkerRequest request = db.WorkerRequests.Where(p => p.WorkerID == workerId & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).OrderByDescending(p => p.ID).FirstOrDefault();
                    return request.AspNetUser.Mobile;

                }
                if (db.WorkerRequests.Where(p => p.WorkerID == workerId & p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString()).Count() > 0)
                {
                    return string.Empty;
                }
            }
            return string.Empty;

        }
        public static string XF_GetWorkerRequestKafilNameByWorkerID(string workerId)
        {
            db = new DBEntities();
            if (db.WorkerRequests.Where(p => p.WorkerID == workerId).Count() == 0)
            {
                return string.Empty;
            }
            else
            {
                if (db.WorkerRequests.Where(p => p.WorkerID == workerId & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).Count() > 0)
                {
                    WorkerRequest request = db.WorkerRequests.Where(p => p.WorkerID == workerId & (p.RequestStatus == clsEnum.WorkerRequestStatus.تم_ارسال_الطلب.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString())).OrderByDescending(p => p.ID).FirstOrDefault();
                    return request.AspNetUser.FName + " " + request.AspNetUser.LName;
                }
                if (db.WorkerRequests.Where(p => p.WorkerID == workerId & p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString()).Count() > 0)
                {
                    return string.Empty;
                }
            }
            return string.Empty;

        }
        public static List<Branch> GetAllBranchesByOfficeID(string userId)
        {
            db = new DBEntities();
            return db.Branches.Where(p => p.OfficeID == userId).ToList();
        }
        public static List<OfficeService> GetAllOfficeServiceByOfficeID(string userId)
        {
            db = new DBEntities();
            return db.OfficeServices.Where(p => p.OfficeID == userId).ToList();
        }
        public static List<OfficeDocument> GetAllOfficeDocumentsByOfficeID(string userId)
        {
            db = new DBEntities();
            return db.OfficeDocuments.Where(p => p.OfficeID == userId).ToList();
        }
        public static List<WorkerRequest> GetAllWorkerRequestByOfficeIDAndRequestStatus(string userId, string status)
        {
            db = new DBEntities();
            return db.WorkerRequests.Where(p => p.OfficeID == userId & p.RequestStatus == status).ToList();
        }

        public static List<WorkerRequest> GetAllWorkerRequestByOfficeIDAndPaidStatus(string userId, string status)
        {
            db = new DBEntities();
            return db.WorkerRequests.Where(p => p.OfficeID == userId & p.PaidStatus == status).ToList();
        }
        public static List<WorkerRequest> GetAllWorkersForWallletByOfficeID(string officeId)
        {
            db = new DBEntities();
            return db.WorkerRequests.Where(p => p.OfficeID == officeId & p.RequestStatus == clsEnum.WorkerRequestStatus.قبول_أولى.ToString() || p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString()).ToList();
        }
        public static List<BlokedUser> GetAllBlokedUsersByOfficeID(string userId)
        {
            db = new DBEntities();
            return db.BlokedUsers.Where(p => p.OfficeID == userId).ToList();
        }

        public static List<WorkerRequest> GetAllUnPaidRequestedByOfficeID(string officeId)
        {
            db = new DBEntities();
            return db.WorkerRequests.Where(p => p.OfficeID == officeId & p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString() & p.PaidStatus == clsEnum.WorkerRequestStatus.طلبات_مستحقة.ToString()).ToList();
        }
        public static List<WorkerRequest> GetAllPaidRequestedByOfficeID(string officeId)
        {
            db = new DBEntities();
            return db.WorkerRequests.Where(p => p.OfficeID == officeId & p.RequestStatus == clsEnum.WorkerRequestStatus.تم_الاعتماد.ToString() & p.PaidStatus == clsEnum.WorkerRequestStatus.طلبات_مسددة.ToString()).ToList();

        }
        public static List<WorkerRequest> GetAllRefundedRequestedByOfficeID(string officeId)
        {
            db = new DBEntities();
            return db.WorkerRequests.Where(p => p.OfficeID == officeId & p.PaidStatus == clsEnum.WorkerRequestStatus.طلبات_مردودة.ToString()).ToList();

        }

        public static List<ReportedWorker> GetAllReportedWorkersByOfficeIDAndByStatus(string userId, string status)
        {
            db = new DBEntities();
            return db.ReportedWorkers.Where(p => p.OfficeID == userId & p.Status == status).ToList();
        }

        public static void SendNotification(string msg, string officeId, string kafilId, string adminId, int? requestId, string type)
        {
            db = new DBEntities();

            Notification notification = new Notification();
            notification.Message = msg;
            notification.OfficeID = !string.IsNullOrEmpty(officeId) ? officeId : null;
            notification.KafilID = !string.IsNullOrEmpty(kafilId) ? kafilId : null;
            notification.AdminID = !string.IsNullOrEmpty(adminId) ? adminId : null;
            notification.IsRead = false;
            notification.RequestID = requestId;
            notification.Type = type;
            notification.Date = DateTime.Now;

            db.Notifications.Add(notification);
            db.SaveChanges();

        }

        public static List<Notification> GetNotificationsByOfficeID(string officeId)
        {
            db = new DBEntities();
            return db.Notifications.Where(p => p.OfficeID == officeId & p.IsRead == false).ToList();
        }
        public static List<Notification> GetNotificationsByKafilID(string kafilId)
        {
            db = new DBEntities();
            return db.Notifications.Where(p => p.KafilID == kafilId & p.IsRead == false).ToList();
        }


        public static void SendMessage(string to, string subject, string body, string userId)
        {
            try
            {
                // بناء رابط التفعيل
                string templatePath = HostingEnvironment.MapPath("~/txt/activate.txt");
                if (!File.Exists(templatePath))
                    throw new FileNotFoundException("Template file not found at: " + templatePath);

                string template = File.ReadAllText(templatePath);
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat(template, userId);
                body = sb.ToString();

                MailMessage mail = new MailMessage();
                mail.To.Add(to);
                mail.From = new MailAddress("marofhwebsite@gmail.com");
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    UseDefaultCredentials = false,
                    Credentials = new System.Net.NetworkCredential("marofhwebsite@gmail.com", "@Marofh@2021@") // تأكد من أن كلمة السر هنا هي App Password
                };

                smtp.Send(mail);
            }
            catch (SmtpException ex)
            {
                try
                {
                    string logDir = HttpContext.Current.Server.MapPath("~/App_Data/");
                    string logPath = Path.Combine(logDir, "mail_errors.log");

                    // تأكد من وجود App_Data
                    if (!Directory.Exists(logDir))
                        Directory.CreateDirectory(logDir);

                    File.AppendAllText(logPath, DateTime.Now + " - " + ex.Message + Environment.NewLine);
                }
                catch
                {
                    // fallback لو حتى ما قدرش يكتب في App_Data
                }
            }
        }

    }
}