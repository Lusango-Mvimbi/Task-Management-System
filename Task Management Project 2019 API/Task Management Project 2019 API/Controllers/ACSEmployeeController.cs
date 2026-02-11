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
    public class ACSEmployeeController : ApiController
    {
        
        [Route("GetAllEmployees")]
        public List<UserModel> Get()
        {
            return ACSEmployeeProcessor.processAllUsersRetrieal();
        }

        [Route("GetEmployee/{id}")]
        public UserModel Get(int id)
        {
            return ACSEmployeeProcessor.processUserRetrieval(id);

        }




    }
}
