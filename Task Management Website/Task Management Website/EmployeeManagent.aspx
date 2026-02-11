<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeManagent.aspx.cs" Inherits="Task_Management_Website.EmployeeManagent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
    <a class="navbar-brand" href="#">Employee Management</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="empDetail" class="bg-modal-create-ticket">
            
         <div class="modal-ticket-content">
             <div class="close-ticket-create">+</div>
             <div  class="modal-ticket-title">
                    <h4>Update Employee Details</h4>

             </div>
            <br/>
            <br/>
            
             <div>
                 <div style="padding:0px 10px 0 10px; border-bottom: 2px solid #993399;">
                     <table style="width:100%">
                         <tr>
                             <td style="text-align:left; width:28%">Title</td>
                             <td style="text-align:left">
                                  <select name="select" id="lbUpdateTitle" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:30%">
                                <option></option>
                                <option>Mr.</option>
                                <option>Mrs.</option>
                                <option>Ms.</option>
                            </select>
                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left; width:125px">First Name</td>
                             <td style="text-align:left">
                                  <input id="tbFirstName" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%">
                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left; width:125px">Last Name</td>
                             <td style="text-align:left">
                                  <input id="tbUpdateLastName" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%">
                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left">Email </td>
                             <td style="text-align:left">
                                  <input id="tbUpdateEmail" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%" type="email" >
                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left; width:125px">Postion</td>
                             <td style="text-align:left">
                                 <input id="tbUpdatePosition" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%">
                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left; width:125px">Division</td>
                             <td style="text-align:left">
                                 <select name="select" id="lbUpdateDivision" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%">
                                <option></option>
                                <option>Division 1</option>
                                <option>Division 2</option>
                                <option>...</option>
                               
                            </select>

                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left">Is Assigner</td>
                             <td style="text-align:left">
                                   <select name="select" id="lbUpdateIsAssigner" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:30%">
                                <option></option>
                                <option>Yes</option>
                                <option>No</option>
                               
                            </select>
                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left">Is Team Leader</td>
                             <td style="text-align:left">
                                  <select name="select" id="lbUpdateIsTeamLeader" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:30%">
                                <option></option>
                                <option>Yes</option>
                                <option>No</option>
                               
                            </select>
                             </td>
                         </tr>
                         
                         <tr>
                             <td style="text-align:left; width:125px">Skills</td>
                             <td style="text-align:left">
                                  <input id="tbUpdateSkills" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%">
                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left; width:125px">Team Leading</td>
                             <td style="text-align:left">
                                 <select name="select" id="lbUpdateTeamLeading" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%">
                                <option></option>
                                <option>Team 1</option>
                                <option>Team 2</option>
                                <option>...</option>
                               
                            </select>
                             </td>
                         </tr>
                         
                         <tr>
                             <td style="text-align:left; width:125px">Team Under</td>
                             <td style="text-align:left">
                                 <select name="select" id="lbUpdateTeamUnder" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%">
                                <option></option>
                                <option>Team 1</option>
                                <option>Team 2</option>
                                <option>...</option>
                               
                            </select>
                             </td>
                         </tr>

                     </table>
                     <br />
                 </div>
                     <button type="button" class="btn btn-danger" style="float:left">Delete</button>
                     <button type="button" class="btn btn-primary" style="float:right">Update</button>
                     <button type="button" id="cancelEmployeeUpdate" class="btn btn-info" style="float:right; margin-right:10px">Cancel</button>
             </div>


        </div>
     </div>


    <div id="alertError" class="alert alert-danger" role="alert" runat="server" visible="false"></div>
    <div id="alertSuccess" class="alert alert-success  col-md-8" role="alert" runat="server" visible="false"></div>



    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">

                    <button type="button" id="btnADDddEmployees" class="btn btn-primary">Add New Employees</button>
                    <button type="button" id="btnViewExistingEmployees"class="btn btn-primary">Existing Employees</button>

                   

                    <div id="newEmployeeAdd">
                        <div class="space">
                            <table>
                                <tr>
                                    <td style="width: 150px; padding-top: 10px">
                                        <h4>Filter By Division:</h4>
                                    </td>
                                    <td>
                                        <select id="lbDivision" style="width: 200px; border: 1px solid rgba(0,0,0,0.2); border-radius: 3px; color: rgba(0,0,0,0.5); height: 30px"></select>
                                    </td>
                                    <td style="text-align: left">
                                        <button type="button" id="filter" class='btn btn-info btn-sm' style="float: left">Filter</button>
                                    </td>
                                    
                                </tr>
                            </table>
                        </div>

                        <div class="listTable space">
                            <table style="width: 100%">
                                <thead style="border-bottom: 1px solid rgba(0,0,0,0.5)">
                                    <tr>
                                        <th>Full Name</th>
                                        <th>Email</th>
                                        <th>Division</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="AcsEmployeeList">
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div id="existingEmployees" hidden>
                        
                        <div class="space">
                            <table>
                                <tr>
                                    <td style="width: 150px; padding-top: 10px">
                                        <h4>Filter By:</h4>
                                    </td>
                                    <td>
                                        <select style="width: 200px; border: 1px solid rgba(0,0,0,0.2); border-radius: 3px; color: rgba(0,0,0,0.5); height: 30px">
                                            <option id="selectCategory">All</option>
                                            <option id="selectDivision">Division</option>
                                            <option id="selectLeader">Team Leader</option>
                                            <option id="selectPosition">Position</option>
                                            <option id="selectTeam">Team</option>

                                        </select>
                                    </td>
                                    <td>
                                        <select id="lbResult" style="width: 200px; border: 1px solid rgba(0,0,0,0.2); border-radius: 3px; color: rgba(0,0,0,0.5); height: 30px"></select>
                                    </td>
                                    <td style="text-align: left">
                                        <button type="button" id="filterExistingEmp" class='btn btn-info btn-sm' style="float: left">Filter</button>
                                    </td>
                                    
                                </tr>
                            </table>
                        </div>

                        <div class="listTable space">
                            <table style="width: 100%">
                                <thead style="border-bottom: 1px solid rgba(0,0,0,0.5)">
                                    <tr>
                                        <th>Full Name</th>
                                        <th>Email</th>
                                        <th>Division</th>
                                       
                                        <th>Team Leader</th>
                                        <th>Postions</th>
                                        <th>Team Leading</th>
                                        <th>Under Team</th>
                                    </tr>
                                </thead>
                                <tbody id="wssEmployeeList">
                                   
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        $(document).ready(function () {


            //localStorage.removeItem('addUserTitle')
            //localStorage.removeItem('addUserFirstname')
            //localStorage.removeItem('addUserLastName')
            //localStorage.removeItem('addUserPosition')
            //localStorage.removeItem('addUserSkill')
            //localStorage.removeItem('addUserEmail')
            //localStorage.removeItem('addUserDivision')

            wsquaredsystemEmployees();
            acsEmployees();





        });

    </script>
    <script>
        document.getElementById('btnViewExistingEmployees').addEventListener('click', function () {
            document.getElementById('newEmployeeAdd').setAttribute('hidden',' hidden');
            document.getElementById('existingEmployees').removeAttribute('hidden');

        });

        document.getElementById('btnADDddEmployees').addEventListener('click', function () {
            
            document.getElementById('newEmployeeAdd').removeAttribute('hidden');
            document.getElementById('existingEmployees').setAttribute('hidden',' hidden');

        });
    </script>
    <script>
        function employeeDetail(num) {

            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetUser/"+num,
                dataType: 'json',
                success: function (data) {

                        var ID = data.ID;
                        var First_Name = data.First_Name;
                        var Last_Name = data.Last_Name;
                        var Position = data.Position;
                        var Skills = data.Skills;
                        var Email = data.Email;
                        var isAssigner = data.isAssigner;
                        var Username = data.Username;
                        var Title = data.Title;
                        var Division = data.DivisionUnder;
                        var Leading = data.TeamLeading;
                    var inTeam = data.TeamUnder;



                    if (Title == 'Mr.'){
                        document.getElementById("lbUpdateTitle").selectedIndex = "1";
                    } else
                    if (Title == 'Mrs.') {
                        document.getElementById("lbUpdateTitle").selectedIndex = "2";
                    } else
                    if (Title == 'Ms.') {
                        document.getElementById("lbUpdateTitle").selectedIndex = "3";
                    } else
                    {
                        document.getElementById("lbUpdateTitle").selectedIndex = "0";
                    }

                    document.getElementById("tbFirstName").value = First_Name;
                    document.getElementById("tbUpdateLastName").value = Last_Name;
                    document.getElementById("tbUpdateEmail").value = Email;
                    document.getElementById("tbUpdatePosition").value = Position;
                    document.getElementById("tbUpdateSkills").value = Skills;

                    //document.getElementById("lbUpdateDivision").value = Position;
                    //document.getElementById("lbUpdateTeamLeading").value = Position;
                    //document.getElementById("lbUpdateTeamUnder").value = Position;

                    if (isAssigner == 'y') {
                        document.getElementById("lbUpdateIsAssigner").selectedIndex = "1";

                    } else if (isAssigner == 'n') {
                        document.getElementById("lbUpdateIsAssigner").selectedIndex = "2";

                    } else {
                        document.getElementById("lbUpdateIsAssigner").selectedIndex = "0";

                    }


                    if (isAssigner == 'y') {
                        document.getElementById("lbUpdateIsTeamLeader").selectedIndex = "1";

                    } else if (isAssigner == 'n') {
                        document.getElementById("lbUpdateIsTeamLeader").selectedIndex = "2";

                    } else {
                        document.getElementById("lbUpdateIsTeamLeader").selectedIndex = "0";

                    }
                   
                    

                   
                   
                   
                   
                    
                    
                   
                    //document.getElemntById('lbUpdateTeamLeading');
                    //document.getElemntById('lbUpdateTeamUnder');

                   
                }

            });


            document.querySelector('.bg-modal-create-ticket').style.display = 'flex';
        }

    </script>
    <script>


        document.querySelector('.close-ticket-create').addEventListener('click', function () {
            document.querySelector('.bg-modal-create-ticket').style.display = 'none';

        });
        document.getElementById('cancelEmployeeUpdate').addEventListener('click', function () {
            document.querySelector('.bg-modal-create-ticket').style.display = 'none';

        });

    </script>




    <script type="text/javascript">
        var sel = document.getElementById('filter').addEventListener('click', function () {

            var option = localStorage.getItem('divlist').split('|')[document.getElementById('lbDivision').selectedIndex];

            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllEmployees",
                dataType: 'json',
                success: function (data) {

                    $('#AcsEmployeeList').empty();

                    var display = '';





                    if (option == 'All Divisions') {
                        acsEmployees();
                    } else {
                        $.each(data, function (index, val) {

                            var ID = val.ID;
                            var First_Name = val.First_Name;
                            var Last_Name = val.Last_Name;
                            var Position = val.Position;
                            var Skills = val.Skills;
                            var Email = val.Email;
                            var isAssigner = val.isAssigner;
                            var Username = val.Username;
                            var Title = val.Title;
                            var Division = val.DivisionUnder;

                            var systemEmployees = localStorage.getItem('systemEmployees');

                            if (!systemEmployees.includes(Email)) {

                                if (option == Division) {

                                    display += "<tr>";
                                    display += "<td>" + Title + " " + First_Name + " " + Last_Name + "</td>";
                                    display += "<td>" + Email + "</td>";
                                    display += "<td>" + Division + "</td>";
                                    display += "<td><button type='button' onclick='addEmployeefromACSdata("+ ID +")' class='btn btn-info btn-sm btn-block'>Add</button></td>";
                                    display += "</tr>";
                                }


                            }





                        });


                        $('#AcsEmployeeList').append(display);
                    }




                }

            });

        });
    </script>



    <script>
        function acsEmployees() {
            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllEmployees",
                dataType: 'json',
                success: function (data) {

                    $('#AcsEmployeeList').empty();

                    var display = '';
                    var displayDivision = '<option>All Divisions</option>';
                    var divList = 'All Divisions|';

                    $.each(data, function (index, val) {

                        var ID = val.ID;
                        var First_Name = val.First_Name;
                        var Last_Name = val.Last_Name;
                        var Position = val.Position;
                        var Skills = val.Skills;
                        var Email = val.Email;
                        var isAssigner = val.isAssigner;
                        var Username = val.Username;
                        var Title = val.Title;
                        var Division = val.DivisionUnder;

                        var systemEmployees = localStorage.getItem('systemEmployees');

                        if (!systemEmployees.includes(Email)) {

                            display += "<tr>";
                            display += "<td>" + Title + " " + First_Name + " " + Last_Name + "</td>";
                            display += "<td>" + Email + "</td>";
                            display += "<td>" + Division + "</td>";
                            display += "<td><button type='button' onclick='addEmployeefromACSdata(" + ID +")' class='btn btn-info btn-sm btn-block'>Add</button></td>";
                            display += "</tr>";
                            if (!displayDivision.includes(Division)) {
                                displayDivision += "<option>" + Division + "</option>";
                                divList += Division + "|";
                            }
                        }





                    });

                    localStorage.setItem('divlist', divList);
                    $('#AcsEmployeeList').append(display);
                    $('#lbDivision').empty();
                    $('#lbDivision').append(displayDivision);
                }

            });
        }

    </script>


    <script>
        function wsquaredsystemEmployees() {
            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetAllUsers",
                dataType: 'json',
                success: function (data) {

                    $('#test').empty();
                    var display = '';
                    var saveEmails = '';
                    var count = 0;

                    $.each(data, function (index, val) {

                        var ID = val.ID;
                        var First_Name = val.First_Name;
                        var Last_Name = val.Last_Name;
                        var Position = val.Position;
                        var Skills = val.Skills;
                        var Email = val.Email;
                        var isAssigner = val.isAssigner;
                        var isLeader = val.isTeamLeader;
                        var Username = val.Username;
                        var Title = val.Title;
                        var Division = val.DivisionUnder;
                        var Leading = val.TeamLeading;
                        var inTeam = val.TeamUnder;


                        if (isAssigner != 'a') {

                            display += "<tr>";
                            display += "<button onclick='employeeDetail(ID)'>View</button>";
                            display += "<td><a href='#' onclick='employeeDetail(" + ID +  ")'>" + Title + " " + First_Name + " " + Last_Name + "</a></td>";
                            display += "<td>" + Email + "</td>";
                            display += "<td>" + Division + "</td>";
                            if (isLeader == 'y') {
                                display += "<td>Yes</td>";
                            } else {
                                display += "<td>No</td>";
                            }


                            display += "<td>" + Position + "</td>";
                            display += "<td>" + Leading + "</td>";
                            display += "<td>" + inTeam + "</td>";
                            display += "</tr>";




                            saveEmails += Email + ","; //dont delet used to compare emails
                            count++;

                        }

                    });

                    localStorage.setItem('systemEmployees', saveEmails) // to compare new with existing emails
                    
                    $('#numEmp').empty();
                    $('#wssEmployeeList').empty();
                    $('#numEmp').append(count);
                    $('#wssEmployeeList').append(display);


                }

            });
        }

    </script>


    <script>
        function addEmployeefromACSdata(num) {


            //getEmployeeData(num);
            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetEmployee/" + num,
                dataType: 'json',
                success: function (data) {

                    var title = data.Title;
                    var first_name = data.First_Name;
                    var last_name = data.Last_Name;
                    var position = data.Position;
                    var skills = data.Skills;
                    var email = data.Email;
                    var division = data.DivisionUnder;


                    dataToPost = {
                        Title: title,
                        First_Name: first_name,
                        Last_Name: last_name,
                        Position: position,
                        Skills: skills,
                        Email: email,
                        Username: email,
                        Password: email,
                        isAssigner: "n",
                        isTeamLeader: "n",
                        TeamLeading: "none",
                        TeamUnder: "none",
                        DivisionUnder: division,

                    };
                    $.ajax({




                        type: 'POST',
                        url: 'http://localhost:53129/api/User',
                        data: dataToPost,
                        success: function (data) {

                            if (data == true) {

                                swal({
                                    title: "Employee Successfully added",

                                    icon:"success",
                                    button: "OK"
                                });


                                wsquaredsystemEmployees();
                                acsEmployees();

                            }







                        }

                    });
                }

            });
            

        }

        //function getEmployeeData(num) {

        //    var str;

        //    $.ajax({

        //        type: 'GET',
        //        url: "http://localhost:53129/GetEmployee/" + num,
        //        dataType: 'json',
        //        success: function (data) {

                    

        //            localStorage.setItem('addUserTitle', data.Title)
        //            localStorage.setItem('addUserFirstname', data.First_Name)
        //            localStorage.setItem('addUserLastName', data.Last_Name)
        //            localStorage.setItem('addUserPosition', data.Position)
        //            localStorage.setItem('addUserSkill', data.Skills)
        //            localStorage.setItem('addUserEmail', data.Email)
        //            localStorage.setItem('addUserDivision', data.DivisionUnder)

                    
        //        }

        //    });
                  

        //}

    </script>


    <script>
        document.getElementById('selectCategory').addEventListener('click', function () {
            wsquaredsystemEmployees();
        });
        document.getElementById('selectDivision').addEventListener('click', function () {
            alert("test2");
        });
        document.getElementById('selectLeader').addEventListener('click', function () {
            alert("test3");
        });
        document.getElementById('selectPosition').addEventListener('click', function () {
            alert("test4");
        });
        document.getElementById('selectTeam').addEventListener('click', function () {
            alert("test5");
        });

        
    </script>



</asp:Content>
