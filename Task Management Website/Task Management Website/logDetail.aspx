<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="logDetail.aspx.cs" Inherits="Task_Management_Website.logDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title" id="logTitle">Incident Type</h4>
                  <p class="card-category">Log ID: <span id="logID"></span> Complete details </p>
                  
                </div>
                <div class="card-body">
                  <div>
                      <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label  style="color:#993399">Created</label>
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
                   <div class="row">
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label style="color:#993399">Description</label>
                          <div class="form-group">
                            <textarea id="description" class="form-control" rows="2" readonly style="background-color:white"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                      <div id="createLog">
                           
                      
                      </div>
                    <div class="clearfix"></div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>








     


    <script type="text/javascript">
        $(document).ready(function () {

           


            $.ajax({

                type: 'GET',
                url: "http://localhost:53129/GetLog/" + document.URL.split("=")[1],
                dataType: 'json',
                success: function (data) {


                    var ID = data.ID;
                    var Date_Created = data.Date_Created;
                    var IncidentCreater = "" + data.Username;
                    var Status = data.Status;
                    var Description = data.Description;
                    var Title = data.Title;

                    localStorage.setItem('logDetailPage', 'true');
                    localStorage.setItem('logTitle', Title);
                    localStorage.setItem('logDescription', Description);

                    $('#logID').empty();
                    $('#logTitle').empty();
                    $('#dateCreated').empty();
                    $('#createdBy').empty();
                    $('#description').empty();
                   
                    $('#logID').append(ID);
                    $('#logTitle').append(Title);
                    $('#dateCreated').append(Date_Created);
                    $('#createdBy').append(IncidentCreater);
                    $('#description').append(Description);
                   
                    
                }

            });


            $('#createLog').empty();
            $('#createLog').append('<a href="createTask.aspx" class="btn btn-primary btn-block">Create Ticket</a>');



        });




    </script>


</asp:Content>
