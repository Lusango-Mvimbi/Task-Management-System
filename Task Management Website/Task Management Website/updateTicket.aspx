<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="updateTicket.aspx.cs" Inherits="Task_Management_Website.updateTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
    <h4 class="navbar-brand">Update Task</h4>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-8">

            <div id="alertSuccess" class="alert alert-success" role="alert" hidden></div>
            <div id="alertError" class="alert alert-danger" role="alert" hidden></div>


            <div class="card">

                <div class="card-body">

                    <div class=" form-group">
                        <label for="titleText" style="color: #993399">Ticket Title </label>
                        <br />
                        <input id="tbTitle" class="form-control">
                        <div id="validateTitle" class="validate-input" hidden>
                            Title reqiured
                        </div>


                    </div>
                    <div class=" form-group">
                        <label for="prioritySelect" style="color: #993399">Select Priority Level</label>
                        <select name="select" id="lbPriority" class="form-control">
                            <option></option>
                            <option>High</option>
                            <option>Medium</option>
                            <option>Low</option>
                        </select>
                        <div id="validatePriority" class="validate-input" hidden>
                            Priority reqiured
                        </div>
                    </div>
                    <br />
                    <div class=" form-group">
                        <label class="" style="color: #993399">Select Type/Category</label>
                        <select id="lbCategory" class="form-control">
                            <option></option>
                            <option>Software</option>
                            <option>Hardware</option>
                            <option>Network</option>
                        </select>
                        <div id="validateCategory" class="validate-input" hidden>
                            Category/Type reqiured
                        </div>
                    </div>
                    <br />
                    <div class=" form-group">
                        <label style="color: #993399">Deadline</label>
                        <br />
                        <input id="tbDeadline" class=" form-control">
                        <div id="validateDeadline" class="validate-input" hidden>
                            Deadline reqiured
                        </div>
                    </div>

                    <div class=" form-group">
                        <label for="AssigntoSelect" style="color: #993399">Assign To (Select Employee)</label>

                        <div id="listEmployees">
                        </div>

                        <div id="validateEmployee" class="validate-input" hidden>
                            Assigned to reqiured
                        </div>
                    </div>
                    <br />
                    <div class=" form-group">
                        <label for="descriptionText" style="color: #993399">Description</label>
                        <br />
                        <input id="tbDescription" placeholder="Extra information about the task" class="form-control">
                        <div id="validateDescription" class="validate-input" hidden>
                            Descriptions reqiured
                        </div>
                    </div>

                    <%--<asp:Button  Text="Create Task" OnClick="btnCreate_Click" />--%>
                    <button id="btnCreate" type="button" class="mt-1 btn btn-primary btn-block">Update Task</button>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-profile">

                <div class="card-body">
                    <h4 class="card-title">Current Task Details</h4>
                    <p>For Ticket ID: <span id="ticketID"></span></p>
                    <hr />

                    <p id="ticketInfo" style="float: left; color: grey; text-align: justify; color: #993399;">
                    </p>

                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
        $(document).ready(function () {


            displayDetails = "";
            displayActive = "";
            displayUnderEvalution = "";
            displayOverdue = "";

            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetTicket/" + document.URL.split("=")[1],
                dataType: 'json',
                success: function (data) {

                    var ID = data.ID;
                    var Title = data.Title;
                    var Priority_level = data.Priority_level;
                    var Category = data.Category;
                    var Description = data.Description;
                    var Created_By = data.Created_By;
                    var Assigned_To = data.Assigned_To;
                    var Assigned_By = data.Assigned_By;
                    var Status = data.Status;
                    var Viewed = data.Veiwed;
                    var Date_Created = data.Date_Created;
                    var Date_Deadline = data.Date_Deadline;
                    var Date_Completed = data.Date_Completed;


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

                    document.getElementById("tbTitle").value = Title;

                    var deadline = "" + Date_Deadline;

                    if (Priority_level == 'High') { document.getElementById("lbPriority").selectedIndex = "1"; }
                    if (Priority_level == 'Medium') { document.getElementById("lbPriority").selectedIndex = "2"; }
                    if (Priority_level == 'Low') { document.getElementById("lbPriority").selectedIndex = "-3"; }

                    if (Category == 'Software') { document.getElementById("lbCategory").selectedIndex = "1"; }
                    if (Category == 'Hardware') { document.getElementById("lbCategory").selectedIndex = "2"; }
                    if (Category == 'Network') { document.getElementById("lbCategory").selectedIndex = "3"; }
                    document.getElementById("tbDeadline").value = deadline.split('T')[0];
                    document.getElementById("tbDescription").value = Description;


                    $('#ticketID').empty();
                    $('#ticketInfo').empty();

                    $('#ticketID').append(ID);




                    $('#ticketInfo').append(

                        '<strong style="color:black">Title:</strong> ' + Title + '<br/><br/>' +
                        '<strong style="color:black">Priority Level:</strong>  ' + Priority_level + '<br/><br/>' +
                        '<strong style="color:black">Category:</strong>  ' + Category + '<br/><br/>' +
                        '<strong style="color:black">Assigned To:</strong>  ' + Assigned_To + '<br/><br/>' +
                        '<strong style="color:black">Deadline:</strong>  ' + deadline.split('T')[0] + '<br/><br/>' +


                        '<strong style="color:black">Status:</strong>  ' + Status + '<br/><br/>' +
                        '<strong style="color:black">Description:</strong>  ' + Description + '<br/>' +

                        '</p>'
                    )




                }

            });

            getEmployees();
        });




    </script>
    <script>
        function getEmployees() {
            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllUsers",
                dataType: 'json',
                success: function (data) {


                    var display = '<select id="lbEmployee"select class="form-control">'
                    display += '<option></option>';

                    $.each(data, function (index, val) {

                        var ID = val.ID
                        var First_Name = val.First_Name
                        var Last_Name = val.Last_Name
                        var Position = val.Position
                        var Skills = val.Skills
                        var Email = val.Email
                        var isAssigner = val.isAssigner
                        var Username = val.Username

                        display += '<option>' + First_Name + ' ' + Last_Name + ' (' + Email + ')</option>';


                    });
                    $('#listEmployees').empty();
                    $('#listEmployees').append(display + '</select>');

                }

            });




        }
    </script>
    <script>
        $('#btnCreate').on('click', function () {


            Title = $('#tbTitle').val();
            Priority_level = $('#lbPriority').val();
            Category = $('#lbCategory').val();
           
            Assigned_To = $('#lbEmployee').val();
            Assigned_By = localStorage.getItem('userEmail')
            Description = $('#tbDescription').val();
            Date_Deadline = $('#tbDeadline').val();


            if (Title == '') {

                document.getElementById('validateTitle').removeAttribute('hidden');
            }

            if (Priority_level == '') {

                document.getElementById('validatePriority').removeAttribute('hidden');
            }

            if (Category == '') {

                document.getElementById('validateCategory').removeAttribute('hidden');
            }
            else {



                if (Assigned_To != "" && Date_Deadline == "") {
                    $('#validateDeadline').empty();
                    $('#validateDeadline').append('Deadline Required for assignee.');
                    document.getElementById('validateDeadline').removeAttribute('hidden');

                } else if (Assigned_To == "" && Date_Deadline != "") {

                    $('#validateEmployee').empty();
                    $('#validateEmployee').append('Employe Required in order to meet dealine.');
                    document.getElementById('validateEmployee').removeAttribute('hidden');

                }
                else {

                   
                    localStorage.setItem('ticketTitle', Title)
                    localStorage.setItem('ticketPriority', Priority_level)
                    localStorage.setItem('ticketCategory', Category)
                    localStorage.setItem('ticketDescription', Description)
                    localStorage.setItem('ticketDate_Deadline', Date_Deadline)
                   
                   


                    updateTicket();





                    //$.ajax({

                    //    type: 'POST',
                    //    url: 'http://localhost:53129/api/Ticket?Title=' + Title + '&Priority=' + Priority_level + '&Category=' + Category + '&Created_By=' + Created_By + '&Assigned_To=' + Assigned_To + '&Assigned_By=' + Assigned_By + '&Date_Deadline=' + Date_Deadline + '&Description=' + Description,
                    //    data: { string: "Task" },
                    //    success: function (data) {

                    //        $('#alertSuccess').empty();
                    //        $('#alertSuccess').append('Task successfully Updated.');
                    //        document.getElementById('alertSuccess').removeAttribute('hidden');
                    //        clear();

                    //    },
                    //    error: function (error) {
                    //        // Do something with the error
                    //        alert("NOT connected");
                    //    }
                    //})

                }





            }









        });

    </script>

    <script>
        function clear() {
            document.getElementById("lbPriority").selectedIndex = "-1";
            document.getElementById("lbEmployee").selectedIndex = "-1";
            document.getElementById("tbTitle").value = "";
            document.getElementById("lbCategory").selectedIndex = "-1";
            document.getElementById("tbDescription").value = "";
            document.getElementById("tbDeadline").value = "";




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

                            $('#alertSuccess').empty();
                            $('#alertSuccess').append('Task successfully Updated.');
                            document.getElementById('alertSuccess').removeAttribute('hidden');
                            clear();
                   
                },
                error: function (error) {

                }




            });
        }
</script>

</asp:Content>
