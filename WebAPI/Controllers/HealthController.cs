using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class HealthController : ApiController
    {

        [HttpGet]
        [ResponseType(typeof(StatusModel))]
        public IHttpActionResult health()
        {
            //Responsetype of type StatusModel because in the example the answer was identical 
            try
            {
                StatusModel response = new StatusModel();
                response.Status = "OK";
                return Ok(response);
            }
            catch (Exception e)
            {
                return InternalServerError(new Exception(e.Message));
            }
        }
    }
}
