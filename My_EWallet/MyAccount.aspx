<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="My_EWallet.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">

        .dropdown-div{
            float: right;
            height:150px;
            width: 100%;

        }
        .gridview-div{
            float:left;
            height: 500px;
            width: 100%;
        }

    </style>

    <h3 style="color: #FFFFFF">My Statement of Account</h3>
    <hr />
    <br />


    <div class="balance-div" style="display: flex; justify-content: center;">
        <asp:Panel ID="pnlBalance" runat="server" visible="true" class="w3-panel w3-white w3-round-xlarge w3-padding-24" Width="300px" Height="150px">
                <h3 style="padding: 10px; color: #142850; font-weight: bold; justify-content: space-around; text-align:center; "><sup>Php</sup> <%Response.Write(Session["bal"]);%> &nbsp;&nbsp;<asp:Button ID="btnDep" runat="server" class="w3-button w3-circle w3-black plusBn" Text="+" PostBackUrl="~/Deposit.aspx" /></h3>
                <h6 style="text-align:center;">Current Balance</h6>
                <br />
                <br />
          </asp:Panel>
             <br />
    </div>
                <div class= "dropdown-div">
                    <asp:ImageButton ID="btnViewHistory" runat="server" Text="Filter" OnClick="btnViewHistory_Click" width="35px" Height="35px"  CssClass=" w3-right" ImageUrl="~/Images/Icons/search.png" ToolTip="Filter Activity"/>
                    <asp:DropDownList ID="ddlTransactType" runat="server" OnSelectedIndexChanged="ddlTransactType_SelectedIndexChanged" CssClass="w3-input w3-border w3-round w3-right" Width="200px" ForeColor="#000000">
                        <asp:ListItem Value="D">Deposits</asp:ListItem>  
                        <asp:ListItem Value="W">Withdrawals</asp:ListItem>
                        <asp:ListItem Value="S">Send Money</asp:ListItem>  
                </asp:DropDownList>
                   &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </div>

                <div style="display: flex; justify-content: center;" class="gridview-div ">
                    <asp:GridView ID="myAccountGV" runat="server"
                        Width="1000px"
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



    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
