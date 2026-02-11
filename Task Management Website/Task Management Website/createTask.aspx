<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="createTask.aspx.cs" Inherits="Task_Management_Website.createTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/gijgo/jquery-3.3.1.min.js"></script>
    <link href="assets/gijgo/gijgo.min.css" rel="stylesheet" />
    <script src="assets/gijgo/gijgo.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
    <h4 class="navbar-brand">Create Task Form</h4>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row">
        <div class="col-md-8">

            <div id="alertSuccess" class="alert alert-success" role="alert" hidden></div>
            <div id="alertError" class="alert alert-danger" role="alert" hidden></div>


            <div class="card">

                <div class="card-body">

                    <div class=" form-group">
                        <label for="titleText" style="color:#993399">Ticket Title </label>
                        <br />
                        <input id="tbTitle" class="form-control">
                        <div id="validateTitle" class="validate-input" hidden>
                            Title reqiured
                        </div>


                    </div>
                    <div class=" form-group">
                        <label for="prioritySelect"  style="color:#993399">Select Priority Level</label>
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
                        <label class="" style="color:#993399">Select Type/Category</label>
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
                        <label style="color:#993399">Deadline</label>
                        <br />
                        <input id="tbDeadline" class=" form-control">
                        <div id="validateDeadline" class="validate-input" hidden>
                            Deadline reqiured
                        </div>
                    </div>

                    <div class=" form-group">
                        <label for="AssigntoSelect" style="color:#993399">Assign To (Select Employee)</label>

                        <div id="listEmployees"></div>

                        <div id="validateEmployee" class="validate-input" hidden>
                            Assigned to reqiured
                        </div>
                    </div>
                    <br />
                    <div class=" form-group">
                        <label for="descriptionText" style="color:#993399">Description</label>
                        <br />
                        <input id="tbDescription" placeholder="Extra information about the task" class="form-control">
                        <div id="validateDescription" class="validate-input" hidden>
                            Descriptions reqiured
                        </div>
                    </div>

                    <%--<asp:Button  Text="Create Task" OnClick="btnCreate_Click" />--%>
                    <button id="btnCreate" type="button" class="mt-1 btn btn-primary btn-block">Create Task</button>
                </div>
            </div>
        </div>
    </div>

     <script>
         $('#tbDeadline').datetimepicker({ footer: true, modal: true });
         
    </script>



    <script type="text/javascript">
        $(document).ready(function () {


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


            if (localStorage.getItem('logDetailPage') == 'true') {

               

                var t = localStorage.getItem('logTitle');
                var d = localStorage.getItem('logDescription');

                if (t == 'Software') { document.getElementById("lbCategory").selectedIndex = "1"; }
                if (t == 'Hardware') { document.getElementById("lbCategory").selectedIndex = "2";}
                if (t == 'Network') { document.getElementById("lbCategory").selectedIndex = "3"; }
                document.getElementById("tbDescription").value = d;

                localStorage.removeItem('logDetailPage');
                localStorage.removeItem('logTitle');
                localStorage.removeItem('logDescription');
            }

        });

    </script>


    <script type="text/javascript">
        $('#btnCreate').on('click', function () {


            Title = $('#tbTitle').val();
            Priority_level = $('#lbPriority').val();
            Category = $('#lbCategory').val();
            Created_By = localStorage.getItem('userEmail')
            Assigned_To = $('#lbEmployee').val();
            Assigned_By = "no assigner";
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



                if (Assigned_To != "" && Date_Deadline == "")
                {
                    $('#validateDeadline').empty();
                    $('#validateDeadline').append('Deadline Required for assignee.');
                    document.getElementById('validateDeadline').removeAttribute('hidden');
                    
                }else if (Assigned_To == "" && Date_Deadline != "") {

                    $('#validateEmployee').empty();
                    $('#validateEmployee').append('Employe Required in order to meet dealine.');
                    document.getElementById('validateEmployee').removeAttribute('hidden');

                }
                else {


                    if (Description == '') { Description = "No Description" }

                    var Status = "unassigned";

                    if (Assigned_To != '') {
                        Status = "open";
                        Assigned_By = localStorage.getItem('userEmail');
                    } else {
                        Assigned_To = "not assigned";
                    }


                            dataToPost = {
                                //ID: 1,
                                Title: Title,
                                Priority_level: Priority_level,
                                Category: Category,
                                Description: Description,
                                Created_By: Created_By,
                                Assigned_To: Assigned_To,
                                Assigned_By: Assigned_By,
                                Status: Status,
                                Veiwed: "-",
                                //Date_Created: "2019-08-19T02:52:58.784655+02:00",
                                Date_Deadline: "2019-08-19T02:52:58.7851552+02:00",
                                Date_Completed: "1800-08-03T08:08:08.7851552+02:00"
                            }


                            $.ajax({

                                type: 'POST',
                                url: 'http://localhost:53129/api/Ticket',
                                data: dataToPost,
                                success: function (data) {

                                    if (data == true) {

                                        swal({
                                            title: "Employee Successfully added",

                                            icon: "success",
                                            button: "OK"
                                        });

                                    } else {
                                        swal({
                                            title: "Error! Something went wrong",

                                            icon: "error",
                                            button: "OK"
                                        });
                                    }


                                },
                                error: function (error) {
                                    // Do something with the error
                                    alert("NOT connected");
                                }
                            });

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




</asp:Content>
