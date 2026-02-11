using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class IncidentProcessor
    {
        public static bool processIncidentCreation(IncidentModel Incident)
        {
            return IncidentRepository.AddIncidentToDatabase(Incident);
        }
        public static IncidentModel processIncidentRetrieval(int id)
        {
            return IncidentRepository.RetrieveIncidentFromDatabase(id);
        }
        public static IncidentModel processIncidentRetrieval(String incidentName)
        {
            return IncidentRepository.RetrieveIncidentFromDatabase(incidentName);
        }
        public static List<IncidentModel> processAllIncidentsRetrieal()
        {
            return IncidentRepository.RetrieveAllIncidentFromDatabase();
        }
        public static bool processIncidentUpdate(IncidentModel Incident)
        {
            return IncidentRepository.UpdateIncidentOnDatabase(Incident);
        }
        public static bool processIncidentDeletin(int id)
        {
            return IncidentRepository.deleteFromDB(id);
        }
    }
}