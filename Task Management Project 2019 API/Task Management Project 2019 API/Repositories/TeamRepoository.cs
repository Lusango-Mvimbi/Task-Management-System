using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class TeamRepoository
    {
        public static bool AddTeamToDatabase(TeamModel Team)
        {
            var db = new DataClasses1DataContext();

            var add = new Team()
            {
                Id = Team.ID,
                Name = Team.Name,
                TeamLeader = Team.TeamLeader,
                Created = DateTime.Now,
                DivisionID = Team.DivisionID
            };

            db.Teams.InsertOnSubmit(add);
            try {
                db.SubmitChanges();
                return true;
            } catch(Exception) {
                return false;
            }

        }

        public static TeamModel RetrieveTeamFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var Team = (from Team i in db.Teams
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            var retTeam = new TeamModel
            {
                ID = Team.Id,
                Name = Team.Name,
                TeamLeader = Team.TeamLeader,
                Created = Convert.ToDateTime(Team.Created),
                DivisionID = Convert.ToInt32(Team.DivisionID)
            };


            return retTeam;
        }

        public static List<TeamModel> RetrieveAllTeamsFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var Team = from Team i in db.Teams
                         select i;

            var TeamList = new List<TeamModel>();

            foreach(Team i in Team)
            {
                var retTeam = new TeamModel
                {
                    ID = i.Id,
                    Name = i.Name,
                    TeamLeader = i.TeamLeader,
                    Created = Convert.ToDateTime(i.Created),
                    DivisionID = Convert.ToInt32(i.DivisionID)
                   
                };
                TeamList.Add(retTeam);

            }
            return TeamList;
        }
        public static bool UpdateTeamOnDatabase(TeamModel Team)
        {
            var db = new DataClasses1DataContext();

            var info = (from Team i in db.Teams
                        where i.Id.Equals(Team.ID)
                        select i).FirstOrDefault();


            info.Name = Team.Name;
            info.TeamLeader = Team.TeamLeader;
            
            try
            {
                db.SubmitChanges();
                return true;

            }catch(Exception)
            {
                return false;
            }


        }
        public static bool deleteFromDB(int id)
        {
            var db = new DataClasses1DataContext();
            var item = (from Team i in db.Teams
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            db.Teams.DeleteOnSubmit(item);

            try
            {
                db.SubmitChanges();
                return true;

            }
            catch (Exception ex)
            {
                ex.GetBaseException();
               
            }

            return false;
        }

    }
}