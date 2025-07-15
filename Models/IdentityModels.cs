using System;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Marofh.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {

        public string FName { get; set; }
        public string LName { get; set; }
        public string Password { get; set; }
        public string Mobile { get; set; }
        public int? NationalityID { get; set; }
        public int? CountryID { get; set; }
        public int? CityID { get; set; }
        public string WhatsAppNo { get; set; }

        public string ImageUrl { get; set; }  
        public int RoleID { get; set; }

        public string HRLicenseNo { get; set; }
        public DateTime? HRLicenseExpiryDate { get; set; }
        public string CommercialRegisterNO { get; set; }
        public DateTime? CommercialRegisterExpirationDate { get; set; }
        public string EmployeeFName { get; set; }
        public string EmployeeLName { get; set; }
        public string EmployeeEmail { get; set; }
        public string EmployeeMobile { get; set; }


        public DateTime? DOB { get; set; }
        public int? JobsID { get; set; }
        public int? ChildernsCount { get; set; }
        public int? ExperienceYearsCount { get; set; }
        public string OfficeID { get; set; }
        public string OfficeName { get; set; }
        public string Religion { get; set; }
        public string MaritalStatus { get; set; }
        public bool? HasDrivingLicense { get; set; }
        public bool? Gender { get; set; }


        public string VideoUrl { get; set; }
        public string Brief { get; set; }
        public string NID { get; set; }
        public DateTime? LastLoggedInDate { get; set; }
        public bool IsActivated { get; set; }  
        public bool IsBlocked { get; set; }
        public string Status { get; set; }

        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here

            return userIdentity;
        }


    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

      
    }
}