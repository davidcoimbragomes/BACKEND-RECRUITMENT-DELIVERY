using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Web.Configuration;
using System.Web.Http;

namespace WebAPI.Controllers
{
    public class ShareController : ApiController
    {
        [HttpPost]
        public IHttpActionResult share(string destinationemail, string content_url)
        {
            try
            {
                //Provide your gmail access in the webconfig
                string gmailaddress = WebConfigurationManager.AppSettings["gmailaddress"];
                string password = WebConfigurationManager.AppSettings["password"];

                SmtpClient client = new SmtpClient();
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential(gmailaddress, password);

                MailMessage mm = new MailMessage("donotreply@domain.com", destinationemail, "Check this link", content_url);
                mm.BodyEncoding = UTF8Encoding.UTF8;
                mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

                client.Send(mm);
                return Ok();
            }
            catch (Exception e)
            {
                return InternalServerError(new Exception(e.Message));
            }

        }
    }
}
