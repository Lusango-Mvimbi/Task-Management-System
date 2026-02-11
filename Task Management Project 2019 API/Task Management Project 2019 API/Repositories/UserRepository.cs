using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class UserRepository
    {

        public static bool AddUserToDatabase(UserModel user)
        {
            var db = new DataClasses1DataContext();

            var add = new User()
            {
                Title = user.Title,
                First_Name = user.First_Name,
                Last_Name = user.Last_Name,
                Position = user.Position,
                Skills = user.Skills,
                Email = user.Email,
                Username = user.Username,
                Password = user.Password,
                isAssigner = user.isAssigner,
                isTeamLeader = user.isTeamLeader,
                DivisionUnder = user.DivisionUnder,
                Created = user.Created,
                TeamLeading = user.TeamLeading,
                TeamUnder = user.TeamUnder                
            };

            db.Users.InsertOnSubmit(add);
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

        public static UserModel RetrieveUserFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var user = (from User i in db.Users
                          where i.Id.Equals(id)
                          select i).FirstOrDefault();

            var retUser = new UserModel()
            {

                ID = user.Id,
                Title = user.Title,
                First_Name = user.First_Name,
                Last_Name = user.Last_Name,
                Position = user.Position,
                Skills = user.Skills,
                Email = user.Email,
                Username = user.Username,
                Password = user.Password,
                isAssigner = user.isAssigner,
                Created = Convert.ToDateTime(user.Created),
                DivisionUnder = user.DivisionUnder,
                isTeamLeader = user.isTeamLeader,
                TeamLeading = user.TeamLeading,
                TeamUnder = user.TeamUnder,
                
            };


            return retUser;
        }

        public static List<UserModel> RetrieveAllUserFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var user = from User i in db.Users
                         select i;

            var userList = new List<UserModel>();

            foreach (User i in user)
            {
                var retUser = new UserModel()
                {

                    ID = i.Id,
                    Title = i.Title,
                    First_Name = i.First_Name,
                    Last_Name = i.Last_Name,
                    Position = i.Position,
                    Skills = i.Skills,
                    Email = i.Email,
                    Username = i.Username,
                    Password = i.Password,
                    isAssigner = i.isAssigner,
                    Created = Convert.ToDateTime(i.Created),
                    DivisionUnder = i.DivisionUnder,
                    isTeamLeader = i.isTeamLeader,
                    TeamLeading = i.TeamLeading,
                    TeamUnder = i.TeamUnder,
                    
                };
                userList.Add(retUser);

            }
            return userList;
        }
        public static bool UpdateUserOnDatabase(UserModel user)
        {
            var db = new DataClasses1DataContext();

            var info = (from User i in db.Users
                        where i.Id.Equals(user.ID)
                        select i).FirstOrDefault();

            info.Title = user.Title;
            info.First_Name = user.First_Name;
            info.Last_Name = user.Last_Name;
            info.Position = user.Position;
            info.Skills = user.Skills;
            info.Email = user.Email;
            info.Username = user.Email;
            info.isTeamLeader = user.isTeamLeader;
            info.isAssigner = user.isTeamLeader;
            info.TeamLeading = user.TeamLeading;
            info.TeamUnder = user.TeamUnder;
            info.DivisionUnder = user.DivisionUnder;
            
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

        public static bool deleteFromDB(int id)
        {
            var db = new DataClasses1DataContext();
            var item = (from User i in db.Users
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            db.Users.DeleteOnSubmit(item);

            try
            {
                db.SubmitChanges();
                return true;

            }
            catch (Exception ex)
            {
                ex.GetBaseException();

            }

            return false;
        }


    }
}