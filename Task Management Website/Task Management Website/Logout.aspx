<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Task_Management_Website.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script type="text/javascript">
        $(document).ready(function () {


            localStorage.removeItem('userID')
            localStorage.removeItem('userFirstname')
            localStorage.removeItem('userLastName')
            localStorage.removeItem('userPosition')
            localStorage.removeItem('userSkill')
            localStorage.removeItem('userEmail')
            localStorage.removeItem('userisAssing')
            localStorage.removeItem('username')

            window.location.href = "index.aspx";

        });




    </script>


</asp:Content>
