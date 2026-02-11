using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Task_Management_Project_2019_API.Models;
using Task_Management_Project_2019_API.Processors;

namespace Task_Management_Project_2019_API.Controllers
{
    public class IncidentController : ApiController
    {
        // POST api/values
        public bool Post(IncidentModel Incident)
        {
            return IncidentProcessor.processIncidentCreation(Incident);
        }

        [Route("GetAllIncidents")]
        public List<IncidentModel> Get()
        {
            return IncidentProcessor.processAllIncidentsRetrieal();
        }

        // GET api/values/5
        public IncidentModel Get(int id)
        {
            return IncidentProcessor.processIncidentRetrieval(id);
        }

        public IncidentModel Get(string Incident_Name)
        {
            return IncidentProcessor.processIncidentRetrieval(Incident_Name);
        }


        // PUT api/values/5
        public bool Put(IncidentModel Incident)
        {
            return IncidentProcessor.processIncidentUpdate(Incident);
        }

        // DELETE api/values/5
        public bool Delete(int id)
        {
            return IncidentProcessor.processIncidentDeletin(id);
        }
    }
}
