using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class LogProcessor
    {
        public static bool processLogCreation(LogModel log)
        {
            return LogRepository.AddLogToDatabase(log);
        }

        public static LogModel processLogRetrieval(int id)
        {
            return LogRepository.RetrieveLogFromDatabase(id);
        }
        public static List<LogModel> processAllLogRetrieal()
        {
            return LogRepository.RetrieveAllLogsFromDatabase();
        }
        public static bool processLogtUpdate(LogModel log)
        {
            return LogRepository.UpdateLogOnDatabase(log);
        }
    }
}