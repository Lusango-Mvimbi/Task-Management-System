using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Task_Management_Project_2019_API.Repositories;
using Task_Management_Project_2019_API.Models;

namespace Task_Management_Project_2019_API.Processors
{
    public class DivisionProcessor
    {
        public static bool processDivisionCreation(DivisionModel Division)
        {

            return DivisionRepoository.AddDivisionToDatabase(Division);
        }
        public static DivisionModel processDivisionRetrieval(int id)
        {
            return DivisionRepoository.RetrieveDivisionFromDatabase(id);
        }
        public static List<DivisionModel> processAllDivisionsRetrieal()
        {
            return DivisionRepoository.RetrieveAllDivisionsFromDatabase();
        }
        public static bool processDivisionUpdate(DivisionModel Division)
        {
            return DivisionRepoository.UpdateDivisionOnDatabase(Division);
        }
        public static bool processDivisionDeletin(int id)
        {
            return DivisionRepoository.deleteFromDB(id);
        }
    }
}