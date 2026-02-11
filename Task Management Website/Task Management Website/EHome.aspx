<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EHome.aspx.cs" Inherits="Task_Management_Website.EHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
                
                <div class="col-lg-6 col-md-6" id="ticketNotificationPanel" runat="server">
                <div class='panel panel-evalute'>
            <div class='panel-heading'>
            <div class='row'>
            <div class='col-sm-6'>
            <div style='font-weight:bold'>Notification Panel</div>
            <br />
            <div>Software related tasks: <span id="numberSoftware" style='font-size:14px'>--</span></div>
            <div>Network related tasks: <span id="numberNetwork" style='font-size:14px'>--</span></div>
            <div>Hardware related tasks: <span id="numberHardware" style='font-size:14px'>--</span></div>
            
            </div>
            <div class='col-sm-6 text-right'>
            <div class='huge' id="numberTotTaskOpen">--</div>
            <div class='panel-title'>Total opened tasks</div>
            </div>
            </div>
            </div>
            

            </div>
                   

                </div>
<div class="col-lg-6 col-md-6" id="recentNotificationUpdates" runat="server">
    <div class=''>
                <h4 class='border-bottom border-gray pb-2 mb-0' style="text-transform:none">Most Recent Incident Update</h4>
                <div class='media text-muted pt-3'>
                 
                <img src='assets/images/Assigner.png' class='mr-2 rounded'/>
                <p class='media-body pb-3 mb-0 small lh-125 border-bottom border-gray'>
                <strong class='d-block text-gray-dark'>Type: <span id="incidentTitle">Incident Title </span> Status:  <span id="incidentStatus">(Status)</span></strong>
                <span id="incidentDescription">Incident Description </span>
                </p>
                </div>
                <small class='d-block text-right mt-3'>
                <a href="LoggedIncidents.aspx" >All logged Incidents</a>
                </small>
                </div>
    

    </div>
            </div>
    <hr/>

    <div class="row">
        <div class="col-md-4">
            <div class="main-card mb-3 card text-white bg-info">
                <div class="card-body">
                    <h4 class="card-title text-center ">Tasks Newly Assigned To Me</h4>
                </div>
            </div>
            <!-------Start here--->
            <div class="accordion" id="AssignedTickets">
            </div>



        </div>
        <div class="col-md-4">
            <div class="main-card mb-3 card text-white bg-success">
                <div class="card-body">
                    <h5 class="card-title text-center ">Active Tasks</h5>
                </div>
            </div>
            <div class="accordion" id="ActiveTickets">
            </div>


        </div>
        <div class="col-md-4">
            <div class="main-card mb-3 card text-white bg-danger">
                <div class="card-body">
                    <h5 class="card-title text-center ">Sent For Review</h5>
                </div>
            </div>
            <div class="accordion" id="sentForReviewTickets">
            </div>



        </div>
    </div>









    <script type="text/javascript">
        $(document).ready(function () {

            getTaskData();
            getIncidentData();





        });




    </script>

    <script>
        function acceptTicket(num) {

            var ticket = { Title: "" };


            ID = -1;
            Title = "";
            Priority_level = "";
            Category = "";
            Description = "";
            Created_By = "";
            Assigned_To = "";
            Assigned_By = "";
            Status = "active";
            Viewed = "";
            Date_Created = "";
            Date_Deadline = "";
            Date_Completed = "";


            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetTicket/" + num,
                dataType: 'json',
                success: function (data) {
                    ID = data.ID;
                    Title = data.Title;
                    Priority_level = data.Priority_level;
                    Category = data.Category;
                    Description = data.Description;
                    Created_By = data.Created_By;
                    Assigned_To = data.Assigned_To;
                    Assigned_By = data.Assigned_By;
                    Status = data.Status;
                    Viewed = data.Veiwed;
                    Date_Created = data.Date_Created;
                    Date_Deadline = data.Date_Deadline;
                    Date_Completed = data.Date_Completed;

                    

                    localStorage.setItem('ticketID', ID)
                    localStorage.setItem('ticketTitle', Title)
                    localStorage.setItem('ticketPriority', Priority_level)
                    localStorage.setItem('ticketCategory', Category)
                    localStorage.setItem('ticketDescription', Description)
                    localStorage.setItem('ticketCreated_By', Created_By)
                    localStorage.setItem('ticketAssigned_To', Assigned_To)
                    localStorage.setItem('ticketAssigned_By', Assigned_By)
                    localStorage.setItem('ticketStatus', 'active')
                    localStorage.setItem('ticketViewd', 'y')
                    localStorage.setItem('ticketDate_Created', Created_By)
                    localStorage.setItem('ticketDate_Deadline', Date_Deadline)
                    localStorage.setItem('ticketDate_Completed', Date_Completed)
                    localStorage.setItem('ticketCreated_By', Date_Created)

                    

                },

            });


            updateTicket();

        }

    </script>

    <script>
        function submitTicket(num) {

            var ticket = { Title: "" };


            ID = -1;
            Title = "";
            Priority_level = "";
            Category = "";
            Description = "";
            Created_By = "";
            Assigned_To = "";
            Assigned_By = "";
            Status = "active";
            Viewed = "";
            Date_Created = "";
            Date_Deadline = "";
            Date_Completed = "";


            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetTicket/" + num,
                dataType: 'json',
                success: function (data) {
                    ID = data.ID;
                    Title = data.Title;
                    Priority_level = data.Priority_level;
                    Category = data.Category;
                    Description = data.Description;
                    Created_By = data.Created_By;
                    Assigned_To = data.Assigned_To;
                    Assigned_By = data.Assigned_By;
                    Status = data.Status;
                    Viewed = data.Veiwed;
                    Date_Created = data.Date_Created;
                    Date_Deadline = data.Date_Deadline;
                    Date_Completed = data.Date_Completed;

                    var d = new Date()
                    var currentTime = d.getDate() + "/" + d.getMonth() + "/" + d.getFullYear();

                    localStorage.setItem('ticketID', ID)
                    localStorage.setItem('ticketTitle', Title)
                    localStorage.setItem('ticketPriority', Priority_level)
                    localStorage.setItem('ticketCategory', Category)
                    localStorage.setItem('ticketDescription', Description)
                    localStorage.setItem('ticketCreated_By', Created_By)
                    localStorage.setItem('ticketAssigned_To', Assigned_To)
                    localStorage.setItem('ticketAssigned_By', Assigned_By)
                    localStorage.setItem('ticketStatus', 'underEvalution')
                    localStorage.setItem('ticketViewd', Viewed)
                    localStorage.setItem('ticketDate_Created', Created_By)
                    localStorage.setItem('ticketDate_Deadline', Date_Deadline)
                    localStorage.setItem('ticketDate_Completed', currentTime)
                    localStorage.setItem('ticketCreated_By', Date_Created)



                },

            });


            updateTicket();

        }

    </script>


    <script type="text/javascript">
        function updateTicket() {
           
            $.ajax({

                type: 'POST',
                url: 'http://localhost:53129/api/Ticket/' + localStorage.getItem('ticketID') +
                    '?Title=' + localStorage.getItem('ticketTitle') +
                    '&Priority=' +
                    localStorage.getItem('ticketPriority') +
                    '&Category=' +
                    localStorage.getItem('ticketCategory') +
                    '&Created_By=' +
                    localStorage.getItem('ticketCreated_By') +
                    '&Assigned_To=' +
                    localStorage.getItem('ticketAssigned_To') +
                    '&Assigned_By=' +
                    localStorage.getItem('ticketAssigned_By') +
                    '&Date_Deadline='
                    + localStorage.getItem('ticketDate_Deadline') +
                    '&Description=' +
                    localStorage.getItem('ticketDescription') +
                    '&Status=' +
                    localStorage.getItem('ticketStatus') +
                    '&Viewed=' +
                    localStorage.getItem('ticketViewd') +
                    '&Date_completed=' +
                    localStorage.getItem('ticketDate_Completed') +
                    '&Date_Created=' +
                    localStorage.getItem('ticketCreated_By'),

                data: { string: "Task" },
                success: function (data) {

                    
                    getTaskData();
                },
                error: function (error) {
                    
                }




            });
        }
