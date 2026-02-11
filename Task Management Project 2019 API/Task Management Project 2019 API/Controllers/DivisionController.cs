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
    public class DivisionController : ApiController
    {
        public bool Post(DivisionModel division)
        {

            

            

            var add = new DivisionModel()
            {
               Name = division.Name,
               Created = DateTime.Now,
                
            };


            return DivisionProcessor.processDivisionCreation(add);

        }

        [Route("GetAllDivisions")]
        public List<DivisionModel> Get()
        {
            return DivisionProcessor.processAllDivisionsRetrieal();
        }

        [Route("GetLog/{id}")]
        public DivisionModel Get(int id)
        {
            return DivisionProcessor.processDivisionRetrieval(id);
            
        }

   
        // PUT api/values/5
        public bool Put(DivisionModel division)
        {
            return DivisionProcessor.processDivisionUpdate(division);
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
