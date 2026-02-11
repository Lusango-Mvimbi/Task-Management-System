using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class SLAsProcessor
    {
        public static SLAModel processSLARetrival(string type)
        {
            return SLAs.RetrieveSLAFromDatabase(type);
        }


        public static DateTime processSLATicketDeadline(TicketModel ticket)
        {
            return SLAs.ticketDeadline(ticket);
        }
        
    }
}