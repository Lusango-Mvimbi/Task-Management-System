using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Task_Management_Project_2019_API.Models
{
    public class UserModel
    {
        public int ID { get; set; }
        public String Title { get; set; }
        public String First_Name { get; set; }
        public String Last_Name { get; set; }
        public String Position { get; set; }
        public String Skills { get; set; }
        public String Email { get; set; }
        public String Username { get; set; }
        public String Password { get; set; }
        public String isAssigner { get; set; }
        public String isTeamLeader { get; set; }
        public String TeamLeading { get; set; }
        public String TeamUnder { get; set; }
        public String DivisionUnder { get; set; }
        public DateTime Created { get; set; }
    }
}