using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace Marofh
{
    public partial class AspNetUser
    {
        public int? CalculatedAge
        {
            get
            {
                if (!this.DOB.HasValue)
                    return null;

                // تقويم هجري
                HijriCalendar hijri = new HijriCalendar();

                // السنة الهجرية الحالية
                int currentHijriYear = hijri.GetYear(DateTime.Today);

                // سنة الميلاد الهجرية
                int birthHijriYear = hijri.GetYear(this.DOB.Value);

                // فرق السنوات فقط
                return currentHijriYear - birthHijriYear;
            }
        }
    }
}
