using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class SLAs
    {

        public static SLAModel RetrieveSLAFromDatabase(string type)
        {
            var db = new DataClasses1DataContext();
            var sla = (from ServiceLevelAgreement i in db.ServiceLevelAgreements
                       where i.Type.Equals(type) 
                       select i).FirstOrDefault();

            SLAModel ret = new SLAModel
            {
                ID = sla.Id,
                High = sla.High,
                Urgent =  sla.Urgent,
                Normal = sla.Normal,
                Low = sla.Low
                
            };
            

            return ret;
        }




        public static DateTime ticketDeadline(TicketModel ticket)
        {
            var db = new DataClasses1DataContext();
            var sla = (from ServiceLevelAgreement i in db.ServiceLevelAgreements
                       where i.Type.Equals("Work_Time")
                       select i).FirstOrDefault();


            String urgentTime;
            String highTime;
            String normalTime;
            String lowTime;


            if (ticket.Priority_level == "Urgent")
            {
                if (sla.Urgent.EndsWith("h"))
                {
                    urgentTime = sla.Urgent.TrimEnd('h');
                    ticket.Date_Deadline = DateTime.Now.AddHours(Convert.ToDouble(urgentTime));
                }
                if (sla.Urgent.EndsWith("m"))
                {
                    urgentTime = sla.Urgent.TrimEnd('m');
                    ticket.Date_Deadline = DateTime.Now.AddMinutes(Convert.ToDouble(urgentTime));
                }
                if (sla.Urgent.EndsWith("s"))
                {
                    urgentTime = sla.Urgent.TrimEnd('s');
                    ticket.Date_Deadline = DateTime.Now.AddSeconds(Convert.ToDouble(urgentTime));
                }
                if (sla.Urgent.EndsWith("d"))
                {
                    urgentTime = sla.Urgent.TrimEnd('d');
                    ticket.Date_Deadline = DateTime.Now.AddDays(Convert.ToDouble(urgentTime));
                }
            }


            if (ticket.Priority_level == "High")
            {
                if (sla.High.EndsWith("h"))
                {
                    highTime = sla.High.TrimEnd('h');
                    ticket.Date_Deadline = DateTime.Now.AddHours(Convert.ToDouble(highTime));
                }
                if (sla.High.EndsWith("m"))
                {
                    highTime = sla.High.TrimEnd('m');
                    ticket.Date_Deadline = DateTime.Now.AddMinutes(Convert.ToDouble(highTime));
                }
                if (sla.High.EndsWith("s"))
                {
                    highTime = sla.High.TrimEnd('s');
                    ticket.Date_Deadline = DateTime.Now.AddSeconds(Convert.ToDouble(highTime));
                }
                if (sla.High.EndsWith("d"))
                {
                    highTime = sla.High.TrimEnd('d');
                    ticket.Date_Deadline = DateTime.Now.AddDays(Convert.ToDouble(highTime));
                }
            }

            if (ticket.Priority_level == "Normal")
            {
                if (sla.Normal.EndsWith("h"))
                {
                    normalTime = sla.Normal.TrimEnd('h');
                    ticket.Date_Deadline = DateTime.Now.AddHours(Convert.ToDouble(normalTime));
                }
                if (sla.Normal.EndsWith("m"))
                {
                    normalTime = sla.Normal.TrimEnd('m');
                    ticket.Date_Deadline = DateTime.Now.AddMinutes(Convert.ToDouble(normalTime));
                }
                if (sla.Normal.EndsWith("s"))
                {
                    normalTime = sla.Normal.TrimEnd('s');
                    ticket.Date_Deadline = DateTime.Now.AddSeconds(Convert.ToDouble(normalTime));
                }
                if (sla.Normal.EndsWith("d"))
                {
                    normalTime = sla.Normal.TrimEnd('d');
                    ticket.Date_Deadline = DateTime.Now.AddDays(Convert.ToDouble(normalTime));
                }
            }

            if (ticket.Priority_level == "Low")
            {
                if (sla.Low.EndsWith("h"))
                {
                    lowTime = sla.Low.TrimEnd('h');
                    ticket.Date_Deadline = DateTime.Now.AddHours(Convert.ToDouble(lowTime));
                }
                if (sla.Low.EndsWith("m"))
                {
                    lowTime = sla.Low.TrimEnd('m');
                    ticket.Date_Deadline = DateTime.Now.AddMinutes(Convert.ToDouble(lowTime));
                }
                if (sla.Low.EndsWith("s"))
                {
                    lowTime = sla.Low.TrimEnd('s');
                    ticket.Date_Deadline = DateTime.Now.AddSeconds(Convert.ToDouble(lowTime));
                }
                if (sla.Low.EndsWith("d"))
                {
                    lowTime = sla.Low.TrimEnd('d');
                    ticket.Date_Deadline = DateTime.Now.AddDays(Convert.ToDouble(lowTime));
                }
            }

            return ticket.Date_Deadline;

        }





    }
}