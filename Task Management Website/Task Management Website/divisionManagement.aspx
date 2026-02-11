<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="divisionManagement.aspx.cs" Inherits="Task_Management_Website.divisionManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
    <a class="navbar-brand" href="#">Divsion Management</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-modal-create-ticket">
            
         <div class="modal-ticket-content" >
             <div class="close-ticket-create">+</div>
             <div  class="modal-ticket-title">
                    <h4>Create new division</h4>

             </div>
            <br/>
            <br/>
            <div class=" form-group">
                        <label style="color:#993399">Division name</label>
                        <br />
                        <input id="tbDivision" class=" form-control">
                      

                        <div id="validateDeadline" class="validate-input" hidden>
                            Deadline reqiured
                        </div>
                    </div>

             <button type="button" onclick="createDivision()" class="btn btn-primary" style="float:right">Create</button>


        </div>
     </div>





    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body row">

                    <div class="col-md-4" style="padding:0">
                        <h2>Divisions</h2>
                        <div  class="listItem">
                            <ul id="listDivisions">
                               <li>
                                   <div class="row">
                                       <div class="col-md-3">
                               <button type="button" onclick="viewDision(3)" class="btn btn-info btn-sm">Update</button>

                                       </div>
                                       <div class="col-md-9"  style="padding-top:10px">
                               <a href="#">Division Name col 1 </a>

                                       </div>
                                   </div>
                               </li>
                             
                            </ul>

                        </div>

                    </div>
                    <div class="col-md-4" style="padding:0">
                        <h2>Teams</h2>
                        <div class="TeamList">
                            <ul>
                                <li>
                                    <div class="row" style=" padding:9px 0 0 10px">
                                          <div class="col-md-3">
                                       <button type="button" onclick="viewTeam(num)" class="btn btn-info btn-sm">Update</button>

                                               </div>
                                          <div class="col-md-9" >
                                                <a href="#" style="font-size: 15px; font-weight: bold; margin:0;padding:0; display:block">Team Name
                                                    </a>
                                                <span class="text-muted" style="font-size: 12px;margin:0;padding:0">Team Leader</span>

                                               </div>


                                    </div>

                                </li>
                            </ul>



                        </div>


                    </div>
                    <div class="col-md-4" style="padding:0">
                        <h2>Employees</h2>
                        <div class="EmployeeList">
                            <table style="width:100%">
                                
                                <tr>
                                    <td> <a href="#">Employee 1</a></td>
                                    <td> Created</td>
                                </tr>
                                <tr>
                                    <td> <a href="#">Employee 1</a></td>
                                </tr>
                            </table>
                        </div>

                    </div>
                   
                   
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            getDivision();
        });

    </script>


    <script>
        function addDivision() {
            document.querySelector('.bg-modal-create-ticket').style.display = 'flex';
        }

        document.querySelector('.close-ticket-create').addEventListener('click', function () {
            document.querySelector('.bg-modal-create-ticket').style.display = 'none';

        });
        document.getElementById('cancelEmployeeUpdate').addEventListener('click', function () {
            document.querySelector('.bg-modal-create-ticket').style.display = 'none';

        });

    </script>
    <script>
        function getDivision() {
            $.ajax({




                type: 'GET',
                url: 'http://localhost:53129/GetAllDivisions',
                dataType: 'json',
                success: function (data) {

                    var display = '';

                    $.each(data, function (index, val) {

                       
                        display += "<li>";
                        display += "<div class='row'>";
                        display += "<div class='col-md-3'>";
                        display += "<button type='button' onclick='viewDision("+ val.ID +")' class='btn btn-info btn-sm'>Update</button>";
                        display += "";
                        display += "</div>";
                        display += "<div class='col-md-9'  style='padding-top:10px'>";
                        display += "<a href='#'>" + val.Name +"</a>";
                        display += "";
                        display += "</div>";
                        display += "</div>";
                        display += "</li>";
                       
                        display += "";
                        

                    });

                    $('#listDivisions').empty();
                    $('#listDivisions').append(display);

                }

            });
        }

       

    </script>

    <script>
        function createDivision() {
            dataToPost = {
                Name: document.getElementById('tbDivision').value
                
            };
            $.ajax({




                type: 'POST',   
                url: 'http://localhost:53129/api/Division',
                data: dataToPost,
                success: function (data) {

                    if (data == true) {
                        
                        swal({
                            title: "Division successfully added",

                            icon: "success",
                            button: "OK"
                        });
                        document.querySelector('.bg-modal-create-ticket').style.display = 'none';
                        getDivision();

                    }

                }

            });




        }
    </script>

    <script>
        function viewDision(num) {
            alert(num);
        }

    </script>
     <script>
         function viewTeam(num) {
             alert("team"+num);
         }

    </script>


</asp:Content>
