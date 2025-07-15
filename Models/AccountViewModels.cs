using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Marofh.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Remember this browser?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        [Required(ErrorMessage = "حقل التعريف مطلوب")]
        public string Identifier { get; set; } // إما إيميل أو رقم جوال


        [Display(Name = "UserName")]
        public string UserName { get; set; }

        //[Required]
        //[Display(Name = "Email")]
        //public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Remember me?")]
        public bool RememberMe { get; set; }
        //[Required(ErrorMessage = "رقم الجوال مطلوب")]
        //[RegularExpression(@"^05\d{8}$", ErrorMessage = "رقم الجوال يجب أن يبدأ بـ 05 ويتكون من 10 أرقام")]
        //public string Mobile { get; set; }

    }

    public class RegisterViewModel
    {

        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        public string FName { get; set; }
        public string LName { get; set; }
        [Required]
        public string Mobile { get; set; }

        [Display(Name = "UserName")]
        public string UserName { get; set; }

        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
        public bool Gender { get; set; }


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
        public DateTime? LastLoggedInDate { get; set; }
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
        public bool IsBlocked { get; set; } 
        public bool IsActivated { get; set; }

        public string VideoUrl { get; set; }
        public string Brief { get; set; }
        public string NID { get; set; }
        public string Status { get; set; }
    }

    public class ResetPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }
    }
}
