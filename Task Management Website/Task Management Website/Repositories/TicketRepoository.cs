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
    public class TicketRepoository : ApiController
    {
        public static async Task<bool> CreateTicket(TicketInfo ticket)
        {
            var client = new HttpClient();
            var jsonContent = JsonConvert.SerializeObject(ticket);
            var httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");
            var response = await client.PostAsync("http://localhost:53129/CreateTicket", httpContent);
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

        public static async Task<string> RetrieveTicket(int id)
        {
            var client = new HttpClient();
            var response = await client.GetAsync("http://localhost:53129/GetTicket" + id);
            var responseString = await response.Content.ReadAsStringAsync();
            return responseString;

        }

        public static async Task<string> RetrieveAllTickets()
        {
            var client = new HttpClient();
            var response = await client.GetAsync("http://localhost:53129/GetAllTickets");
            var responseString = await response.Content.ReadAsStringAsync();
            return responseString;
        }

        public static async Task<bool> UpdateTicket(TicketInfo ticket)
        {
            var client = new HttpClient();
            var jsonContent = JsonConvert.SerializeObject(ticket);
            var httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");
            var response = await client.PutAsync("http://localhost:53129/UpdateTicket", httpContent);
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
        //public static async Task<bool> delTicket(int id)
        //{
        //    var client = new HttpClient();
        //    var response = await client.Async("http://localhost:53129/GetTicket" + id);
        //    var responseString = await response.Content.ReadAsStringAsync();

        //    if (responseString == "false")
        //    {
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }

        //}




    }
}