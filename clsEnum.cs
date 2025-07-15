using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public static class clsEnum
{
    public enum Roles
    {
        Administrators = 1,
        Kafil = 2,
        Office = 3,
        Worker = 4

    }
     public enum NotificationTypes
    {
        Requests ,
        BlockedOrUnBlocked ,
        FirstLogin,
        VerifiyingOffice


    }


    public enum Countries
    {
        SaudiArabia = 9
    }


    public enum MessageStatus
    {
        UnRead = 1,
        Read = 2,
        IsArchived = 3

    }
    public enum MailTypes
    {
        Comment = 1,
        Mail = 2
    }


    public enum Status
    {
        متاح = 1,
        مرشح_الى_كفيل = 2,
        غير_متاح = 3
    }

    public enum WorkerRequestStatus
    {
        تم_ارسال_الطلب = 1,
        رفض_أولى = 2,
        تم_الاعتماد = 3,
        تم_رفض_الاعتماد = 4,
        قبول_أولى = 5,
        طلبات_محظورة = 6,
        طلبات_مستحقة = 7,
        طلبات_مسددة = 8,
        طلبات_مردودة = 9,
        تحت_المراجعة = 10,
        قيمة_مبدئية=11

    }
    public enum Nationalities
    {
        Egyptien = 2,
        Sudanese = 3,
        Filipino = 4,
        Nigerian = 5,
        Indian = 6,
        Pakistani = 7,
        Bengali = 8,
        Tanzanian = 9,
        SriLankan = 10,
        Vietnamese = 11,
        Mauritanian = 12,
        Ugandan = 13,
        Eritrean = 14,
        Madagascar = 15,
        Uzbek = 16,
        Cambodian = 17,
        Mali = 18,
        SouthAfrican = 19,
        kenny = 20


    }  
    public enum Jobs
    {
        PersonalDriver = 1,
        CookerMale = 2,
        CookerFemale = 3,
        workerMale = 4,
        workerFemale = 5,
        NurseFemale = 6,
        NurseMale = 7,
        NannyFemale = 8,
        PhysiotherapistMale= 9,
        PhysiotherapistFemale = 10,
        SapphireMale = 11


    }
    public enum ReportedWorkerStatus
    {
        تحت_المراجعة_من_قبل_الادارة = 1,
        تحت_المراجعة_من_قبل_المكتب = 2,
        حساب_معلق = 3,


    }





}