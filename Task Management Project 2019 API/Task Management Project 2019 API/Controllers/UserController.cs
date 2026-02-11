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
    public class UserController : ApiController
    {
        //[Route("CreateUser")]
        public bool Post(UserModel user)
        {
            if (user == null) { return false; }

            string pass = user.Password;
            user.Password = Secrecy.HashPassword(pass);
            user.Created = DateTime.Now;

            return UserProcessor.processUserCreation(user);

        }

        [Route("GetAllUsers")]
        public List<UserModel> Get()
        {
            return UserProcessor.processAllUsersRetrieal();
        }

        [Route("SignIn")]
        public UserModel Get(String user, String pass)
        {

            var data = new UserModel();

           

            var userList = UserProcessor.processAllUsersRetrieal();

            foreach (var value in userList)
            {

                if (value.Email.Equals(user) && value.Password.Equals(Secrecy.HashPassword(pass)))
                {
                    data.Email = value.Email;
                    data.First_Name = value.First_Name;
                    data.isAssigner = value.isAssigner;
                    data.ID = value.ID;
                    data.Last_Name = value.Last_Name;
                    data.Position = value.Position;
                    data.Skills = value.Skills;
                    data.Username = value.Username;
                    data.Title = value.Title;
                    data.isTeamLeader = value.isTeamLeader;
                    data.TeamLeading = value.TeamLeading;
                    data.DivisionUnder = value.DivisionUnder;
                    data.TeamUnder = value.TeamUnder;
                    

                }

                 //    if(value.Email.Equals(user) && value.Password.Equals(Secrecy.HashPassword(pass)))
                //    {
                //        return UserProcessor.processUserRetrieval(value.ID);
                //    }
            }

            return data;


        }

        [Route("GetUser/{id}")]
        public UserModel Get(int id)
        {
            return UserProcessor.processUserRetrieval(id);


        }

        [Route("UpdateUser")]
        [HttpPost]
        // PUT api/values/5
        public bool Put(UserModel user)
        {
            return UserProcessor.processUserUpdate(user);
        }


        [Route("DeleteUser/{id}")]
        [HttpPost]
        // DELETE api/values/5
        public bool Delete(int id)
        {
            return UserProcessor.processUserDeletin(id);
        }
    }
}
