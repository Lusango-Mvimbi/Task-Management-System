<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Task_Management_Website.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row justify-content-center">
        <div class="col-md-6">
            
      <h1 class="h3 mb-3 font-weight-normal" style="margin-left:11%;">Please sign in</h1>
      <img src="assets/images/faces/default-avatar.png" style="width:100px; margin-left:16%;" />
      <br />
      <br />
      <br />
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
             <div id="alertError" class="alert alert-danger col-6" role="alert" hidden></div>
             <div id="alertWarning" class="alert alert-warning col-6" role="alert" hidden style="background-color:#f0ad4e"></div>
      <label for="inputEmail" class="sr-only">Email address</label>

        <%--<asp:TextBox  id="tbEmail" class="form-control col-6" placeholder="Email address" runat="server"></asp:TextBox>--%>
            
      <input type="email" id="tbEmail" class="form-control col-6" placeholder="Email address" autofocus>
               <br />
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
      <label for="inputEmail" class="sr-only"> Password</label>

        <%--<asp:TextBox  id="tbPassword" class="form-control col-6" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>--%>
      <input type="password" id="tbPassword" class="form-control col-6" placeholder="Password" autofocus>
            <br />
        </div>
    </div>
    <%-- <div class="row justify-content-center">
        <div class="col-md-6">
      
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
        </div>
    </div>--%>

    <div class="row justify-content-center">
        <div class="col-md-6">
      
        <%--<asp:Button ID="Button1" CssClass="btn btn-primaty btn-block col-6" runat="server" Text="Sign In" />--%>
      <button id="btnSignIn" type="button" class="btn btn-primaty btn-block col-6" >Sign In</button>
        </div>
    </div>

    <script>
        document.getElementById('btnSignIn').addEventListener('click', function () {

            var u = document.getElementById('tbEmail').value;
            var p = document.getElementById('tbPassword').value;

            if (u === "" || p === "") {
                $('#alertWarning').empty();
                $('#alertWarning').append("ERROR! Fill both email and password");

                document.getElementById('alertWarning').removeAttribute("hidden")

            }
            else {

                document.getElementById('alertWarning').setAttribute("hidden","hidden")

                $.ajax({

                    type: 'GET',
                    url: "http://localhost:53129/api/User?user=" + u + "&pass=" + p,
                    dataType: 'json',
                    success: function (data) {

                        if (data.Email === null) {
                            $('#alertError').empty();
                            $('#alertError').append("Invalid username or password ");
                            document.getElementById('alertError').removeAttribute("hidden")

                        } else {
                            
                            localStorage.setItem('userID', data.ID)
                            localStorage.setItem('userFirstname', data.First_Name)
                            localStorage.setItem('userLastName', data.Last_Name)
                            localStorage.setItem('userPosition', data.Position)
                            localStorage.setItem('userSkill', data.Skills)
                            localStorage.setItem('userEmail', data.Email)
                            localStorage.setItem('userisAssing', data.isAssigner)
                            localStorage.setItem('username', data.Username)
                            localStorage.setItem('isTeamLeader', data.isTeamLeader)
                            localStorage.setItem('TeamLeading', data.TeamLeading)
                            localStorage.setItem('DivisionUnder', data.DivisionUnder)
                            localStorage.setItem('TeamUnder', data.TeamUnder)


                            window.location.href = "logUser.aspx?ID=" + data.isAssigner + ":" + data.ID + ":" + data.Email;


                        }



                    }

                });
            }
            
            
            
            




            
        });
    </script>
    

    


</asp:Content>
