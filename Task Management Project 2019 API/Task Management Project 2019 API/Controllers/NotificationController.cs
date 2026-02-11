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
    public class NotificationController : ApiController
    {
        

        [Route("GetAllNotifications")]
        public List<NotificationModel> Get()
        {
            return NotificationProcessor.processAllNotificationsRetrieal();
        }

        [Route("GetNotifications/{id}")]
        public NotificationModel Get(int id)
        {
            return NotificationProcessor.processNotificationRetrieval(id);
            
        }

        
    }
}
