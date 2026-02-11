using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task_Management_Website
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            string display = "";
            




            if (Session["userEmail"] != null)
            {
                sidebar.Visible = true;
                navigation.Visible = true;
                usernEmail.InnerHtml = Session["userEmail"].ToString();

                if (Session["isAssigner"].ToString() == "a") //admin
                {

                    //LinkSideBarCreateTask.Visible = true;
                    //LinkSideBarTask.Visible = true;
                    //LinkSideBarNotification.Visible = true;
                    //LinkSideBarLogIncident.Visible = true;
                    //LinkSideBarLoggedInsident.Visible = true;
                    //LinkSideBarProgress.Visible = true;
                    //LinkSideBarTaskReports.Visible = true;
                    linkSidebarEmployees.Visible = true;
                    LinkSideBarSettings.Visible = true;
                    LinkSideBarLogout.Visible = true;
                    LinkSideBarTeamManagemnt.Visible = true;


                    display = "";
                    display += "<a href='AHome.aspx' class='simple-text logo-normal'>";
                    display += "<img src='assets/images/w-squared-logo.png' style='width:55px'/>";
                    display += "White Walkers";
                    display += "</a>";
                    display += "";

                    LinkLogo.InnerHtml = display;


                }else if (Session["isAssigner"].ToString() == "y") //assigner
                {
                    LinkSideBarCreateTask.Visible = true;
                    LinkSideBarTask.Visible = true;
                    //LinkSideBarNotification.Visible = true;
                    LinkSideBarLogIncident.Visible = true;
                    LinkSideBarLoggedInsident.Visible = true;
                    //LinkSideBarProgress.Visible = true;
                    //LinkSideBarTaskReports.Visible = true;
                    //LinkSideBarSettings.Visible = true;
                    LinkSideBarLogout.Visible = true;

                    display = "";
                    display += "<a href='AHome.aspx' class='simple-text logo-normal'>";
                    display += "<img src='assets/images/w-squared-logo.png' style='width:55px'/>";
                    display += "White Walkers";
                    display += "</a>";
                    display += "";

                    LinkLogo.InnerHtml = display;


                }
                else                                      //not assigner
                {
                    LinkSideBarTask.Visible = true;
                    LinkSideBarNotification.Visible = true;
                    LinkSideBarLogIncident.Visible = true;
                    //LinkSideBarProgress.Visible = true;
                    //LinkSideBarSettings.Visible = true;
                    LinkSideBarLogout.Visible = true;

                    display = "";
                    display += "<a href='EHome.aspx' class='simple-text logo-normal'>";
                    display += "<img src='assets/images/w-squared-logo.png' style='width:55px'/>";
                    display += "White Walkers";
                    display += "</a>";
                    display += "";

                    LinkLogo.InnerHtml = display;


                }



            }


        }

        
    }
}