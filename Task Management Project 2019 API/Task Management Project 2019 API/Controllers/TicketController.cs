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
    public class TicketController : ApiController
    {

        public bool Post(TicketModel ticket)
        {

            ticket.Date_Deadline = SLAsProcessor.processSLATicketDeadline(ticket);



            if (TicketProcessor.processTicketCreation(ticket))
            {
                if (ticket.Assigned_To != null || ticket.Assigned_To == "")
                {
                    var add = new NotificationModel
                    {
                        Description = "New assigned task",
                        Date_Created = DateTime.Now,
                        From_Username = ticket.Assigned_By,
                        To_Username = ticket.Assigned_To,
                        Veiwed = "-"

                    };

                    return NotificationProcessor.processNotificationCreation(add);

                }
                else
                {
                    return TicketProcessor.processTicketCreation(ticket);
                }



            }
            else
            {
                return false;
            }


        }


        [Route("GetAllTickets")]
        public List<TicketModel> Get()
        {
            return TicketProcessor.processAllTicketsRetrieal();
        }

       

        [Route("GetTicket/{id}")]
        public TicketModel Get(int id)
        {
            return TicketProcessor.processTicketRetrieval(id);
            
        }

        [Route("updateTicket")]
        [HttpPost]
        // PUT api/values/5
        public bool updateTicket(TicketModel ticket)
        {
            if (TicketProcessor.processTicketUpdate(ticket))
            {
                if (ticket.Status.Equals("underEvalution"))
                {

                    var db = new DataClasses1DataContext();
                    var user = from User i in db.Users
                               select i;

                    string assigners = "";


                    /*foreach (User i in user)
                    {
                        if (i.isTeamLeader.Equals("y") && i.DivisionUnder.Equals(ticket.Division_Name))
                        {
                            assigners += i.Email + "|";
                        }
                    }*/

                    assigners = ticket.Assigned_By;  // Sent back to assigner

                    var add = new NotificationModel
                    {
                        Description = "Task waiting for review",
                        Date_Created = DateTime.Now,
                        From_Username = ticket.Assigned_To,
                        To_Username = assigners,
                        Veiwed = "-"
                    };

                    return NotificationProcessor.processNotificationCreation(add);

                }
                else if (ticket.Description.StartsWith("Re-assign |")) {

                    var add = new NotificationModel
                    {
                        Description = "Task re-assigned",
                        Date_Created = DateTime.Now,
                        From_Username = ticket.Assigned_By,
                        To_Username = ticket.Assigned_To,
                        Veiwed = "-"

                    };

                    return NotificationProcessor.processNotificationCreation(add);


                }
                else
                {
                    return true;
                }

            }


            return false;
        }


        [Route("Accept")]
        public bool accepttASK(int id)
        {
            var db = new DataClasses1DataContext();
            var ticket = (from Ticket i in db.Tickets
                          where i.Id.Equals(id)
                          select i).FirstOrDefault();
            ticket.Status = "active";

            var findingticketlog = (from Feedback f in db.Feedbacks
                                    where f.ticketID.Equals(id)
                                    select f).FirstOrDefault();

            /*   if (findingticketlog.logID != 0)
               {
                   var addingFeedback = new Feedback
                   {
                       description = "Task Accepted " + ticket.Assigned_To,
                       ticketID = id,
                       logID = findingticketlog.logID,
                       Created = DateTime.Now,
                   };

                   db.Feedbacks.InsertOnSubmit(addingFeedback);
               }*/


            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;

            }
            //return false;
        }

        [Route("Submit")]
        public bool submit(int id)
        {
            var db = new DataClasses1DataContext();
            var ticket = (from Ticket i in db.Tickets
                          where i.Id.Equals(id)
                          select i).FirstOrDefault();


            ticket.Status = "underEvalution";



            var findingticketlog = (from Feedback f in db.Feedbacks
                                    where f.ticketID.Equals(id)
                                    select f).FirstOrDefault();
            //  int _logID = Convert.ToInt32(findingticketlog.logID);

            /* var addingFeedback = new Feedback
             {
                 description = "Task sent for review.",
                 ticketID = id,
                 logID = _logID,
                 Created = DateTime.Now,
             };
             db.Feedbacks.InsertOnSubmit(addingFeedback);*/

            var newNotification = new Notification
            {
                From_Username = ticket.Assigned_To,
                To_Username = ticket.Assigned_To,
                Description = "Task waiting for review",
                Veiwed = "-",
                Date_Created = DateTime.Now

            };

            db.Notifications.InsertOnSubmit(newNotification);
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



        // DELETE api/values/5
        public void Delete(int id)
        {
            TicketProcessor.processTicketDeletin(id);
        }
    }
}
