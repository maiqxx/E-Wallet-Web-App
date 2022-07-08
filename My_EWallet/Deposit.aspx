<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Deposit.aspx.cs" Inherits="My_EWallet.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 style="color: #FFFFFF">Deposit</h3>
    <hr />
    <br />
    <div>

        <div class="balance-div" style="display: flex; justify-content: center;">
            <asp:Panel ID="pnlBalance" runat="server" class="w3-panel w3-white w3-round-xlarge w3-padding-24" Width="300px" Height="150px">
                <h3 style="padding: 10px; color: #142850; font-weight: bold; justify-content: space-around; text-align:center; "><sup>Php</sup> <%Response.Write(Session["bal"]);%> </h3>
                <h6 style="text-align:center;">Current Balance</h6>
                <br />
            </asp:Panel>
            <br />
        </div>
            
            <br />

            <div style="display: flex; justify-content: center;">
            <br />
            <asp:Panel ID="pnlDeposit" runat="server" >
                <asp:Label ID="lblAmount" runat="server" Text="Amount" ForeColor="White"></asp:Label><br />
                <asp:TextBox ID="txtAmountDept" class="w3-input w3-border w3-round" runat="server"></asp:TextBox><br />
                <asp:Button ID="btnDeposit" runat="server" Text="Deposit" OnClick="btnDeposit_Click" class="w3-button w3-blue w3-round" style="height: 40px;width:100px" />
                <a href="../Transaction" runat="server" class="w3-button w3-blue w3-round" style="color:white;height: 40px; width:100px">Back</a>
            </asp:Panel>
            </div>


        </div>

    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />


</asp:Content>
