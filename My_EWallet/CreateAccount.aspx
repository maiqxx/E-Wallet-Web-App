<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="My_EWallet.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 style="color: #FFFFFF">Create Account</h3>
    <hr />
    <br />
    <div>
        <div class="w3-panel w3-pale-green">
            <asp:Label ID="lblInBal" runat="server" Text="" foreColor="#00cc00"></asp:Label>
        </div>
    <table style="margin: auto; padding: 5px; width: 100%; line-height: inherit; display: inline-table;" align="middle" runat="server">
              
        <tr runat="server">
            <td  runat="server" style="color: #FFFFFF;" class="text-right"><strong>Lastname</strong></td>
            <td  runat="server" class="modal-sm" style="padding: 10px; width: 137px; height: 44px;">
            <asp:TextBox ID="txtLname" runat="server" style="margin-left: 0" Width="255px" Text="" class="w3-input w3-border w3-round"></asp:TextBox>
            </td>
            <td  runat="server" style="color: #FFFF00;">
            <asp:RequiredFieldValidator ID="rfvLname" runat="server" ErrorMessage="* Lastname is Required" ControlToValidate="txtLname" style="color: #FF0000" ForeColor="#FFFF66"></asp:RequiredFieldValidator>
            </td>
            <td  runat="server" style="padding: 10px; height: 44px;">
            </td>
        </tr>
       

        <tr runat="server">
            <td runat="server" style="color: #FFFFFF;" class="text-right"><strong>Firstname</strong> </td>
            <td  runat="server" style="padding: 10px; width: 137px;" class="modal-sm">
            <asp:TextBox ID="txtFname" runat="server" Width="255px" Text="" class="w3-input w3-border w3-round"></asp:TextBox>
            </td>
            <td runat="server" style="color: #FFFF00;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="* Firstname is Required" style="color: #FF0000" ForeColor="#FFFF66"></asp:RequiredFieldValidator>
            </td>
            <td runat="server" style="padding: 10px;">
                &nbsp;</td>
        </tr>
  

        <tr runat="server">
            <td runat="server" style="color: #FFFFFF;" class="text-right"><strong>Email Address</strong></td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 137px;">
                <asp:TextBox ID="txtEmail" runat="server" Width="255px" class="w3-input w3-border w3-round"></asp:TextBox>
            </td>
            <td runat="server" style="color: #FFFF00;">
                <asp:RegularExpressionValidator ID="emailRV" runat="server" ControlToValidate="txtEmail" ErrorMessage="* Invalid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="color: #FF0000" ForeColor="#FFFF66"></asp:RegularExpressionValidator>
            </td>
            <td runat="server" style="padding: 10px;">
                &nbsp;</td>
        </tr>


        <tr runat="server">
            <td runat="server" style="color: #FFFFFF;" class="text-right"><strong>Birth Date</strong></td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 137px;">
            <asp:TextBox ID="txtbdate" runat="server" type="date" Width="254px" Text="" OnTextChanged="txtbdate_TextChanged" class="w3-input w3-border w3-round"></asp:TextBox>

            </td>
            <td runat="server" style="color: #FFFF00;">&nbsp;</td>
            <td runat="server" style="padding: 10px">&nbsp;</td>
        </tr>


        <tr runat="server">
            <td runat="server" style="color: #FFFFFF;" class="text-right"><strong>Username</strong></td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 137px;">
            <asp:TextBox ID="txtusrn" runat="server" class="w3-input w3-border w3-round" Width="255px" Text="" OnTextChanged="txtusrn_TextChanged"></asp:TextBox>
            </td>
            <td runat="server" style="color: #FFFF00;">
                &nbsp;</td>
            <td runat="server" style="padding: 10px;">&nbsp;</td>
        </tr>


        <tr runat="server">
            <td runat="server" style="color: #FFFFFF;" class="text-right"><strong>Password</strong></td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 137px; height: 44px;">
            <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" class="w3-input w3-border w3-round" ValidationGroup="RegisterCheck" Width="255px" Text="" ></asp:TextBox>
            </td>
            <td runat="server" style="color: #FFFF00;" colspan="1">
            <asp:RegularExpressionValidator ID="valPassword" runat="server" ControlToValidate="txtpwd"
                ErrorMessage="Minimum password length is 8, must contain at least 1 digit, 1 alphabetic or special character, and must not contain any spaces. "
                ValidationExpression="^[A-Za-z\d]([a-zA-Z0-9@#$%^&+=*]{8,20})$"
                ValidationGroup="RegisterCheck" Display="Dynamic" Font-Italic="True" Font-Size="10px" ForeColor ="#FFFF66" Width="245px" Height="20px" CssClass="w3-text-red" />

            </td>
            <td runat="server" style="padding: 10px; height: 44px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd" ValidationGroup="RegisterCheck" ></asp:RequiredFieldValidator>
            </td>
        </tr>


        <tr runat="server">
            <td runat="server" style="color: #FFFFFF;" class="text-right"><strong>Confirm Password</strong></td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 137px; height: 44px;">
            <asp:TextBox ID="txtcpwd" runat="server" TextMode="Password" Width="255px" Text="" class="w3-input w3-border w3-round" OnTextChanged="txtcpwd_TextChanged"></asp:TextBox>
            </td>
            <td runat="server" style="color: #FFFF00;">
            <asp:CompareValidator ID="cvcpwd" runat="server" ErrorMessage="* Password did not match!" ControlToCompare="txtpwd" ControlToValidate="txtcpwd" style="color: #FF0000" ForeColor="#FFFF66"></asp:CompareValidator>
            </td>
            <td runat="server" style="padding: 10px; height: 44px;">
            </td>
        </tr>


        <tr runat="server">
            <td runat="server" style="color: #FFFFFF; padding:10px;" class="text-right"><strong>Choose a Role  </strong></td>
            <td runat="server" class="modal-sm" style="height: 11px; text-align: justify; padding-left:20px; width: 137px; padding-right: 15px; padding-top: 15px; padding-bottom: 15px;">
                    <strong>
                    <asp:RadioButtonList ID="rbtnRole" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnRole_SelectedIndexChanged" style="font-size: medium" Width="200px">  
                        <asp:ListItem style="color:white;" Value="Admin">Admin</asp:ListItem>  
                        <asp:ListItem style="color:white;" Value="User">User</asp:ListItem>  
                    </asp:RadioButtonList>
                    </strong>
            </td>
            <td runat="server" style="height: 11px;">
                <asp:RequiredFieldValidator ID="rfVRole" runat="server" ErrorMessage="* Please select your role." ControlToValidate="rbtnRole" style="color: #FF0000" ForeColor="#FFFF66"></asp:RequiredFieldValidator>
            </td>
            <td runat="server" style="height: 11px;">
            </td>
        </tr>

        <tr runat="server">
            <td runat="server" style="height: 11px; width: 1000px;" class="text-right"></td>
            <td runat="server" class="modal-sm" style="height: 11px; width: 137px;">
                <asp:Label ID="lblWarning" runat="server" style="color: #FF0000; font-size: small" Text="Label" Visible="False" ForeColor="#FFFF66"></asp:Label>
            </td>
            <td runat="server" style="height: 11px;">
                </td>
            <td runat="server" style="height: 11px;">
                </td>
        </tr>



        <tr runat="server">
            <td runat="server" style="padding: 10px; width: 1000px" class="text-right">
                <asp:HyperLink ID="hpLogIn" runat="server" CssClass="w3-medium" NavigateUrl="~/LogIn.aspx" style="color: #0099FF; font-size: small !important">Already have an account? Log In</asp:HyperLink>
            </td>
            <td runat="server" class="modal-sm" style="padding: 10px 15px 10px 10px; width: 137px; text-align: left;">
            <asp:Button ID="btn" runat="server" Text="Submit" class="w3-button w3-blue w3-round" OnClick="btn_Click" Width="255px" />
            </td>
            <td runat="server" style="padding: 10px; width: 666px;">&nbsp;</td>
            <td runat="server" style="padding: 10px">&nbsp;</td>
        </tr>
        </table>

        
    <br /><br />
    <br />
    </div>



    
</asp:Content>
