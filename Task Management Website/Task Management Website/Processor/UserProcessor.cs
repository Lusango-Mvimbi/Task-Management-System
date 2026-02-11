using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Task_Management_Website.Repositories;
using Task_Management_Website.assets.Model;


namespace Task_Management_Website.Processor
{
    public class UserProcessor
    {

        public static async Task<bool> processUserCreation(UserInfo user)
        {
            return await UserRepoository.CreateUser(user);
        }

        public static async Task<bool> processUserUpdate(UserInfo User)
        {
            return await UserRepoository.UpdateUser(User);
        }

        public static async Task<UserInfo> processUserRetrival(int id)
        {
            
            return null;
        }

        public static async Task<List<UserInfo>> processAllUserRetrival()
        {
           
            return null;
        }


        public async Task<bool> RetrieveUser()
        {
            

            return true;
        }


    }
}