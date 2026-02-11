using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Task_Management_Project_2019_API.Models
{
    public class FeedbackModel
    {
        public int ID { get; set; }
        public String Description { get; set; }
        public int ticketID { get; set; }
        public int logID { get; set; }
        public DateTime Created { get; set; }
       
        
    }
}