<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="My_EWallet.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%--    <h3 style="color: #FFFFFF">My Statement of Account</h3>
    <hr />
    <br />--%>

    <style type="text/css">
        .tabTitle{
            text-align:center;
            color:azure;
        }
    </style>

    <div class="w3-container">

        <div class="w3-row">
            <a href="javascript:void(0)" onclick="openTab(event, 'Wallet');">
            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding tabTitle">Wallet</div>
            </a>
            <a href="javascript:void(0)" onclick="openTab(event, 'Rewards');">
            <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding tabTitle">Rewards</div>
            </a>
            <a href="javascript:void(0)" onclick="openTab(event, 'Activity');">
        <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding tabTitle">Activity</div>
            </a>
        </div>

        <%-- Wallet --%>
        <div id="Wallet" class="w3-container tab" style="display:none">
                <br />
                <br />
                <br />
           <div class="balance-div" style="display: flex; justify-content: center;">
                <asp:Panel ID="pnlBalance" runat="server" visible="true" class="w3-panel w3-white w3-round-xlarge w3-padding-24" Width="300px" Height="150px">
                    <h3 style="padding: 10px; color: #142850; font-weight: bold; justify-content: space-around; text-align:center; "><sup>Php</sup> <%Response.Write(Session["bal"]);%> &nbsp;&nbsp;<asp:Button ID="btnDep" runat="server" class="w3-button w3-circle w3-black plusBn" Text="+" PostBackUrl="~/Deposit.aspx" /></h3>
                    <h6 style="text-align:center;">Current Balance</h6>
                <br />
                </asp:Panel>
             <br />
          </div>
        </div>

        <%-- Rewards --%>
        <div id="Rewards" class="w3-container tab" style="display:none">
                <br />
                <br />
                <br />
            <div style="display: flex; justify-content: center;">
                <p style="font-weight:600; color:white; height:35px;">Discover E-Wallet rewards and view your saved offers here.</p> 
            </div>
           
        </div>

        <%-- Activity --%>
        <div id="Activity" class="w3-container tab" style="display:none">


            <asp:Button ID="btnViewHistory" runat="server" Text="Custom" OnClick="btnViewHistory_Click" />



            <br />
            <br />
                <div style="display: flex; justify-content: center;">
                    <asp:GridView ID="myAccountGV" runat="server"
                        Width="800px"
                        OnSelectedIndexChanged="myAccountGV_SelectedIndexChanged" 
                        AutoGenerateColumns="False">

                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID"/>
                            <asp:BoundField DataField="TYPE" HeaderText="TYPE"/>
                            <asp:BoundField DataField="TDATE" HeaderText="DATE"/>
                            <asp:BoundField DataField="AMT" HeaderText="AMOUNT"/>
                            <asp:BoundField DataField="SENDTO" HeaderText="RECIPIENT"/>
                        </Columns>

                         <AlternatingRowStyle BackColor="White" />
                         <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                         <HeaderStyle BackColor="#06283D" Font-Bold="True" ForeColor="White"/>
                         <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                         <RowStyle BackColor="#E8F6EF" ForeColor="#333333" />
                         <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                         <SortedAscendingCellStyle BackColor="#FDF5AC" />
                         <SortedAscendingHeaderStyle BackColor="#4D0000" />
                         <SortedDescendingCellStyle BackColor="#FCF6C0" />
                         <SortedDescendingHeaderStyle BackColor="#820000" />

                    </asp:GridView>
                <br />
               </div>
        </div>




    </div>




    <%--<asp:Button ID="btnView" runat="server" Text="View Activity" OnClick="btnView_Click"/>&nbsp;&nbsp;&nbsp; --%>
    <%--<asp:Button ID="btnCustom" runat="server" Text="Custom" OnClick="btnCustom_Click" />--%>

    
    <%--
    <div class="panel-div" style="display: flex; justify-content: center;">
    <asp:Panel ID="pnlSearchs" runat="server">
        <br />

        <asp:Label ID="lblStartDate" runat="server" Text="Start: " ForeColor="White"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="txtStartDate"  runat="server" type="date" Width="200px" Text="" OnTextChanged="txtStartDate_TextChanged" ></asp:TextBox>
         &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblEndDate" runat="server" Text="End: " ForeColor="White"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="txtEndDate" runat="server" type="date" Width="200px" Text="" OnTextChanged="txtEndDate_TextChanged" ></asp:TextBox>

        <br />
    </asp:Panel>
    </div> --%>



    <script type="text/javascript">
        function openTab(evt, tabName) {
            var i, x, tablinks;
            x = document.getElementsByClassName("tab");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < x.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" w3-border-blue-gray", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.firstElementChild.className += " w3-border-blue-gray";
        }
    </script>

    <br />
    <br />   
    <br />
    <br />
    <br />   
    <br />
</asp:Content>
