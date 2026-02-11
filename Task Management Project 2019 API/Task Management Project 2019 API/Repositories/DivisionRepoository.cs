using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Repositories
{
    public class DivisionRepoository
    {
        public static bool AddDivisionToDatabase(DivisionModel Division)
        {
            var db = new DataClasses1DataContext();

            var add = new Division()
            {
                Name = Division.Name,
                Created = Division.Created
                
            };

            db.Divisions.InsertOnSubmit(add);
            try {
                db.SubmitChanges();
                return true;
            } catch(Exception) {
                return false;
            }

        }

        public static DivisionModel RetrieveDivisionFromDatabase(int id)
        {
            var db = new DataClasses1DataContext();
            var Division = (from Division i in db.Divisions
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            var retDivision = new DivisionModel
            {
                ID = Division.Id,
                Name = Division.Name,
                Created = Convert.ToDateTime(Division.Created),
                
            };


            return retDivision;
        }

        public static List<DivisionModel> RetrieveAllDivisionsFromDatabase()
        {
            var db = new DataClasses1DataContext();
            var Division = from Division i in db.Divisions
                         select i;

            var DivisionList = new List<DivisionModel>();

            foreach(Division i in Division)
            {
                var retDivision = new DivisionModel
                {
                    ID = i.Id,
                    Name = i.Name,
                    Created = Convert.ToDateTime(i.Created),
                };
                DivisionList.Add(retDivision);

            }
            return DivisionList;
        }
        public static bool UpdateDivisionOnDatabase(DivisionModel Division)
        {
            var db = new DataClasses1DataContext();

            var info = (from Division i in db.Divisions
                        where i.Id.Equals(Division.ID)
                        select i).FirstOrDefault();



            info.Name = Division.Name;
            
            try
            {
                db.SubmitChanges();
                return true;

            }catch(Exception)
            {
                return false;
            }


        }
        public static bool deleteFromDB(int id)
        {
            var db = new DataClasses1DataContext();
            var item = (from Division i in db.Divisions
                        where i.Id.Equals(id)
                        select i).FirstOrDefault();

            db.Divisions.DeleteOnSubmit(item);

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