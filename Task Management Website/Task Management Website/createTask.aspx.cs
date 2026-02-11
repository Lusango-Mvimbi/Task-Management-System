using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Task_Management_Website.assets.Model;
using Task_Management_Website.Processor;

namespace Task_Management_Website
{
    public partial class createTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["success"] != null)
            //{
            //    alertSuccess.InnerHtml = Session["success"].ToString();
            //    alertSuccess.Visible = true;
            //    Session["success"] = null;
            //}
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            //var Created_By = Session["userEmail"].ToString();
            //var title = tbTitle.Value;
            //var Category = lbCategory.Value;
            //var Priority_level = lbPriority.Value;
            //var Date_Deadline = tbDeadline.Value;
            //var Date_Completed = tbDeadline.Value;
            //var Description = tbDescription.Value;
            ////var Assigned_To = lbEmployee.Value;
            //var Assigned_By = "no Assigner";
            //var Status = "undefined";
            

            //if(title == "")
            //{
            //    validateTitle.Visible = true;
            //}
            //if(Category == "")
            //{
            //    validateCategory.Visible = true;
            //}
            //if(Priority_level == "")
            //{
            //    validatePriority.Visible = true;
            //} else
            //{
            //    if(Assigned_To != "" && Date_Deadline == "")
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

            //        if (Description == ""){ Description = "No description"; }

            //        if (Assigned_To != ""){
            //            Status = "Open";
            //            Assigned_By = Created_By;
            //        }
            //        else
            //        {
            //            Assigned_To = "no Assigner";
            //        }

            //        var ticket = new TicketInfo
            //        {
            //            Title = title,
            //            Assigned_By = Assigned_By,
            //            Assigned_To = Assigned_To,
            //            Category = Category,
            //            Created_By = Created_By,
            //            Date_Created = DateTime.Now,
            //            Date_Completed = Convert.ToDateTime(Date_Completed),
            //            Date_Deadline = Convert.ToDateTime(Date_Deadline),
            //            Description = Description,
            //            Priority_level = Priority_level,
            //            Status = Status,
            //            Veiwed = "n",
            //        };



            //        var success = TicketProcessor.processTicketCreation(ticket);
            //        Session["success"] = "Ticket Successfully created.";
            //        Response.Redirect("createTask.aspx");



            //    }


            //}

            



            
        }
    }
}