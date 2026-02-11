using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task_Management_Website
{
    public partial class logUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           Session.Timeout = 60;

           Session["isAssigner"] = Request.QueryString["Id"].ToString().Split(':')[0];
           Session["userID"] = Request.QueryString["Id"].ToString().Split(':')[1];
           Session["userEmail"] = Request.QueryString["Id"].ToString().Split(':')[2];

            if (Session["isAssigner"].ToString() == "a") //admin
            {
                Response.Redirect("Administration.aspx");
            }

            if (Session["isAssigner"].ToString() == "y") //assigner
            {
                Response.Redirect("AHome.aspx");

            } else                                      //not assigner
            {
                Response.Redirect("EHome.aspx"); 

            }








        }
    }
}