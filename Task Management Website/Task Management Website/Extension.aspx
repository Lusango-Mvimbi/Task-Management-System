<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Extension.aspx.cs" Inherits="Task_Management_Website.Extension" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title" id="ticketTitle">Ticket Title</h4>
                  <p class="card-category">Priority: <span id="priority"></span></p>
                  <p class="card-category">Deadline: <span id="deadline"></span></p>
                  <p class="card-category">Category: <span id="category"></span></p>
                  
                </div>
                <div class="card-body">
                  <div>
                    
                      
                    <div class="row">
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label >Reason for Extension/Pause</label>
                          <div class="form-group" style="margin:0px">
                            <textarea id="description" class="form-control" rows="2" style="background-color: #fafafa"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                      <div id="updateTicket">
                           <button type="button" onclick="Cancel()" class="btn btn-primary">Cancel</button>
                           <button type="button" onclick="Submit()" class="btn btn-primary">Submit</button>
                      
                      </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>

     






    <script type="text/javascript">
        $(document).ready(function () {

            var ID = localStorage.getItem('ticketID');
            var Title = localStorage.getItem('ticketTitle');
            var Priority = localStorage.getItem('ticketPriority');
            var Category = localStorage.getItem('ticketCategory');
            var Descricption = localStorage.getItem('ticketDescription');
            var Created_By = localStorage.getItem('ticketCreated_By');
            var Assigned_To = localStorage.getItem('ticketAssigned_To');
            var Assigned_By = localStorage.getItem('ticketAssigned_By');
            var Status = localStorage.getItem('ticketStatus');
            var Viewed = localStorage.getItem('ticketViewd');
            var Date_Created = localStorage.getItem('ticketDate_Created');
            var Date_Deadline = localStorage.getItem('ticketDate_Deadline');
            var Date_Completed = localStorage.getItem('ticketDate_Completed');
            var Created_By = localStorage.getItem('ticketCreated_By');
            
            $('#ticketTitle').empty();
            $('#priority').empty();
            $('#deadline').empty();
            $('#category').empty();
            document.getElementById('description').value = "";

            $('#ticketTitle').append(Title);
            $('#priority').append(Priority);
            $('#deadline').append(Date_Deadline);
            $('#category').append(Category);


        });
    </script>


    <script type="text/javascript">
        function Cancel() {


            localStorage.removeItem('ticketID');
            localStorage.removeItem('ticketTitle');
            localStorage.removeItem('ticketPriority');
            localStorage.removeItem('ticketCategory');
            localStorage.removeItem('ticketDescription');
            localStorage.removeItem('ticketCreated_By');
            localStorage.removeItem('ticketAssigned_To');
            localStorage.removeItem('ticketAssigned_By');
            localStorage.removeItem('ticketStatus');
            localStorage.removeItem('ticketViewd');
            localStorage.removeItem('ticketDate_Created');
            localStorage.removeItem('ticketDate_Deadline');
            localStorage.removeItem('ticketDate_Completed');
            localStorage.removeItem('ticketCreated_By');
            
            window.location.href = "Extension.aspx";


        }

    </script>

    <script type="text/javascript">
        function Submit() {
            var existingDescricption = localStorage.getItem('ticketDescription');
            var description = document.getElementById('description').value;

            if (description == '') {
                alert('Empty');
            } else {
                localStorage.setItem('ticketStatus', 'extensionRequested');
                localStorage.setItem('ticketDescription', 'User respndse:('+description+')   ---   Task: description '+existingDescricption);

                
                updateTicket();
            }

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
                    localStorage.removeItem('ticketID');
                    localStorage.removeItem('ticketTitle');
                    localStorage.removeItem('ticketPriority');
                    localStorage.removeItem('ticketCategory');
                    localStorage.removeItem('ticketDescription');
                    localStorage.removeItem('ticketCreated_By');
                    localStorage.removeItem('ticketAssigned_To');
                    localStorage.removeItem('ticketAssigned_By');
                    localStorage.removeItem('ticketStatus');
                    localStorage.removeItem('ticketViewd');
                    localStorage.removeItem('ticketDate_Created');
                    localStorage.removeItem('ticketDate_Deadline');
                    localStorage.removeItem('ticketDate_Completed');
                    localStorage.removeItem('ticketCreated_By');
                    window.location.href = "Ehome.aspx";
                    
                },
                error: function (error) {

                }




            });
        }
</script>


</asp:Content>
