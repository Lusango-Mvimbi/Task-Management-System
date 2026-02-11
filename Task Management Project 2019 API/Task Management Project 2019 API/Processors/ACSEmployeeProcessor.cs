using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class ACSEmployeeProcessor
    {
        public static List<UserModel> processAllUsersRetrieal()
        {
            return ACSEmployeeRepository.RetrieveAllUserFromDatabase();
        }

        public static UserModel processUserRetrieval(int id)
        {
            return ACSEmployeeRepository.RetrieveUserFromDatabase(id);
        }


    }
}