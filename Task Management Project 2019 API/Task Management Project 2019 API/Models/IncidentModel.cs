using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Task_Management_Project_2019_API.Models
{
    public class IncidentModel
    {
        public int ID { get; set; }
        public String Name { get; set; }
        public int DivisionID { get; set; }
        public String TeamID { get; set; }
        public DateTime Created { get; set; }
       
        
    }
}