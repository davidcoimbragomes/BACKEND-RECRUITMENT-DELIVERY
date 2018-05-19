using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Models
{

    public class StatusModel
    {
        public string Status { get; set; }
    }

    public class questionModel
    {
        public int ID { get; set; }

        public string question { get; set; }

        public string image_url { get; set; }

        public string thumb_url { get; set; }

        public DateTime published_at { get; set; }

        public List<choices> Choices { get; set; }
    }

    public class choices
    {
        public string choice { get; set; }

        public int votes { get; set; }
    }
}