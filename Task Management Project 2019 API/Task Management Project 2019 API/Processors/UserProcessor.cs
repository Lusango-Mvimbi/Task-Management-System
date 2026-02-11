using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class UserProcessor
    {
        public static bool processUserCreation(UserModel user)
        {
            return UserRepository.AddUserToDatabase(user);
        }
        public static UserModel processUserRetrieval(int id)
        {
            return UserRepository.RetrieveUserFromDatabase(id);
        }
        public static List<UserModel> processAllUsersRetrieal()
        {
            return UserRepository.RetrieveAllUserFromDatabase();
        }
        public static bool processUserUpdate(UserModel user)
        {
            return UserRepository.UpdateUserOnDatabase(user);
        }
        public static bool processUserDeletin(int id)
        {
            return UserRepository.deleteFromDB(id);
        }
    }
}