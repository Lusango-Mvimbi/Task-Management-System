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
    public class TeamController : ApiController
    {
        // POST api/values
        public bool Post(TeamModel team)
        {
            return TeamProcessor.processTeamCreation(team);
        }

        [Route("GetAllTeams")]
        public List<TeamModel> Get()
        {
            return TeamProcessor.processAllTeamsRetrieal();
        }

        // GET api/values/5
        public TeamModel Get(int id)
        {
            return TeamProcessor.processTeamRetrieval(id);
        }


        // PUT api/values/5
        public bool Put(TeamModel team)
        {
            return TeamProcessor.processTeamUpdate(team);
        }

        // DELETE api/values/5
        public bool Delete(int id)
        {
            return TeamProcessor.processTeamDeletin(id);
        }
    }
}
