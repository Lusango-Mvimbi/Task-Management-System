using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using Task_Management_Website.assets.Model;

namespace Task_Management_Website.Repositories
{
    public class UserRepoository : ApiController
    {



        public static async Task<bool> CreateUser(UserInfo user)
        {
            var client = new HttpClient();
            var jsonContent = JsonConvert.SerializeObject(user);
            var httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");
            var response = await client.PostAsync("http://localhost:53129/CreateUser", httpContent);
            var responseString = await response.Content.ReadAsStringAsync();

            if (responseString == "false")
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public static async Task<string> RetrieveUser(int id)
        {
            var client = new HttpClient();
            var response = await client.GetAsync("http://localhost:53129/GetUser/" + id);
            var responseString = await response.Content.ReadAsStringAsync();
            return responseString;

        }

        public static async Task<string> RetrieveAllUsers()
        {
            var client = new HttpClient();
            var response = await client.GetAsync("http://localhost:53129/GetAllUsers");
            var responseString = await response.Content.ReadAsStringAsync();
            return responseString;
        }

        public static async Task<bool> UpdateUser(UserInfo user)
        {
            var client = new HttpClient();
            var jsonContent = JsonConvert.SerializeObject(user);
            var httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");
            var response = await client.PutAsync("http://localhost:53129/UpdateUser", httpContent);
            var responseString = await response.Content.ReadAsStringAsync();

            if (responseString == "false")
            {
                return false;
            }
            else
            {
                return true;
            }

        }





    }
}