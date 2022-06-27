<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="My_EWallet.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3 style="color: #FFFFFF">My Statement of Account</h3>
    <hr />
    <br />

    <div class="balance-div" style="display: flex; justify-content: center;">
            <asp:Panel ID="pnlBalance" runat="server" class="w3-panel w3-white w3-round-xlarge" Width="270px" Height="70px">
                <h3 style="padding: 10px; color: #142850; font-weight: bold; justify-content: space-around;">Balance: <%Response.Write(Session["bal"]);%> </h3>
            </asp:Panel>
            <br />
    </div>
            
    <br />

    <asp:Button ID="btnView" runat="server" Text="View Activity" OnClick="btnView_Click"/>&nbsp;&nbsp;&nbsp; 
    <asp:Button ID="btnCustom" runat="server" Text="Custom" OnClick="btnCustom_Click" />
    <br />
    <br />
    
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
    </div>

    <div style="display: flex; justify-content: center;">
        <asp:GridView ID="myAccountGV" runat="server"
            Width="800px" Visible="False" 
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

    <br /><br />

</asp:Content>
