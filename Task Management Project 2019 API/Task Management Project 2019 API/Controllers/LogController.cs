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
    
    public class LogController : ApiController
    {
        [Route("CreateLog")]
        public bool Post(LogModel incident)
        {

            String Status = "waitingForRespond";

            

            var logToAdd = new LogModel
            {
               
                Division =  incident.Division,
                Date_Created = DateTime.Now,
                Description = incident.Description,
                Status = Status,
                Username = incident.Username,
                Incident = incident.Incident
            };



            if(LogProcessor.processLogCreation(logToAdd))
            {

                var db = new DataClasses1DataContext();
                var user = from User i in db.Users
                           select i;

                string assigners = "";

                foreach (User i in user)
                {
                    if( i.isTeamLeader.Equals("y") && i.DivisionUnder.Equals(incident.Division))
                    {
                        assigners += i.Email + "|";
                    }
                }

                var add = new NotificationModel
                {
                    Description = "New incident logged",
                    Date_Created = DateTime.Now,
                    From_Username = incident.Username,
                    To_Username = assigners,
                    Veiwed = "-"
                };


                return NotificationProcessor.processNotificationCreation(add);


            }


            return false;

        }

        [Route("GetAllLogs")]
        public List<LogModel> Get()
        {
            return LogProcessor.processAllLogRetrieal();
        }

        //[Route("GetLog/{id}")]
        public LogModel Get(int id)
        {
            return LogProcessor.processLogRetrieval(id);
            
        }

        [Route("UpdateLog")]
        [HttpPost]
        // PUT api/values/5
        public bool Put(LogModel log)
        {
            return LogProcessor.processLogtUpdate(log);
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
