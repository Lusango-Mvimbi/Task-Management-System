using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Task_Management_Project_2019_API.Models
{
    public class LogModel
    {
        public int ID { get; set; }
        public String Username { get; set; }
        public String Division { get; set; }
        public String Incident { get; set; }
        public String Description { get; set; }
        public String Status { get; set; }
        public DateTime Date_Created { get; set; }
        
    }
}