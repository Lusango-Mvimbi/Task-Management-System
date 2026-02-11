<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AHome.aspx.cs" Inherits="Task_Management_Website.AHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/main.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card bg-primary">
                        <div class="widget-content">
                            <div class="widget-content-outer">
                                <div class="widget-content-wrapper">
                                     
                                    <div class="widget-content-left fsize-1">
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-numbers text-white"><span id="numberTasksAwaitingEvaluation">--</span></div>
                                    </div>
                                </div>
                            <a href="TaskAwaitingEvaluation.aspx">             
                                <div class="widget-content-left fsize-1">
                                    <div class="text-white">Tasks Awaiting Evaluation</div>
                                </div>
                               </a>
                            </div>
                        </div>
                    </div>                
                </div>
                 <div class="col-md-6 col-lg-3">
                    <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card bg-success">
                        <div class="widget-content">
                            <div class="widget-content-outer">
                                <div class="widget-content-wrapper">                                    
                                    <div class="widget-content-left fsize-1">
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-numbers text-white"><span id="numberActiveTask">--</span></div>
                                    </div>
                                </div>
                                <a href="ActiveTasks.aspx">
                                <div class="widget-content-left fsize-1">
                                    <div class="text-white">Active Tasks</div>
                                </div>
                                </a> 
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-md-6 col-lg-3">
                    <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card bg-focus">
                        <div class="widget-content">
                            <div class="widget-content-outer">
                                <div class="widget-content-wrapper">                                    
                                    <div class="widget-content-left fsize-1">
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-numbers text-white"><span id="numberLoogedIncident">--</span></div>
                                    </div>
                                </div>
                                <a href="LoggedIncidents.aspx">
                                <div class="widget-content-left fsize-1">
                                    <div class="text-white">Logged Incidents</div>
                                </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-md-6 col-lg-3">
                   <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card bg-info">
                        <div class="widget-content">
                            <div class="widget-content-outer">
                                <div class="widget-content-wrapper">                                   
                                    <div class="widget-content-left fsize-1">
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-numbers text-white"><span id="numberPausedTask">--</span></div>
                                    </div>
                                </div>
                                <a href="TaskExtensionRequest.aspx">
                                <div class="widget-content-left fsize-1">
                                    <div class="text-white">Extensio/Pause Requested Tasks</div>
                                </div>
                               </a> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <div class="divider mt-0" style="margin-bottom:30px;"></div>
    <div style="background-color:#fff;padding:10px">
                   <h3>Tasks and Logs overview Information</h3>
        <div class="row">
                <div class="col-md-7">
                 <canvas id="Incidents"></canvas>
                    <canvas id="SubmittedAndSolved"></canvas>

                </div>
                <div class="col-md-5" style="padding:10px">
                    
                <canvas id="doughnutChart"></canvas>
                    
                </div>
            </div>
        <br />
                <h3>Incidents Information</h3>
    <div class="row">
            <div class="col-md-9">
            </div>
            <div class="col-md-4">
                   
                    
            </div>
        </div>
    </div>



    



    <script type="text/javascript">
        $(document).ready(function () {

            notificationPanal()
            //SubmittedAndSolved();
            Incidents();



            //doughnut
            var ctxD = document.getElementById("doughnutChart").getContext('2d');
            var myLineChart = new Chart(ctxD, {
                type: 'doughnut',
                data: {
                    labels: ["Tasks", "Sent For Review", "Incidents", "Pause/Extension Request"],
                    datasets: [{
                        data: [parseInt(localStorage.getItem('numTickets')),
                        parseInt(localStorage.getItem('numSent')),
                        parseInt(localStorage.getItem('numIncident')),
                        parseInt(localStorage.getItem('numPause'))
                        ],
                        backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
                        hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
                    }]
                },
                options: {
                    responsive: true
                }
            });



        });

        </script>

    



    <script>
        function SubmittedAndSolved() {
            //line
            var ctxL = document.getElementById("SubmittedAndSolved").getContext('2d');
            var myLineChart = new Chart(ctxL, {
                type: 'line',
                data: {
                    labels: ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"],
                    datasets: [{
                        label: "Submitted for evaluation",
                        data: [65, 59, 80, 81, 56, 55, 40],
                        backgroundColor: [
                            'rgba(105, 0, 132, .2)',
                        ],
                        borderColor: [
                            'rgba(200, 99, 132, .7)',
                        ],
                        borderWidth: 2
                    },
                    {
                        label: "Task Solved",
                        data: [28, 48, 40, 19, 86, 27, 90],
                        backgroundColor: [
                            'rgba(0, 137, 132, .2)',
                        ],
                        borderColor: [
                            'rgba(0, 10, 130, .7)',
                        ],
                        borderWidth: 2
                    }

                    ]
                },
                options: {
                    responsive: true
                }
            });
        }
    </script>

   


    <script>
        function Incidents() {
            //bar
            var ctxB = document.getElementById("Incidents").getContext('2d');
            var myBarChart = new Chart(ctxB, {
                type: 'bar',
                data: {
                    labels: ["Tasks", "Sent For Review", "Incidents", "Pause/Extension Request"],
                    datasets: [{
                        label: 'Overview',
                        data: [parseInt(localStorage.getItem('numTickets')),
                            parseInt(localStorage.getItem('numSent')),
                            parseInt(localStorage.getItem('numIncident')),
                            parseInt(localStorage.getItem('numPause'))
                            ],
                        backgroundColor: [
                            '#4D5360',
                            '#4D5360',
                            '#4D5360',
                            '#4D5360',
                        
                            
                        ],
                        
                       
                    },

                    ]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        }

    </script>



    <script>
        function notificationPanal() {
           
            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllTickets",
                dataType: 'json',
                success: function (data) {

                    $('#numberActiveTask').empty();
                    $('#numberTasksAwaitingEvaluation').empty();
                    $('#numberLoogedIncidents').empty();
                    $('#numberPausedTask').empty();

                    var countActive = 0;
                    var countPaused = 0;
                    var countLoggedIncident = 0;
                    var countAwaitingEvalution = 0;
                    var countTickets = 0;
                    var countTotReview = 0;



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

                            countActive++;

                        }
                        if (Status === 'underEvalution') {

                            countAwaitingEvalution++;
                            countTotReview++;
                        }
                        if (Status === 'extensionRequested') {
                            
                            countPaused++;
                        }

                        

                       
                        //new Date(year, month, day, hours, minutes, seconds, milliseconds)

                        //if () {
                            
                        //    countPaused++;
                        //}



                        countTickets++;

                    });


                    localStorage.setItem('numTickets', countTickets)
                    localStorage.setItem('numSent', countAwaitingEvalution)
                    localStorage.setItem('numPause', countPaused)


                    $('#numberActiveTask').append(countActive);
                    $('#numberTasksAwaitingEvaluation').append(countAwaitingEvalution);
                    $('#numberLoogedIncidents').append(countLoggedIncident);
                    $('#numberPausedTask').append(countPaused);
                    $('#numberTotTicket').append(countTickets);

                }

            });

            getIncidentData();
        }

    </script>
    <script>
        function getIncidentData() {

            $('#numberLoogedIncident').empty();
            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllLogs",
                dataType: 'json',
                success: function (data) {

                    $('#weekTotLogs').empty();
                    var Date_Created;
                    var count = 0;
                    var d = new Date();
                    var dR = new Date(d.getFullYear(), d.getMonth(), d.getDate() - 8);

                    var dtCompar = new Date(Date_Created).toLocaleDateString();
                    var mon = 0;
                    var tue = 0;
                    var wed = 0;
                    var thur = 0;
                    var fri = 0;
                    var sat = 0;
                    var sun = 0;
                   
                    var countTotWeek = 0;

                    $.each(data, function (index, val) {

                        count++;

                        Date_Created = val.Date_Created;

                        


                        if (new Date(Date_Created) > dR) {
                           

                           
                            if (new Date(Date_Created).getDay() == 2) { ;}
                            //if (new Date(Date_Created).getDay() == 1) { tue++;}
                            //if (new Date(Date_Created).getDay() == 2) { wed++;}
                            //if (new Date(Date_Created).getDay() == 3) { thur++; }
                            //if (new Date(Date_Created).getDay() == 4) { fri++; }
                            //if (new Date(Date_Created).getDay() == 5) { sat++;}
                            //if (new Date(Date_Created).getDay() == 6) { sun++;}

                            displayTest = mon;


                            countTotWeek++;
                        }





                    });

                    localStorage.setItem('logMon', mon)
                    localStorage.setItem('logTue', tue)
                    localStorage.setItem('logWed', wed)
                    localStorage.setItem('logThur', thur)
                    localStorage.setItem('logFri', fri)
                    localStorage.setItem('logSat', sat)
                    localStorage.setItem('logSun', sun)
                    

                    $('#weekTotLogs').append(countTotWeek);

                    $('#numberLoogedIncident').append(count);
                    localStorage.setItem('numIncident', count)
                }

            });

        }
    </script>



</asp:Content>