</script>

    <script type="text/javascript">
        function extension(num) {

            var ticket = { Title: "" };


            ID = -1;
            Title = "";
            Priority_level = "";
            Category = "";
            Description = "";
            Created_By = "";
            Assigned_To = "";
            Assigned_By = "";
            Status = "active";
            Viewed = "";
            Date_Created = "";
            Date_Deadline = "";
            Date_Completed = "";


            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetTicket/" + num,
                dataType: 'json',
                success: function (data) {
                    ID = data.ID;
                    Title = data.Title;
                    Priority_level = data.Priority_level;
                    Category = data.Category;
                    Description = data.Description;
                    Created_By = data.Created_By;
                    Assigned_To = data.Assigned_To;
                    Assigned_By = data.Assigned_By;
                    Status = data.Status;
                    Viewed = data.Veiwed;
                    Date_Created = data.Date_Created;
                    Date_Deadline = data.Date_Deadline;
                    Date_Completed = data.Date_Completed;



                    localStorage.setItem('ticketID', ID)
                    localStorage.setItem('ticketTitle', Title)
                    localStorage.setItem('ticketPriority', Priority_level)
                    localStorage.setItem('ticketCategory', Category)
                    localStorage.setItem('ticketDescription', Description)
                    localStorage.setItem('ticketCreated_By', Created_By)
                    localStorage.setItem('ticketAssigned_To', Assigned_To)
                    localStorage.setItem('ticketAssigned_By', Assigned_By)
                    localStorage.setItem('ticketStatus', Status)
                    localStorage.setItem('ticketViewd', Viewed)
                    localStorage.setItem('ticketDate_Created', Created_By)
                    localStorage.setItem('ticketDate_Deadline', Date_Deadline)
                    localStorage.setItem('ticketDate_Completed', Date_Completed)
                    localStorage.setItem('ticketCreated_By', Date_Created)



                },

            });

            window.location.href = "Extension.aspx";
            
        }
