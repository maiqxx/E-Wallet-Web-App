<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAccount.aspx.cs" Inherits="My_EWallet.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style type="text/css">

        .profile-pic-div{
            float: left; 
            width:45%; 
            height:500px;

        }
        .user-info-div{
            float:right;
            width:45%;
            height: 500px;

        }
        .lbl-style{
            color:#FFFFFF;
        }
        .profile-panel{
            background-image: linear-gradient(-225deg, #FFFEFF 0%, #D7FFFE 100%);
            width:500px;
            height:450px;
        }
        .textbox-style{
            width:350px;
            height:45px;
        }
        img {
            border-radius: 50%;
            display: flex; 
            justify-content: center;
        }
        .username-div{
            display: flex; 
            justify-content: center;
            
        }
        .email-div{
            display: flex; 
            justify-content: center;
        }
    </style>
     



    <table style="width: 30%;">
        <tr>
            <br />
            <td style="width:10px;s"><asp:LinkButton ID="lnkBtnBack" runat="server" PostBackUrl="~/Admin.aspx" CssClass="fa-inverse" style="font-size: smaller"><<</asp:LinkButton></td>
            <td style="width:250px"><h4 style="color: #FFFFFF">My Account</h4></td>
        </tr>
    </table>
    <hr />
    <br />


    
    <%-- My layout here --%>
    <%-- Profile Picture Division --%>
    <div class="profile-pic-div">
        <asp:Panel ID="pnlProfilePic" runat="server" class="w3-panel w3-round-xlarge w3-padding-24 profile-panel">
            <div style="display: flex; justify-content: center;">
                <img src="Images/Icons/userIcon.png" alt="Avatar" style="width:200px">
            </div>
            <br />
            <div class="username-div">
                <h5 style="font-weight:400; "><%Response.Write(Session["username"]);%></h5>
            </div>
            <div class="email-div">
                 <h6 style="font-weight:300;"><%Response.Write(Session["email"]);%></h6>
            </div>
        </asp:Panel>
    </div>

     <%-- Admin Info Division --%>
     <div class="user-info-div">
         <asp:Panel ID="Panel1" runat="server">
             <br />
            <table style="width: 100%;">

                <%-- lastname --%>
                <tr>
                    <td class="lbl-style ">Lastname</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtLastname" runat="server" class="w3-input w3-border w3-round-large textbox-style"></asp:TextBox>
                    </td>
                </tr>          

                <%-- firstname --%>
                <tr>
                    <td class="lbl-style">Firstname</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtFirstname" runat="server" class="w3-input w3-border w3-round-large textbox-style"></asp:TextBox>
                    </td>
                </tr>

                <%-- email --%>
                <tr>
                    <td class="lbl-style">Email</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" class="w3-input w3-border w3-round-large prevent-select email textbox-style"></asp:TextBox>
                    </td>
                </tr>

                <%-- bdate --%>
                <tr>
                    <td class="lbl-style">Date Of Birth</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtDOB" runat="server" class="w3-input w3-border w3-round-large textbox-style" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>

                <%-- username --%>
                <tr>
                    <td class="lbl-style">Username</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" class="w3-input w3-border w3-round-large textbox-style"></asp:TextBox>
                    </td>
                </tr>

                 <%-- password --%>
                <tr>
                    <td class="lbl-style">Password</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" class="w3-input w3-border w3-round-large textbox-style"></asp:TextBox>
                       <%-- &nbsp; &nbsp; &nbsp;
                        <asp:CheckBox ID="cbSeePass" runat="server" />--%>
                    </td>
                </tr>

            </table>
             <br />
             <asp:Button ID="Button1" runat="server" Text="Update Profile" OnClick="btnUpdate_Click" class="w3-button w3-blue w3-round-large" OnClientClick ="return confirm('Are you sure you want to make some changes?');"/>
             <br />
             <asp:Label ID="lblSuccess" runat="server" Text="" ForeColor="Green"></asp:Label>
         </asp:Panel>
     </div>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    
    <script type="text/javascript">
        function disableTxt() {
            document.getElementById("txtEmail").disabled = true;
        }
    </script>


</asp:Content>
