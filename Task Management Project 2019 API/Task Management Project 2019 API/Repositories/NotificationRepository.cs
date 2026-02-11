using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class NotificationRepository
    {
        public static bool AddNotificationToDatabase(NotificationModel Notification)
        {
            var db = new DataClasses1DataContext();

            var add = new Notification()
            {
                From_Username = Notification.From_Username,
                To_Username = Notification.To_Username,
                Description = Notification.Description,
                Veiwed = Notification.Veiwed,
                Date_Created = Notification.Date_Created,
                
                
            };

            db.Notifications.InsertOnSubmit(add);
            try {
                db.SubmitChanges();
                return true;
            } catch(Exception) {
                return false;
            }

        }

        public static NotificationModel RetrieveNotificationFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var Notification = (from Notification i in db.Notifications
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            var retNotification = new NotificationModel
            {
                From_Username = Notification.From_Username,
                To_Username = Notification.To_Username,
                Description = Notification.Description,
                Veiwed = Notification.Veiwed,
                Date_Created = Notification.Date_Created,
                
            };


            return retNotification;
        }

        public static List<NotificationModel> RetrieveAllNotificationsFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var Notification = from Notification i in db.Notifications
                         select i;

            var NotificationList = new List<NotificationModel>();

            foreach(Notification i in Notification)
            {
                var retNotification = new NotificationModel
                {
                    From_Username = i.From_Username,
                    To_Username = i.To_Username,
                    Description = i.Description,
                    Veiwed = i.Veiwed,
                    Date_Created = i.Date_Created,
                   

                };
                NotificationList.Add(retNotification);

            }
            return NotificationList;
        }


    }
}