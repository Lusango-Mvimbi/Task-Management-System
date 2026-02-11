using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Task_Management_Project_2019_API.Models
{
    public class NotificationModel
    {
        public int ID { get; set; }
        public String From_Username { get; set; } 
        public String To_Username { get; set; } 
        public String Description { get; set; } 
        public String Veiwed { get; set; } 
        public DateTime Date_Created { get; set; } 
       
         
    }
}