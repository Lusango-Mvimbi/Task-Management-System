<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="Task_Management_Website.TicketDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="row">
            <div class="col-md-8">
                 <div id="alertSuccess" class="alert alert-success" role="alert" hidden></div>
            <div id="alertError" class="alert alert-danger" role="alert" hidden></div>

              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title" id="ticketTitle">Ticket Title</h4>
                  <p class="card-category">Ticket ID: <span id="ticketID"></span> Complete details </p>
                  
                </div>
                <div class="card-body">
                  <div>
                    <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399">Priority</label>
                          <p id="priority"></p>
                          </div>
                      </div>
                         <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399">Category</label>
                          <p id="category"></p>
                          </div>
                      </div>
                
                    </div>
                      <div class="row" style="background-color: #fafafa">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399">Deadline</label>
                          <p id="dateDeadline"></p>
                          </div>
                      </div>
                
                      <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399">Completed</label>
                          <p  id="dateCompleted"></p>
                          </div>
                      </div>
                          
                    </div>

                      

                       <div class="row"  style="background-color: #fafafa">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399">Assigned To</label>
                          <p id="assignedTo"></p>
                          </div>
                      </div>
                
                      <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399">By</label>
                          <p id="assignedBy"></p>
                          </div>
                      </div>
                    </div>

                      <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label   style="color:#993399">Created</label>
                          <p  id="dateCreated"></p>
                          </div>
                      </div>
                
                          <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399">By</label>
                          <p id="createdBy"></p>
                          </div>
                      </div>
                      
                    </div>

                      <div class="row"  style="background-color: #fafafa">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399">Status</label>
                          <p id="status"></p>
                          </div>
                      </div>

                          <div class="col-md-5">
                        <div class="form-group">
                          <label style="color:#993399;">Seen</label>
                          <p id="seen"></p>
                          </div>
                      </div>
                
                      
                    </div>

                    
                    
                    <div class="row">
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label  style="color:#993399">Description</label>
                          <div class="form-group">
                            <textarea id="description" class="form-control" rows="2" readonly style="background-color:white"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                      <div id="updateTicket">
                           
                      
                      </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>








     


    <script type="text/javascript">
        $(document).ready(function () {

            getData();
            

    



        });

    </script>

    <script>
        function deleteTask()
        {
            $.ajax({

                type: 'POST',
                url: 'http://localhost:53129/api/Ticket/' + document.URL.split("=")[1],
                data: { string: "Task" },
                success: function (data) {

                   
                    localStorage.setItem('TaskDeleted', 'Task successfully deleted.');

                    
                    window.location.href = "Task.aspx";

                },
                error: function (error) {
                    // Do something with the error
                    alert("NOT connected");
                }
            })

        }
    </script>


    <script>
        function reassign (num)
        {
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


                    window.location.href = "updateTicket.aspx?ID="+num;



                },

            });
        }
    </script>

    

    <script>
        function confirmSolvedTicket(num) {



            
           

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
                    localStorage.setItem('ticketStatus', 'closed')
                    localStorage.setItem('ticketViewd', Viewed)
                    localStorage.setItem('ticketDate_Created', Created_By)
                    localStorage.setItem('ticketDate_Deadline', Date_Deadline)
                    localStorage.setItem('ticketDate_Completed', Date_Completed)
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


                    alert("connected");

                    $('#alertSuccess').empty();
                    $('#alertSuccess').append('Task successfully Updated.');
                    document.getElementById('alertSuccess').removeAttribute('hidden');

                    window.location.href = "#alertSuccess";
                   
                   
                },
                error: function (error) {

                }




            });
        }
</script>



    <script>
        function getData() {
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
                    localStorage.setItem('ticketStatus', Status)
                    localStorage.setItem('ticketViewd', Viewed)
                    localStorage.setItem('ticketDate_Created', Created_By)
                    localStorage.setItem('ticketDate_Deadline', Date_Deadline)
                    localStorage.setItem('ticketDate_Completed', Date_Completed)
                    localStorage.setItem('ticketCreated_By', Date_Created)


                    $('#ticketID').empty();
                    $('#ticketTitle').empty();
                    $('#priority').empty();
                    $('#dateDeadline').empty();
                    $('#dateCompleted').empty();
                    $('#category').empty();
                    $('#assignedTo').empty();
                    $('#assignedBy').empty();
                    $('#dateCreated').empty();
                    $('#status').empty();
                    $('#seen').empty();
                    $('#description').empty();
                    $('#createdBy').empty();

                    $('#ticketID').append(ID);
                    $('#ticketTitle').append(Title);
                    $('#priority').append(Priority_level);
                    $('#dateDeadline').append(Date_Deadline);
                    $('#dateCompleted').append(Date_Completed);
                    $('#category').append(Category);
                    $('#assignedTo').append(Assigned_To);
                    $('#assignedBy').append(Assigned_By);
                    $('#dateCreated').append(Date_Created);
                    $('#createdBy').append(Created_By);
                    $('#status').append(Status);

                    if (Viewed === 'y') {
                        $('#seen').append('Yes');
                    } else {
                        $('#seen').append('No');
                    }

                    $('#description').append(Description);


                    $('#updateTicket').empty();

                    $('#updateTicket').append('<button type="button" onclick="deleteTask()" class="btn btn-danger"  style="margin-right:100px">Delete Task</button>');

                    if (Status == 'underEvalution') {

                        $('#updateTicket').append('<button type="button" onclick="confirmSolvedTicket(' + document.URL.split("=")[1] + ')" class="btn btn-info"   style="float:right">Confirm Solved</button>');
                        $('#updateTicket').append('<button type="button" onclick="reassign(' + document.URL.split("=")[1] + ')" class="btn btn-primary"   style="float:right">Re-Assign</button>');
                        //$('#updateTicket').append('<a href=updateTicket.aspx?ID=' + document.URL.split("=")[1] + ' class="btn btn-primary" style="float:right">Re-Assign</a>');

                    }
                    else if (Status == 'extensionRequested') {

                        $('#updateTicket').append('<a href=updateTicket.aspx?ID=' + document.URL.split("=")[1] + ' class="btn btn-primary" style="float:right">Re-Assign</a>');
                        //$('#updateTicket').append('<a href=updateTicket.aspx?ID=' + document.URL.split("=")[1] + ' class="btn btn-primary" style="float:right">Decline</a>');
                    } else {

                        $('#updateTicket').append('<a href=updateTicket.aspx?ID=' + document.URL.split("=")[1] + ' class="btn btn-primary" style="float:right">Update</a>');
                    }



                }



            });
        }
    </script>
</asp:Content>
