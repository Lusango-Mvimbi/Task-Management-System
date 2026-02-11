using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Task_Management_Project_2019_API.Models
{
    public class TicketModel
    {
        public int ID { get; set; }
        public String Title { get; set; } 
        public String Priority_level { get; set; } 
        public String Description { get; set; } 
        public String Created_By { get; set; } 
        public String Assigned_To { get; set; } 
        public String Assigned_By { get; set; } 
        public String Status { get; set; } 
        public DateTime Date_Created { get; set; } 
        public DateTime Date_Deadline { get; set; } 
        public DateTime Date_Completed { get; set; }
        public String Division_Name { get; set; }
        public String Team_Name { get; set; }
        public String IncidentType { get; set; }
    }
}