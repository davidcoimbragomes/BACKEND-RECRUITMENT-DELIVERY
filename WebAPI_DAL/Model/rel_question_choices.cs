//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebAPI_DAL.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class rel_question_choices
    {
        public int questionID { get; set; }
        public int choiceID { get; set; }
        public int votes { get; set; }
    
        public virtual tbl_choices tbl_choices { get; set; }
        public virtual tbl_question tbl_question { get; set; }
    }
}
