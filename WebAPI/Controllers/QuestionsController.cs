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


        [HttpGet]
        [ResponseType(typeof(questionModel))]
        public IHttpActionResult questions(int question_id)
        {
            try
            {


                //get the question
                questionModel question = db.tbl_question.Select(m => new questionModel
                {
                    ID = m.ID,
                    question = m.question,
                    image_url = m.image_url,
                    thumb_url = m.thumb_url,
                    published_at = m.published_at
                }).Where(m => m.ID == question_id).FirstOrDefault();

                //get the related choices
                var choiceslist = db.rel_question_choices.Where(m => m.questionID == question_id);

                //inserts its answers according to the model structure
                question.Choices = new List<choices>();
                foreach (rel_question_choices choices in choiceslist)
                {
                    if (choices.questionID == question.ID)
                    {
                        question.Choices.Add(new choices { choice = choices.tbl_choices.choice, votes = choices.votes });
                    }
                }

                return Ok(question);
            }
            catch (Exception e)
            {
                return InternalServerError(new Exception(e.Message));
            }
        }

        [HttpPost]
        public IHttpActionResult questions(questionModel questionParameter)
        {
            try
            {

                int ChoiceID;
                tbl_question DBquestion = new tbl_question();

                DBquestion.question = questionParameter.question;
                DBquestion.image_url = questionParameter.image_url;
                DBquestion.thumb_url = questionParameter.thumb_url;
                DBquestion.published_at = DateTime.Now;

                //The question is added to the DB
                db.tbl_question.Add(DBquestion);
                db.SaveChanges();

                //for all the answers/choices...
                foreach (choices choices in questionParameter.Choices)
                {
                    //if the choice doesn't exist on the answers table, it is added
                    if (!db.tbl_choices.Any(m => m.choice == choices.choice))
                    {
                        tbl_choices DBchoices = new tbl_choices();
                        DBchoices.choice = choices.choice;
                        db.tbl_choices.Add(DBchoices);
                        db.SaveChanges();
                        ChoiceID = DBchoices.ID;
                    }
                    //otherwise get the id 
                    else
                    {
                        ChoiceID = db.tbl_choices.Where(m => m.choice == choices.choice).Select(m => m.ID).FirstOrDefault();
                    }

                    //and the answer and its votation is added in the relational table related to the question 
                    db.rel_question_choices.Add(new rel_question_choices { questionID = DBquestion.ID, choiceID = ChoiceID, votes = choices.votes });
                    db.SaveChanges();

                }
                return Ok();
            }
            catch (Exception e)
            {
                return InternalServerError(new Exception(e.Message));
            }
        }
    }
}
