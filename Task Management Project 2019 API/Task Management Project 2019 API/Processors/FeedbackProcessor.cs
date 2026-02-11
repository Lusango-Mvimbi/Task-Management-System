using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class FeedbackProcessor
    {
        public static bool processFeedbackCreation(FeedbackModel Feedback)
        {
            return FeedbackRepository.AddFeedbackToDatabase(Feedback);
        }
        public static FeedbackModel processFeedbackRetrieval(int id)
        {
            return FeedbackRepository.RetrieveFeedbackFromDatabase(id);
        }
        public static List<FeedbackModel> processAllFeedbacksRetrieal()
        {
            return FeedbackRepository.RetrieveAllFeedbackFromDatabase();
        }
        public static bool processFeedbackUpdate(FeedbackModel Feedback)
        {
            return FeedbackRepository.UpdateFeedbackOnDatabase(Feedback);
        }
        public static bool processFeedbackDeletin(int id)
        {
            return FeedbackRepository.deleteFromDB(id);
        }
    }
}