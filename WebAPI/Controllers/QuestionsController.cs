using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Http.Description;
using WebAPI.Models;
using WebAPI_DAL.Model;

namespace WebAPI.Controllers
{


    public class QuestionsController : ApiController
    {

        blissEntities db = new blissEntities();







        [HttpGet]
        [ResponseType(typeof(List<questionModel>))]
        public IHttpActionResult questions(int limit, int offset, string filter)
        {

            try
            {

                //get the question list 
                List<questionModel> list = db.tbl_question.Select(m => new questionModel
                {
                    ID = m.ID,
                    question = m.question,
                    image_url = m.image_url,
                    thumb_url = m.thumb_url,
                    published_at = m.published_at
                }).ToList();


                //filter like requested
                list = list.Skip(offset).Take(limit).ToList();

                //get all the answers/choices
                var choiceslist = db.rel_question_choices.ToList();


                //for all the questions filtered, inserts its answers according to the model structure
                foreach (questionModel question in list)
                {
                    question.Choices = new List<choices>();


                    foreach (rel_question_choices choices in choiceslist)
                    {
                        if (choices.questionID == question.ID)
                        {
                            question.Choices.Add(new choices { choice = choices.tbl_choices.choice, votes = choices.votes });
                        }
                    }
                }

                //filter 
                if (filter != null)
                {
                    list = list.Where(m => m.question.ToLower().Contains(filter.ToLower()) || m.Choices.Any(c => c.choice.ToLower().Contains(filter.ToLower()))).ToList();
                }

                return Ok(list);
            }
            catch (Exception e)
            {
                return InternalServerError(new Exception(e.Message));
            }

        }


    }
}
