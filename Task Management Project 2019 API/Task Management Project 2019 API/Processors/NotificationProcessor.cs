using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class NotificationProcessor
    {
        public static bool processNotificationCreation(NotificationModel Notification)
        {
            return NotificationRepository.AddNotificationToDatabase(Notification);
        }
        public static NotificationModel processNotificationRetrieval(int id)
        {
            return NotificationRepository.RetrieveNotificationFromDatabase(id);
        }
        public static List<NotificationModel> processAllNotificationsRetrieal()
        {
            return NotificationRepository.RetrieveAllNotificationsFromDatabase();
        }
       
    }
}