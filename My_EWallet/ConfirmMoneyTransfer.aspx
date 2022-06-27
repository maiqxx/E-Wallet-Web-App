<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfirmMoneyTransfer.aspx.cs" Inherits="My_EWallet.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 style="color: #FFFFFF">Send Money</h3>
    <hr />
    <br />

    <div>
        <asp:Panel ID="pnlTransferConfirm" runat="server">

            <table style="width: 80%;">
                <tr>
                    <td>
                        <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:TextBox ID="txtConfirmPass" runat="server"></asp:TextBox>

                    </td>

                </tr>

                <tr>
                    <td>
                        <asp:Button ID="btnConfirmPass" runat="server" Text="Confirm" onClick="btnConfirmPass_Click"/>
                    </td>
                </tr>
            </table>







        </asp:Panel>



    </div>




</asp:Content>
