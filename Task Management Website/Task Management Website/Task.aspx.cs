using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Task_Management_Website.Processor;
using Task_Management_Website.assets.Model;
using Task_Management_Website.Repositories;

namespace Task_Management_Website
{
    public partial class Task : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string display = "";
            display = "";
            display += "<table style='width:100%;'>";
            display += "<thead>";
            display += "<tr>";
            display += "<th >#</th>";
            display += "<th>Title</th>";
            display += "<th>Assigned By</th>";
            display += "<th>Assigned To</th>";
            display += "<th>Priority</th>";
            display += "<th>Status</th>";
            display += "</tr>";
            display += "</thead>";
            display += "<tbody>";
            display += "<tr class='priority-high' >";
            display += "<th scope='row'>1</th>";
            display += "";
            display += "<td><a href='#'>Server diconnect</a></td>";
            display += "<td>Katlego Sekano</td>";
            display += "<td>Ntando Nkomo</td>";
            display += "<td>High</td>";
            display += "<td>Active</td>";
            display += "</tr>";
            display += "</tbody>";
            display += "</table>";
            display += "";

            
          





        }


        protected async System.Threading.Tasks.Task LoadAsync()
        {
            var list = await TicketProcessor.processAllTicketRetrival();

           

        }
    }
}