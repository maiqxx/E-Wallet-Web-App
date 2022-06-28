<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="My_EWallet.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .plusBtn{
            text-align: center;  
        }
        .pnlStyle1  
        {  
            background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
        }  

    </style>

   <%-- <h3 style="color: #FFFFFF">Transaction</h3>--%>

    <div class="w3-bar w3-bottombar w3-border-blue-gray">
        <a href="../Deposit" runat="server" class="w3-bar-item w3-button" style="color:white;">Deposit</a>
        <a href="../Withdraw" runat="server" class="w3-bar-item w3-button" style="color:white;">Withdraw</a>
        <a href="../SendMoney" runat="server" class="w3-bar-item w3-button" style="color:white;">Send Money</a>
        <a href="../MyAccount" runat="server" class="w3-bar-item w3-button" style="color:white;">My Statement of Account</a>
        <a href="#" runat="server" class="w3-bar-item w3-button" style="color:white;">Reports</a>
        
        <a href="../LogIn" runat="server" class="w3-bar-item w3-button w3-right" style="color:white;">Log Out</a>
        <a href="#" runat="server" class="w3-bar-item w3-button w3-right" style="color:white;">Update Profile</a>
    </div>

    <br />
    <br />

    <div>
        <div class="balance-div" style="display: flex; justify-content: center;">
            <asp:Panel ID="pnlBalance" runat="server" class="w3-panel w3-white w3-round-xlarge w3-padding-24" Width="300px" Height="150px">
                <h3 style="padding: 10px; color: #142850; font-weight: bold; justify-content: space-around; text-align:center; "><sup>Php</sup> <%Response.Write(Session["bal"]);%> &nbsp;&nbsp;<asp:Button ID="btnDep" runat="server" class="w3-button w3-circle w3-black plusBn" Text="+" PostBackUrl="~/Deposit.aspx" /></h3>
                <h6 style="text-align:center;">Current Balance</h6>
                <br />
            </asp:Panel>
            <br />
        </div>
            
        <br />

        <div>
        <div class="admin-home-div" style="display: flex; justify-content: center;">
            <asp:Panel ID="pnlWelcome" runat="server" class="w3-panel w3-round-xlarge w3-padding-24 pnlStyle1" Width="800px" Height="300px">
                <br />
                <h2 style="padding: 10px; color: #142850; font-weight: bold; justify-content: space-around; text-align:center; ">Hello, </h2>&nbsp;&nbsp;
                <h1 style="text-align:center; font-weight: bold; color: #142850;"><%Response.Write(Session["username"]);%>!</h1>
                <br />
            </asp:Panel>
            <br />
        </div>


    </div>

       
    </div>

    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />

</asp:Content>
