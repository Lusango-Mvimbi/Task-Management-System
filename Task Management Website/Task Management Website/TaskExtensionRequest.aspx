<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TaskExtensionRequest.aspx.cs" Inherits="Task_Management_Website.TaskExtensionRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title">Tasks with extension/pause request</h4>
                </div>

                <div class="table" style="width: 100%; padding: 10px" id="paseTable">
                    <table style="width: 100%;">
                        <thead>
                        <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Assigned By</th>
                        <th>Assigned To</th>
                        <th>Priority</th>
                        <th>Status</th>
                        </tr>
                        </thead>
                        <tbody id="pauseList">
                            <tr>
                                <th scope="row">' + count + '</th>
                                <td><a href="#">' + Title + '</a></td>
                                <td> ' + Assigned_By + ' </td>
                                <td> ' + Assigned_To + ' </td>
                                <td>' + Priority_level + '</td>
                                <td> ' + Status + '</td>
                                </tr>


                        </tbody>
                        </table>



                </div>

            </div>
        </div>
   </div>

    <script type="text/javascript">
        $(document).ready(function () {


            

            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllTickets",
                dataType: 'json',
                success: function (data) {

                    $('#pauseList').empty();

                    var display = "";

                    var count = 1;

                    $.each(data, function (index, val) {
                        var ID = val.ID;
                        var Title = val.Title;
                        var Priority_level = val.Priority_level;
                        var Category = val.Category;
                        var Description = val.Description;
                        var Created_By = val.Created_By;
                        var Assigned_To = val.Assigned_To;
                        var Assigned_By = val.Assigned_By;
                        var Status = val.Status;
                        var Viewed = val.Veiwed;
                        var Date_Created = val.Date_Created;
                        var Date_Deadline = val.Date_Deadline;
                        var Date_Completed = val.Date_Completed;


                        if (Status == 'extensionRequested') {
                            display += "<tr>";
                            display += "<th scope='row'>" + count + "</th>";
                            display += "<td><a href=TicketDetails.aspx?ID=" + ID + ">" + Title + "</a></td>";
                            display += "<td> " + Assigned_By + " </td>";
                            display += "<td> " + Assigned_To + " </td>";
                            display += "<td>" + Priority_level + "</td>";
                            display += "<td> " + Status + "</td>";
                            display += "</tr>";

                        }



                       
                        



                        
                        count++;


                    });

                    $('#pauseList').append(display);
                    
                    

                }

            });






        });




    </script>



</asp:Content>
