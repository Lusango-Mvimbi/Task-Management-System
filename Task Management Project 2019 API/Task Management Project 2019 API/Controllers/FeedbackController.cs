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
    public class FeedbackController : ApiController
    {
        // POST api/values
        public bool Post(FeedbackModel Feedback)
        {
            return FeedbackProcessor.processFeedbackCreation(Feedback);
        }

        [Route("GetAllFeedbacks")]
        public List<FeedbackModel> Get()
        {
            return FeedbackProcessor.processAllFeedbacksRetrieal();
        }

        // GET api/values/5
        public FeedbackModel Get(int id)
        {
            return FeedbackProcessor.processFeedbackRetrieval(id);
        }


        // PUT api/values/5
        public bool Put(FeedbackModel Feedback)
        {
            return FeedbackProcessor.processFeedbackUpdate(Feedback);
        }

        [Route("UpdateFeedback")]
        [HttpPost]
        public bool UpdateFeedback(FeedbackModel Feedback)
        {
            return FeedbackProcessor.processFeedbackUpdate(Feedback);
        }

        // DELETE api/values/5
        public bool Delete(int id)
        {
            return FeedbackProcessor.processFeedbackDeletin(id);
        }
    }
}
