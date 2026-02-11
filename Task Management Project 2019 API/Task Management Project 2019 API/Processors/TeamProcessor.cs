using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class TeamProcessor
    {
        public static bool processTeamCreation(TeamModel Team)
        {

            return TeamRepoository.AddTeamToDatabase(Team);
        }
        public static TeamModel processTeamRetrieval(int id)
        {
            return TeamRepoository.RetrieveTeamFromDatabase(id);
        }
        public static List<TeamModel> processAllTeamsRetrieal()
        {
            return TeamRepoository.RetrieveAllTeamsFromDatabase();
        }
        public static bool processTeamUpdate(TeamModel Team)
        {
            return TeamRepoository.UpdateTeamOnDatabase(Team);
        }
        public static bool processTeamDeletin(int id)
        {
            return TeamRepoository.deleteFromDB(id);
        }
    }
}