<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="Task_Management_Website.Administration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="bg-modal-create-ticket"">
            
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
                             <td style="text-align:left; width:125px">Postion</td>
                             <td style="text-align:left">
                                 <input id="tbUpdatePosition" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:100%">
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
                                 <select name="select" id="lbUpdateTeamLeading" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:30%">
                                <option></option>
                                <option>Team 1</option>
                                <option>Team 2</option>
                                <option>...</option>
                               
                            </select>
                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left; width:125px">Division</td>
                             <td style="text-align:left">
                                 <select name="select" id="lbUpdateDivision" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:30%">
                                <option></option>
                                <option>Division 1</option>
                                <option>Division 2</option>
                                <option>...</option>
                               
                            </select>

                             </td>
                         </tr>
                         <tr>
                             <td style="text-align:left; width:125px">Team Under</td>
                             <td style="text-align:left">
                                 <select name="select" id="lbUpdateTeamUnder" style="border:1px solid rgba(0,0,0,0.2); border-radius: 2px; width:30%">
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



    


    


    <script>
       

        document.querySelector('.close-ticket-create').addEventListener('click', function () {
            document.querySelector('.bg-modal-create-ticket').style.display = 'none';
            
        });
        document.getElementById('cancelEmployeeUpdate').addEventListener('click', function () {
            document.querySelector('.bg-modal-create-ticket').style.display = 'none';
            
        });

    </script>



</asp:Content>
