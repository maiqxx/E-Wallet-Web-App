<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="My_EWallet.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style type="text/css">  
        .style1  
        {  
            text-align: center;  
            background-color: #999999;  
        }  
        .style2  
        {  
            background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
        }  
    </style> 

    <div class="w3-bar w3-bottombar w3-border-blue-gray">
        <a href="#" runat="server" class="w3-bar-item w3-button" style="color:white;">Home</a>
        <a href="../ManageUsers" runat="server" class="w3-bar-item w3-button" style="color:white;">Manage Users</a>
        <a href="../AdminReports" runat="server" class="w3-bar-item w3-button" style="color:white;">Reports</a>
        <a href="../AdminAccount" runat="server" class="w3-bar-item w3-button" style="color:white;">My Account</a>
        <a href="../LogIn" runat="server" class="w3-bar-item w3-button w3-right" style="color:white;">Log Out</a>
    </div>
    <br />

    <div>

        <div class="admin-home-div" style="display: flex; justify-content: center;">
            <asp:Panel ID="pnlWelcome" runat="server" class="w3-panel w3-round-xlarge w3-padding-24 style2" Width="800px" Height="300px">
                <br />
                <h2 style="padding: 10px; color: #142850; font-weight: bold; justify-content: space-around; text-align:center; ">Welcome Admin, </h2>&nbsp;&nbsp;
                <h1 style="text-align:center; font-weight: bold; color: #142850;"><%Response.Write(Session["username"]);%>!</h1>
                <br />
            </asp:Panel>
            <br />
        </div>
        
        


    </div>


    








</asp:Content>
