using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class ACSEmployeeRepository
    {

        public static List<UserModel> RetrieveAllUserFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var user = from AltechEmployee i in db.AltechEmployees
                         select i;

            var userList = new List<UserModel>();

            foreach (AltechEmployee i in user)
            {

                
                   
                    i.Email = i.Email.ToLower();

                    try
                    {
                        db.SubmitChanges();
                        

                    }
                    catch (Exception)
                    {
                        
                    }


                



                var retUser = new UserModel()
                {

                    ID = i.Emp_Id,
                    Title = i.Title,
                    First_Name = i.First_Name,
                    Last_Name = i.Last_Name,
                    Position = i.Position,
                    Skills = i.Skills,
                    Email = i.Email,
                    DivisionUnder = i.Division,
                    

                };
                userList.Add(retUser);

            }
            return userList;
        }

        public static UserModel RetrieveUserFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var user = (from AltechEmployee i in db.AltechEmployees
                        where i.Emp_Id.Equals(id)
                        select i).FirstOrDefault();

            var retUser = new UserModel()
            {

                ID = user.Emp_Id,
                Title = user.Title,
                First_Name = user.First_Name,
                Last_Name = user.Last_Name,
                Position = user.Position,
                Skills = user.Skills,
                Email = user.Email,
                DivisionUnder = user.Division,
                

            };


            return retUser;
        }



    }
}