</script>





    <script>
        function getTaskData() {

            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllTickets",
                dataType: 'json',
                success: function (data) {

                    var countSoftware = 0;
                    var countNetwork = 0;
                    var countHardware = 0;
                    var countTotTaskOpen = 0;

                    $('#numberSoftware').empty();
                    $('#numberNetwork').empty();
                    $('#numberHardware').empty();
                    $('#numberTotTaskOpen').empty();




                    $('#AssignedTickets').empty();
                    $('#ActiveTickets').empty();
                    $('#sentForReviewTickets').empty();

                    displayAssigned = "";
                    displayActive = "";
                    displaySentReview = "";


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

                        var Stringassigned = "" + Assigned_To;
                        var Deadline = "" + Date_Deadline;
                        var Deadline = "" + Date_Completed;


                        if (Stringassigned.includes(localStorage.getItem('userEmail'))) {


                            

                            if (Status === 'open') {

                                if (Category == 'Software') { countSoftware++; }
                                if (Category == 'Hardware') { countHardware++; }
                                if (Category == 'Network') { countNetwork++; }
                                countTotTaskOpen++;



                                displayAssigned += "<div class='mb-3 text-white bg-info' style='padding: 10px'>";
                                displayAssigned += "<div id='heading" + ID + "'>";
                                displayAssigned += "<h4 style='margin-top: 0; font-weight: bold;'>";
                                displayAssigned += "<a href='#' data-toggle='collapse' data-target='#collapse" + ID + "' aria-expanded='true' aria-controls='collapse" + ID + "' style='color: white'> " + Title + " </a>";
                                displayAssigned += "</h4>";
                                displayAssigned += "<p>Priority: " + Priority_level + " Deadline: " + Deadline.split('T')[0] + " " + Deadline.split('T')[1] + "</p>";
                                displayAssigned += "</div>";
                                displayAssigned += "";
                                displayAssigned += "<div id='collapse" + ID + "' class='collapse' aria-labelledby='heading" + ID + "' data-parent='#accordionAssign' style='background-color: white; padding: 10px'>";
                                displayAssigned += "<div style='color: black'>";
                                displayAssigned += "<strong>Assigned by: </strong>" + Assigned_By + "<br/>";
                                displayAssigned += "<strong>Priority: </strong>" + Priority_level + "<br/>";
                                displayAssigned += "<strong>Category: </strong>" + Category + "<br/>";
                                displayAssigned += "<strong>Deadline: </strong>" + Deadline.split('T')[0] + " " + Deadline.split('T')[1] + "<br/>";
                                displayAssigned += "<strong>Description: </strong>" + Description + "<hr/>";
                                displayAssigned += "<button type='button' onclick='acceptTicket(" + ID + ")' class='btn btn-info btn-block' >Accept</button>"
                                displayAssigned += "<button type='button' onclick='extension(" + ID + ")' class='btn btn-danger btn-block' >Pause Request/Extension</button>"
                                displayAssigned += "</div>";
                                displayAssigned += "</div>";
                                displayAssigned += "</div>";
                                displayAssigned += "";
                            }

                            if (Status === 'active') {
                                displayActive += "<div class='mb-3 text-white bg-success' style='padding: 10px'>";
                                displayActive += "<div id='heading" + ID + "'>";
                                displayActive += "<h4 style='margin-top: 0; font-weight: bold;'>";
                                displayActive += "<a href='#' data-toggle='collapse' data-target='#collapse" + ID + "' aria-expanded='true' aria-controls='collapse" + ID + "' style='color: white'> " + Title + " </a>";
                                displayActive += "</h4>";
                                displayActive += "<p>Priority: " + Priority_level + " Deadline: " + Deadline.split('T')[0] + " " + Deadline.split('T')[1] + "</p>";
                                displayActive += "</div>";
                                displayActive += "";
                                displayActive += "<div id='collapse" + ID + "' class='collapse' aria-labelledby='heading" + ID + "' data-parent='#accordionAssign' style='background-color: white; padding: 10px'>";
                                displayActive += "<div style='color: black'>";
                                displayActive += "<strong>Assigned by: </strong>" + Assigned_By + "<br/>";
                                displayActive += "<strong>Priority: </strong>" + Priority_level + "<br/>";
                                displayActive += "<strong>Category: </strong>" + Category + "<br/>";
                                displayActive += "<strong>Deadline: </strong>" + Deadline.split('T')[0] + " " + Deadline.split('T')[1] + "<br/>";
                                displayActive += "<strong>Description: </strong>" + Description + "<hr/>";
                                displayActive += "<button type='button' onclick='submitTicket(" + ID + ")' class='btn btn-info btn-block' >Send For Review</button>"
                                displayActive += "</div>";
                                displayActive += "</div>";
                                displayActive += "</div>";
                                displayActive += "";


                            }

                            if (Status === 'underEvalution') {
                                displaySentReview += "<div class='mb-3 text-white bg-danger' style='padding: 10px'>";
                                displaySentReview += "<div id='heading" + ID + "'>";
                                displaySentReview += "<h4 style='margin-top: 0; font-weight: bold;'>";
                                displaySentReview += "<a href='#' data-toggle='collapse' data-target='#collapse" + ID + "' aria-expanded='true' aria-controls='collapse" + ID + "' style='color: white'> " + Title + " </a>";
                                displaySentReview += "</h4>";
                                displaySentReview += "<p>Date Completed: " + Deadline.split('T')[0] + " " + Deadline.split('T')[1] + "</p>";
                                displaySentReview += "</div>";
                                displaySentReview += "";
                                displaySentReview += "<div id='collapse" + ID + "' class='collapse' aria-labelledby='heading" + ID + "' data-parent='#accordionAssign' style='background-color: white; padding: 10px'>";
                                displaySentReview += "<div style='color: black'>";
                                displaySentReview += "<strong>Assigned by: </strong>" + Assigned_By + "<br/>";
                                displaySentReview += "<strong>Priority: </strong>" + Priority_level + "<br/>";
                                displaySentReview += "<strong>Category: </strong>" + Category + "<br/>";
                                displaySentReview += "<strong>Deadline: </strong>" + Deadline.split('T')[0] + " " + Deadline.split('T')[1] + "<br/>";
                                displaySentReview += "<strong>Description: </strong>" + Description + "<hr/>";
                                displaySentReview += "<strong>Status: </strong>Under Evaluation<hr/>";
                               
                                displaySentReview += "</div>";
                                displaySentReview += "</div>";
                                displaySentReview += "</div>";
                                displaySentReview += "";


                            }



                        }



                    });
                    $('#numberSoftware').append(countSoftware);
                    $('#numberNetwork').append(countNetwork);
                    $('#numberHardware').append(countHardware);
                    $('#numberTotTaskOpen').append(countTotTaskOpen);

                    $('#AssignedTickets').append(displayAssigned);
                    $('#ActiveTickets').append(displayActive);
                    $('#sentForReviewTickets').append(displaySentReview);


                }

            });





        }
</script>



    <script>
        function getIncidentData() {

            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllLogs",
                dataType: 'json',
                success: function (data) {
                    var displayMostRecentTitle = "";
                    var displayMostRecentStatus = "";
                    var displayMostRecentDescription = "";

                    
                    
                    

                    $('#incidentTitle').empty();
                    $('#incidentStatus').empty();
                    $('#incidentDescription').empty();


                    $.each(data, function (index, val) {
                        
                        var Date_Created = val.Date_Created;
                        var IncidentCreater = "" + val.Username;
                        var Status = val.Status;
                        var Description = val.Description;
                        var Title = val.Title;



                        if (IncidentCreater.includes(localStorage.getItem('userEmail'))) {

                            displayMostRecentTitle = Title;
                            if (Status == 'waitingForRespond') {
                                displayMostRecentStatus = "Pending Response";
                            } else {
                                displayMostRecentStatus = Status;
                            }


                            displayMostRecentDescription = Description;


                        }



                    });


                    $('#incidentTitle').append(displayMostRecentTitle);
                    $('#incidentStatus').append(displayMostRecentStatus);
                    $('#incidentDescription').append(displayMostRecentDescription);
                }

            });

        }
</script>



</asp:Content>
