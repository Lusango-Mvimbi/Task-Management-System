using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class IncidentRepository
    {

        public static bool AddIncidentToDatabase(IncidentModel Incident)
        {
            var db = new DataClasses1DataContext();

            var add = new Incident()
            {
                Name = Incident.Name,
                Created = Incident.Created,
                DivisionID = Incident.DivisionID,
                TeamID = Incident.TeamID
               
            };

            db.Incidents.InsertOnSubmit(add);
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public static IncidentModel RetrieveIncidentFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var Incident = (from Incident i in db.Incidents
                          where i.Id.Equals(id)
                          select i).FirstOrDefault();

            var retIncident = new IncidentModel()
            {

                ID = Incident.Id,
                Name = Incident.Name,
                Created = Convert.ToDateTime(Incident.Created),
                DivisionID = Convert.ToInt32(Incident.DivisionID),
                TeamID = Incident.TeamID

            };


            return retIncident;
        }

        public static IncidentModel RetrieveIncidentFromDatabase(String  incidentName)
        {
            var db = new DataClasses1DataContext();
            var Incident = (from Incident i in db.Incidents
                            where i.Name.Equals(incidentName)
                            select i).FirstOrDefault();
            if(Incident != null)
            {
                var retIncident = new IncidentModel()
                {

                    ID = Incident.Id,
                    Name = Incident.Name,
                    Created = Convert.ToDateTime(Incident.Created),
                    DivisionID = Convert.ToInt32(Incident.DivisionID),
                    TeamID = Incident.TeamID

                };


                return retIncident;
            }

            return null;
        }


        public static List<IncidentModel> RetrieveAllIncidentFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var Incident = from Incident i in db.Incidents
                         select i;

            var IncidentList = new List<IncidentModel>();

            foreach (Incident i in Incident)
            {
                var retIncident = new IncidentModel()
                {

                    ID = i.Id,
                    Name = i.Name,
                    Created = Convert.ToDateTime(i.Created),
                    DivisionID = Convert.ToInt32(i.DivisionID),
                    TeamID = i.TeamID

                };
                IncidentList.Add(retIncident);

            }
            return IncidentList;
        }
        public static bool UpdateIncidentOnDatabase(IncidentModel Incident)
        {
            var db = new DataClasses1DataContext();

            var info = (from Incident i in db.Incidents
                        where i.Id.Equals(Incident.ID)
                        select i).FirstOrDefault();

            info.Name = Incident.Name;
            info.Created = Convert.ToDateTime(Incident.Created);
            info.DivisionID = Convert.ToInt32(Incident.DivisionID);
            info.TeamID = Incident.TeamID;

            try
            {
                db.SubmitChanges();
                return true;

            }
            catch (Exception)
            {
                return false;
            }


        }

        public static bool deleteFromDB(int id)
        {
            var db = new DataClasses1DataContext();
            var item = (from Incident i in db.Incidents
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            db.Incidents.DeleteOnSubmit(item);

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