<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Withdraw.aspx.cs" Inherits="My_EWallet.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 style="color: #FFFFFF">Withdraw</h3>
    <hr />
    <br />
    <div>
      <div class="balance-div" style="display: flex; justify-content: center;">
            <asp:Panel ID="pnlBalance" runat="server" class="w3-panel w3-white w3-round-xlarge w3-padding-24" Width="300px" Height="150px">
                <h3 style="padding: 10px; color: #142850; font-weight: bold; justify-content: space-around; text-align:center; "><sup>Php</sup> <%Response.Write(Session["bal"]);%> &nbsp;&nbsp;<asp:Button ID="btnDep" runat="server" class="w3-button w3-circle w3-black" Text="+" PostBackUrl="~/Deposit.aspx" /></h3>
                <h6 style="text-align:center;">Current Balance</h6>
                <br />
            </asp:Panel>
            <br />
        </div>
            
        <br />


        <div style="display: flex; justify-content: center;">
            <br />
            <asp:Panel ID="pnlWithdraw" runat="server">
                <asp:Label ID="lblAmount" runat="server" Text="Amount to Withdraw" ForeColor="White"></asp:Label><br />
                <asp:TextBox ID="txtAmtToWithdraw" class="w3-input w3-border w3-round" runat="server"></asp:TextBox><br />
                <asp:Button ID="btnWithdraw" runat="server" Text="Cash Out" OnClick="btnWithdraw_Click" class="w3-button w3-blue w3-round" style="height: 40px" />  
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
