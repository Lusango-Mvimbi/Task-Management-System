using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class FeedbackRepository
    {

        public static bool AddFeedbackToDatabase(FeedbackModel Feedback)
        {
            var db = new DataClasses1DataContext();

            var add = new Feedback()
            {
                description = Feedback.Description,                
                ticketID = Feedback.ticketID,                
                logID = Feedback.logID,                
                Created = DateTime.Now,                
            };

            db.Feedbacks.InsertOnSubmit(add);
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

        public static FeedbackModel RetrieveFeedbackFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var Feedback = (from Feedback i in db.Feedbacks
                          where i.Id.Equals(id)
                          select i).FirstOrDefault();

            var retFeedback = new FeedbackModel()
            {
                ID = Feedback.Id,
                Description = Feedback.description,
                ticketID = Convert.ToInt32(Feedback.ticketID),
                logID = Convert.ToInt32(Feedback.logID),
                Created = Convert.ToDateTime(Feedback.Created),

            };


            return retFeedback;
        }

        public static List<FeedbackModel> RetrieveAllFeedbackFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var Feedback = from Feedback i in db.Feedbacks
                         select i;

            var FeedbackList = new List<FeedbackModel>();

            foreach (Feedback i in Feedback)
            {
                var retFeedback = new FeedbackModel()
                {
                    ID = i.Id,
                    Description = i.description,
                    ticketID = Convert.ToInt32(i.ticketID),
                    logID = Convert.ToInt32(i.logID),
                    Created = Convert.ToDateTime(i.Created),

                };
                FeedbackList.Add(retFeedback);

            }
            return FeedbackList;
        }
        public static bool UpdateFeedbackOnDatabase(FeedbackModel Feedback)
        {
            var db = new DataClasses1DataContext();

            var info = (from Feedback i in db.Feedbacks
                        where i.Id.Equals(Feedback.ID)
                        select i).FirstOrDefault();

            info.description = Feedback.Description;
            info.ticketID = Convert.ToInt32(Feedback.ticketID);
            info.logID = Convert.ToInt32(Feedback.logID);
            info.Created = Convert.ToDateTime(Feedback.Created);

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
            var item = (from Feedback i in db.Feedbacks
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            db.Feedbacks.DeleteOnSubmit(item);

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