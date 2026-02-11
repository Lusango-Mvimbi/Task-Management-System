using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task_Management_Website
{
    public partial class updateTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //var title = tbTitle.Value;
            //var Category = lbCategory.Value;
            //var Priority_level = lbPriority.Value;
            //var Date_Deadline = tbDeadline.Value;
            //var Date_Completed = tbDeadline.Value;
            //var Description = tbDescription.Value;
            //var Assigned_To = lbEmployee.Value;
            //var Status = lbStatus.Value;


            //if (title == "")
            //{
            //    validateTitle.Visible = true;
            //}
            //if (Category == "")
            //{
            //    validateCategory.Visible = true;
            //}
            //if (Priority_level == "")
            //{
            //    validatePriority.Visible = true;
            //}
            //else
            //{
            //    if (Assigned_To != "" && Date_Deadline == "")
            //    {
            //        validateDeadline.InnerHtml = "Deadline Required for assignee.";
            //        validateDeadline.Visible = true;
            //    }
            //    if (Assigned_To == "" && Date_Deadline != "")
            //    {
            //        validateEmployee.InnerHtml = "Employe Required in order to meet dealine.";
            //        validateEmployee.Visible = true;
            //    }
            //    else
            //    {


            //        if (Assigned_To != "")
            //        {
            //            Status = "Open";



            //        }





            //    }


            //}





            ////var ticket = new TicketInfo
            ////{
            ////    Title = title,
            ////    Assigned_By = "Test",
            ////    Assigned_To = Assigned_To,
            ////    Category = Category,
            ////    Created_By = Created_By,
            ////    Date_Created = DateTime.Now,
            ////    Date_Completed = Convert.ToDateTime(Date_Completed),
            ////    Date_Deadline = Convert.ToDateTime(Date_Deadline),
            ////    Description = Description,
            ////    Priority_level = Priority_level,
            ////    Status = Status,
            ////    Veiwed = "N",
            ////};




            ////var success = TicketProcessor.processTicketCreation(ticket);
        }
    }
}