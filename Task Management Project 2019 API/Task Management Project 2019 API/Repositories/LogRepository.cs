using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class LogRepository
    {
        public static bool AddLogToDatabase(LogModel log)
        {
            var db = new DataClasses1DataContext();

            var add = new Log()
            {
                Username = log.Username,
                Division = log.Division,
                Description = log.Description,
                Status = log.Status,
                Date_Created = log.Date_Created,
                Incidedent = log.Incident
               
            };

            db.Logs.InsertOnSubmit(add);
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

        public static LogModel RetrieveLogFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var log = (from Log i in db.Logs
                          where i.Id.Equals(id)
                          select i).FirstOrDefault();

            var retLog = new LogModel
            {
                ID = log.Id,
                Username = log.Username,
                Division = log.Division,
                Description = log.Description,
                Status = log.Status,
                Date_Created = Convert.ToDateTime(log.Date_Created),
                Incident = log.Incidedent
               
            };


            return retLog;
        }

        public static List<LogModel> RetrieveAllLogsFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var log = from Log i in db.Logs
                         select i;

            var logList = new List<LogModel>();

            foreach (Log i in log)
            {
                var retLog = new LogModel
                {
                    ID = i.Id,
                    Username = i.Username,
                    Division = i.Division,
                    Description = i.Description,
                    Status = i.Status,
                    Date_Created = Convert.ToDateTime(i.Date_Created),
                    Incident = i.Incidedent
                   
                };
                logList.Add(retLog);

            }
            return logList;
        }

        public static bool UpdateLogOnDatabase(LogModel log)
        {
            var db = new DataClasses1DataContext();

            var info = (from Log i in db.Logs
                        where i.Id.Equals(log.ID)
                        select i).FirstOrDefault();


            info.Username = log.Username;
            info.Division = log.Division;
            info.Description = log.Description;
            info.Status = log.Status;
            info.Date_Created = log.Date_Created;
            info.Incidedent = log.Incident;
           

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


    }
}