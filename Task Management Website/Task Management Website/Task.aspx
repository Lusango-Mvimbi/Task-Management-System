<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="Task_Management_Website.Task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
    <h1 class="navbar-brand">Tasks</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div id="alertSuccess" class="alert alert-success" role="alert" hidden></div>
            <br />
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title">Active Tasks</h4>
                </div>

                <div class="table" style="width: 100%; padding: 10px" id="activeTable">
                </div>

            </div>
        </div>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-info">
                    <h4 class="card-title">Task Waiting Evalution</h4>
                </div>

                <div class="table" style="width: 100%; padding: 10px" id="underEvalutionTable">
                    
                </div>

            </div>
        </div>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-danger">
                    <h4 class="card-title">Tasks Overdue</h4>
                </div>

                <div class="table" style="width: 100%; padding: 10px" id="overdueTable">
                   
                </div>

            </div>
        </div>




    </div>

    <script type="text/javascript">
        $(document).ready(function () {


            var tableActuve = $('#activeTable');
            var tableUnderEvalution = $('#underEvalutionTable');
            var tableOverdue = $('#overdueTable');
            displayDetails = "";
            displayActive = "";
            displayUnderEvalution = "";
            displayOverdue = "";

           

            if (localStorage.getItem('TaskDeleted') == 'Task successfully deleted.') {
                $('#alertSuccess').empty();
                $('#alertSuccess').append('Task successfully deleted.');
                document.getElementById('alertSuccess').removeAttribute('hidden');
                localStorage.removeItem('TaskDeleted');
            }



            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllTickets",
                dataType: 'json',
                success: function (data) {
                    tableActuve.empty();
                    tableUnderEvalution.empty();
                    tableOverdue.empty();


                    displayActive = '<table style="width: 100%;">' +
                        '<thead>' +
                        '<tr>' +
                        '<th>#</th>' +
                        '<th>Title</th>' +
                        '<th>Assigned By</th>' +
                        '<th>Assigned To</th>' +
                        '<th>Priority</th>' +
                        '<th>Status</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>';
                    displayUnderEvalution = '<table style="width: 100%;">' +
                        '<thead>' +
                        '<tr>' +
                        '<th>#</th>' +
                        '<th>Title</th>' +
                        '<th>Assigned By</th>' +
                        '<th>Assigned To</th>' +
                        '<th>Priority</th>' +
                        '<th>Status</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>';
                    displayOverdue = '<table style="width: 100%;">' +
                        '<thead>' +
                        '<tr>' +
                        '<th>#</th>' +
                        '<th>Title</th>' +
                        '<th>Assigned By</th>' +
                        '<th>Assigned To</th>' +
                        '<th>Priority</th>' +
                        '<th>Status</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>';



                    /*tableActuve.append(
                        '<table style="width: 100%;">' +
                        '<thead>' +
                        '<tr>' +
                        '<th>#</th>' +
                        '<th>Title</th>' +
                        '<th>Assigned By</th>' +
                        '<th>Assigned To</th>' +
                        '<th>Priority</th>' +
                        '<th>Status</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>'
                    )*/

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




                        if (Status === 'active') {
                            displayActive += '<tr>' +
                                '<th scope="row">' + count + '</th>' +
                                '<td><a href=TicketDetails.aspx?ID=' + ID + '>' + Title + '</a></td>' +
                                '<td> ' + Assigned_By + ' </td>' +
                                '<td> ' + Assigned_To + ' </td>' +

                                '<td>' + Priority_level + '</td>' +
                                '<td> ' + Status + '</td>' +
                                '</tr>';

                        }
                        if (Status === 'underEvalution') {
                            displayUnderEvalution += '<tr>' +
                                '<th scope="row">' + count + '</th>' +
                                '<td><a href=TicketDetails.aspx?ID=' + ID + '>' + Title + '</a></td>' +
                                '<td> ' + Assigned_By + ' </td>' +
                                '<td> ' + Assigned_To + ' </td>' +

                                '<td>' + Priority_level + '</td>' +
                                '<td> ' + Status + '</td>' +
                                '</tr>';

                        }
                        if (Status === 'overdue') {
                            displayOverdue += '<tr>' +
                                '<th scope="row">' + count + '</th>' +
                                '<td><a href=TicketDetails.aspx?ID=' + ID + '>' + Title + '</a></td>' +
                                '<td> ' + Assigned_By + ' </td>' +
                                '<td> ' + Assigned_To + ' </td>' +

                                '<td>' + Priority_level + '</td>' +
                                '<td> ' + Status + '</td>' +
                                '</tr>';

                        }





                        /*tableActuve.append(
                            '<tr>' +
                            '<th scope="row">' + count + '</th>' +
                            '<td><a href="#">' + Title + '</a></td>' +
                            '<td> ' + Assigned_By + ' </td>' +
                            '<td> ' + Assigned_To + ' </td>' +

                            '<td>' + Priority_level + '</td>' +
                            '<td> ' + Status + '</td>' +
                            '</tr>'
                        )*/

                        count++;


                    });




                    displayActive += '</tbody></table>';
                    displayUnderEvalution += '</tbody></table>';
                    displayOverdue += '</tbody></table>';

                    tableActuve.append(displayActive)
                    tableUnderEvalution.append(displayUnderEvalution)
                    tableOverdue.append(displayOverdue)
                    /*tableActuve.append(               
                        '</tbody>' +
                        '</table>'
                    )*/

                }

            });






        });




    </script>

</asp:Content>
