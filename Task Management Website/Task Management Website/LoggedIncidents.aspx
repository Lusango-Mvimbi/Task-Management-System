<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoggedIncidents.aspx.cs" Inherits="Task_Management_Website.LoggedIncidents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row">
        <div class="col-md-12">
            <div class="tabe">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="">
                                <tr>
                                <th>#</th>
                                <th>Incident Type</th>
                                <th>Creater</th>
                                <th>Descrption</th>
                                <th>Date Created </th>
                                <th>Status</th>
                                </tr>
                            </thead>
                            <tbody id="listOfIncidents">
                                
                                
                               
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            </div>

        </div>
     <script type="text/javascript">
         $(document).ready(function () {


             if (localStorage.getItem('userisAssing') == 'n') {
                getIncidentData();

             } else {
                 
                 getIncidentDataForAssigner()
             }

                




         });




    </script>






    <script>
        function getIncidentData() {

            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllLogs",
                dataType: 'json',
                success: function (data) {
                   
                    var display = "";
                    var count = 1;

                    $('#listOfIncidents').empty();
                    
                    $.each(data, function (index, val) {

                        var ID = val.ID;
                        var Date_Created = val.Date_Created;
                        var IncidentCreater = "" + val.Username;
                        var Status = val.Status;
                        var Description = val.Description;
                        var Title = val.Title;

                        if (IncidentCreater.trim() == localStorage.getItem('userEmail')) {

                            display += '<tr>';
                            display += '<td>' + count + '</td>';
                            display += '<td>' + Title + '</td>';
                            display += '<td>' + IncidentCreater + '</td>';
                            display += '<td>' + Description + '/td>';
                            display += '<td>' + Date_Created + '</td>';

                            if (Status == 'waitingForRespond') {
                                display += '<td>Pending Response</td>';

                            } else {
                                display += '<td>' + Status + '</td>';
                            }

                            display += '</tr>';



                            count++;
                        }



                    });


                    $('#listOfIncidents').append(display);
                }

            });

        }
    </script>

    <script>
        function getIncidentDataForAssigner() {

            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllLogs",
                dataType: 'json',
                success: function (data) {

                    var display = "";
                    var count = 1;

                    $('#listOfIncidents').empty();

                    $.each(data, function (index, val) {

                        var ID = val.ID;
                        var Date_Created = val.Date_Created;
                        var IncidentCreater = "" + val.Username;
                        var Status = val.Status;
                        var Description = val.Description;
                        var Title = val.Title;

                        
                        

                        display += '<tr>';
                        display += '<td>' + count + '</td>';
                        display += '<td><a href=logDetail.aspx?ID=' + ID + '>' + Title + '</a></td>';
                        display += '<td>' + IncidentCreater + '</td>';
                        display += '<td>' + Description + '/td>';
                        display += '<td>' + Date_Created + '</td>';

                        if (Status == 'waitingForRespond') {
                            display += '<td>Pending Response</td>';
                            
                        } else {
                            display += '<td>' + Status + '</td>';
                        }

                        display += '</tr>';



                        count++;


                    });

                    $('#listOfIncidents').append(display);

                }

            });

        }
    </script>
</asp:Content>
