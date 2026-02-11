using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class TicketRepoository
    {
        public static bool AddTicketToDatabase(TicketModel ticket)
        {
            var db = new DataClasses1DataContext();

            var add = new Ticket()
            {
                Title = ticket.Title,
                Priority_Level = ticket.Priority_level,
                Description = ticket.Description,
                Created_By = ticket.Created_By,
                Assigned_To = ticket.Assigned_To,
                Assigned_By = ticket.Assigned_By,
                Status = ticket.Status,
                Date_Created = DateTime.Now,
                Date_Deadline = ticket.Date_Deadline,
                Date_Completed = ticket.Date_Completed,
                Division_Name = ticket.Division_Name,
                Team_Name = ticket.Team_Name,
                Incident_Type = ticket.IncidentType
            };

            db.Tickets.InsertOnSubmit(add);
            try {
                db.SubmitChanges();
                return true;
            } catch(Exception) {
                return false;
            }

        }

        public static TicketModel RetrieveTicketFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var ticket = (from Ticket i in db.Tickets
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            var retTicket = new TicketModel
            {
                ID = ticket.Id,
                Title = ticket.Title,
                Priority_level = ticket.Priority_Level,
                Description = ticket.Description,
                Created_By = ticket.Created_By,
                Assigned_To = ticket.Assigned_To,
                Assigned_By = ticket.Assigned_By,
                Status = ticket.Status,
                Date_Created = Convert.ToDateTime(ticket.Date_Created),
                Date_Deadline = Convert.ToDateTime(ticket.Date_Deadline),
                Date_Completed = Convert.ToDateTime(ticket.Date_Completed),
                Division_Name = ticket.Division_Name,
                Team_Name = ticket.Team_Name,
                IncidentType = ticket.Incident_Type
                
                
            };


            return retTicket;
        }

        public static List<TicketModel> RetrieveAllTicketsFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var ticket = from Ticket i in db.Tickets
                         select i;

            var ticketList = new List<TicketModel>();

            foreach(Ticket i in ticket)
            {
                var retTicket = new TicketModel
                {
                    ID = i.Id,
                    Title = i.Title,
                    Priority_level = i.Priority_Level,
                    Description = i.Description,
                    Created_By = i.Created_By,
                    Assigned_To = i.Assigned_To,
                    Assigned_By = i.Assigned_By,
                    Status = i.Status,
                    Date_Created = Convert.ToDateTime(i.Date_Created),
                    Date_Deadline = Convert.ToDateTime(i.Date_Deadline),
                    Date_Completed = Convert.ToDateTime(i.Date_Completed),
                    Division_Name = i.Division_Name,
                    Team_Name = i.Team_Name,
                    IncidentType = i.Incident_Type
                 
                };
                ticketList.Add(retTicket);

            }
            return ticketList;
        }
        public static bool UpdateTicketOnDatabase(TicketModel ticket)
        {
            var db = new DataClasses1DataContext();

            var info = (from Ticket i in db.Tickets
                        where i.Id.Equals(ticket.ID)
                        select i).FirstOrDefault();


            info.Title = ticket.Title;
            info.Priority_Level = ticket.Priority_level;
            info.Description = ticket.Description;
            info.Created_By = ticket.Created_By;
            info.Assigned_To = ticket.Assigned_To;
            info.Assigned_By = ticket.Assigned_By;
            info.Status = ticket.Status;
            info.Date_Created = ticket.Date_Created;
            info.Date_Deadline = ticket.Date_Deadline;
            info.Date_Completed = ticket.Date_Completed;
            info.Division_Name = ticket.Division_Name;
            info.Team_Name = ticket.Team_Name;
            info.Incident_Type = ticket.IncidentType;

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
            var item = (from Ticket i in db.Tickets
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            db.Tickets.DeleteOnSubmit(item);

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