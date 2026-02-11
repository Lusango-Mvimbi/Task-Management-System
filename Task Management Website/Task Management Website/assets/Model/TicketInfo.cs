using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Task_Management_Website.assets.Model
{
    public class TicketInfo
    {
        public int ID { get; set; }
        public String Title { get; set; }
        public String Priority_level { get; set; }
        public String Category { get; set; }
        public String Description { get; set; }
        public String Created_By { get; set; }
        public String Assigned_To { get; set; }
        public String Assigned_By { get; set; }
        public String Status { get; set; }
        public String Veiwed { get; set; }
        public DateTime Date_Created { get; set; }
        public DateTime Date_Deadline { get; set; }
        public DateTime Date_Completed { get; set; }
    }
}