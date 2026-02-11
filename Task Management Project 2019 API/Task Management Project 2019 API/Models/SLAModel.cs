using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Task_Management_Project_2019_API.Models
{
    public class SLAModel
    {
        public int ID { get; set; }
        public String Type { get; set; }
        public String Urgent { get; set; }
        public String High { get; set; }
        public String Normal { get; set; }
        public String Low { get; set; }
        
    }
}