<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="My_EWallet.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 style="color: #FFFFFF">Log In</h3>
    <hr />
    <br />
    <br />

    <div runat="server">

        <table style="width:100%;" runat="server" id="tblLogin">
            <tr runat="server">
                <td style="padding: 10px; width: 515px;" class="text-right" runat="server"><strong style="color: #FFFFFF">Email Address</strong></td>
                <td style="padding: 10px; width: 700px;" runat="server">
                    <asp:TextBox ID="txtEmail" runat="server" Width="250px" class="w3-input w3-border w3-round"></asp:TextBox>
                </td>
                <td style="padding: 10px" runat="server">&nbsp;</td>
            </tr>
            <tr runat="server">
                <td style="padding: 10px; height: 56px; width: 515px;" class="text-right" runat="server"><strong style="color: #FFFFFF">Password</strong></td>
                <td style="padding: 10px; width: 700px; height: 56px;" runat="server">
                    <asp:TextBox ID="txtPswd" runat="server"  Width="250px" TextMode="Password" class="w3-input w3-border w3-round"></asp:TextBox>
                </td>
                <td style="padding: 10px; height: 56px;" runat="server"></td>
            </tr>
            <tr runat="server">
                <td style="padding: 10px; width: 515px;" runat="server" class="text-right">
                    <asp:HyperLink ID="hpCreateAccount" runat="server" ForeColor="#0099FF" NavigateUrl="~/CreateAccount.aspx">Create Account</asp:HyperLink>
                </td>
                <td style="padding: 10px; width: 700px;" runat="server" class="text-justify">
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" class="w3-button w3-blue w3-round" OnClick="btnLogin_Click" />
                </td>
                <td style="padding: 10px" runat="server">&nbsp;</td>
            </tr>
        </table>
    </div>

    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />


</asp:Content>
