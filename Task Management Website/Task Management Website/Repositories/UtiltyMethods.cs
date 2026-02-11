using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Task_Management_Website.assets.Model;
using Task_Management_Website.Processor;

namespace Task_Management_Website.Repositories
{
    public class UtiltyMethods
    {
        public static string jsonDateFix(String dateInput)
        {
            String date = dateInput.Split('T')[0];
            string[] splitDate = date.Split('-');
            String finDate = splitDate[2] + "/" + splitDate[1] + "/" + splitDate[0];
            return finDate;
        }


        public static List<string> getListOfTickets(List<string> list)
        {
            list.Add("first");
            list.Add("sec");
            list.Add("third");


            return list;
        }


        




    }
}