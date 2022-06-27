<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SendMoney.aspx.cs" Inherits="My_EWallet.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 style="color: #FFFFFF">Send Money</h3>
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
        <asp:Panel ID="pnlSendMoney" runat="server" >
        <asp:Label ID="lblSendToEm" runat="server" Text="Send To" ForeColor="White" ></asp:Label><br />
        <asp:TextBox ID="txtSendToEm" class="w3-input w3-border w3-round" runat="server" placeholder="Email Address of the Recipient" Width="300px" ></asp:TextBox><br />
        <asp:Label ID="lblAmount" runat="server" Text="Amount" ForeColor="White"></asp:Label><br />
        <asp:TextBox ID="txtAmountToSend" class="w3-input w3-border w3-round" runat="server" Width="300px"></asp:TextBox><br />
        <asp:Button ID="btnSendMoney" runat="server" Text="Send Money" OnClick="btnSendMoney_Click" class="w3-button w3-blue w3-round" style="height: 40px" /><br />
        <br />
        <asp:RegularExpressionValidator ID="emailRV" 
            runat="server" 
            ControlToValidate="txtSendToEm" 
            ErrorMessage="Invalid Email Address!" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            style="color: #FF0000" ForeColor="#FFFF66">
        </asp:RegularExpressionValidator>
        </asp:Panel>
        </div>

        <div style="display: flex; justify-content: center;">
            <asp:Panel ID="pnlConfirmTransfer" runat="server" Visible="False" class="w3-panel w3-pale-blue w3-display-container w3-round" Width="450px">
                <br />
                <asp:Label ID="lblConfirmTransfer" runat="server" Text="" style="display: flex; justify-content: center;"></asp:Label><br />

                <div style="display: flex; justify-content: center;">
                    <asp:Button ID="btnBack" runat="server" Text="No" class="w3-button w3-light-grey w3-round" style="height: 35px;" postBackUrl="~/Transaction.aspx"/>&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnConfirm" runat="server" Text="Yes" OnClick="btnConfirm_Click" class="w3-button w3-blue w3-round" style="height: 35px;"/>
                </div>
                <br />
            </asp:Panel>
        </div>
        

   </div>

    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />

</asp:Content>
