using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class TicketProcessor
    {
        public static bool processTicketCreation(TicketModel ticket)
        {

            return TicketRepoository.AddTicketToDatabase(ticket);
        }
        public static TicketModel processTicketRetrieval(int id)
        {
            return TicketRepoository.RetrieveTicketFromDatabase(id);
        }
        public static List<TicketModel> processAllTicketsRetrieal()
        {
            return TicketRepoository.RetrieveAllTicketsFromDatabase();
        }
        public static bool processTicketUpdate(TicketModel ticket)
        {
            return TicketRepoository.UpdateTicketOnDatabase(ticket);
        }
        public static bool processTicketDeletin(int id)
        {
            return TicketRepoository.deleteFromDB(id);
        }
    }
}