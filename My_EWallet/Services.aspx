<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="My_EWallet.About" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
    .mySlides {
        display:none;

    }
    </style>


    <h2 style="color:white;">Services</h2>
    <hr />
    <br />

    <div class="w3-content w3-section" style="max-width:500px">
      <img class="mySlides" src="Images/ServicesPageIMGs/1.png" style="width:100%">
      <img class="mySlides" src="Images/ServicesPageIMGs/2.png" style="width:100%">
      <img class="mySlides" src="Images/ServicesPageIMGs/3.png" style="width:100%">
    </div>


    <br />
    <br />
    <br />
    <br />
    <br />

    <script type="text/javascript">
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";  
        }
        myIndex++;
      if (myIndex > x.length) {myIndex = 1}    
      x[myIndex-1].style.display = "block";  
      setTimeout(carousel, 2000); // Change image every 2 seconds
    }
    </script>
  
</asp:Content>
