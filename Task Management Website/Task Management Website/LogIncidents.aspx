<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LogIncidents.aspx.cs" Inherits="Task_Management_Website.LogIncidents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    	<!----Head content here buddy-->
  <script>
var _data = {};
      var _data = {
          "Cyb": {
              "acc": "Account Administration",
              "app": "Application/Software",
              "bro": "Browsing/Blocked site",
              "cer": "Certificates/Verisign-symantec",
              "ema": "Email",
              "equ": "Equipment Request and quotations",
              "fac": "Facilities/Data Center",
              "fac2": "Facility Access",
              "fau": "Faulty COMM Port",
              "fir": "Firewall",
              "had": "Hardware",
              "key": "Key Injection",
              "mso": "MS Office",
              "net": "Network",
              "new": "New User",
              "noc": "NOC",
              "pho": "Phones",
              "pri": "Printers",
              "pri2": "Printing",
              "rep": "Reports and Documentation",
              "ser": "Servers/Systems",
              "soc": "SOC",
              "sys": "Syspro",
              "sys2": "System support",
          },

		
		
          "Its": {
              "car": "Card Personalisations ",
              "sec": "Secure Payment Processing",
              "pay": "Payment Terminals",
              "mob": "Mobile Forms",
              "pub": "Public Transport Solutions",
              "fil": "Field Services",
              "cyb": "Cyber Security Services",
              "val": "Value Added Services",
          }
      };
</script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageHeading" runat="server">		
		
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<!-- page-content-wrapper (body) -->
    <div class="row">
        <div class="col-md-8">
            <div id="alertSuccess" class="alert alert-success" role="alert" hidden></div>
             <div id="alertError" class="alert alert-danger" role="alert" hidden></div>
            <div class="card">
                <div class="card-header card-header-primary">
                    <h4 class="card-title" id="ticketTitle">Log an Incident</h4>  
                </div>
                <div class="card-body">
                    <div>
                        <div class="row">
                            <div class="col-md-4">
                                 <label for="prioritySelect"  class="" style="color:#993399">Divisions</label>
                                <select class="form-control" id="cyb-select">
                                    <option value="">Please select a division</option>
                                     <option value="Cyb">CyberTech</option>
                                     <option value="Its">ITS</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                 <label for="prioritySelect"  class="" style="color:#993399">Issue Types or Project name/s</label>
                                <select class="form-control" id="env_ddl">
                                    <%--<option value=""> </option>--%>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label style="color:#993399" >Describe your problem here</label>
                                    <div class="form-group" style="margin:0px">
                                        <textarea id="description" class="form-control" rows="2" style="background-color: #fafafa; margin:0"></textarea>
                                        <div id="validateDescription" class="validate-input" hidden></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="updateTicket">
                            <button type="button" onclick="Cancel()" class="btn btn-primary">Cancel</button>
                            <button type="button" onclick="Submit()" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
    $('#cyb-select').on('change', function(e){
        var source = $(this),
            val = $.trim(source.val()),
            target = $('#env_ddl');
			$(target).empty();
        if(typeof(_data[val]) != "undefined"){
            var options = (typeof(_data[val]) != "undefined") ? _data[val] : {};
			 $('<option>Select</option>').appendTo(target);
            $.each( options , function(value, index) {
                    $('<option value="' + value + '">' + index + '</option>').appendTo(target);
            });
        }

    });
  });
    </script>
</asp:Content>