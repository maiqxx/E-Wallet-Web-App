<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="My_EWallet.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 30%;">
        <tr>
            <td style="width:10px;s"><asp:LinkButton ID="lnkBtnBack" runat="server" PostBackUrl="~/Admin.aspx" CssClass="fa-inverse" style="font-size: smaller"><<</asp:LinkButton></td>
            <td style="width:250px"><h4 style="color: #FFFFFF"> Manage Registered Users</h4></td>
        </tr>
        
    </table>
    <hr />

    <div class="w3-bar">
        <button class="w3-button w3-round-large w3-blue-gray w3-right" id="btnSearch" runat="server">Search</button> &nbsp;&nbsp;&nbsp;<input id="txtSearchBar" class="w3-input w3-border w3-round w3-right" type="search" placeholder="Search here..." style="width:250px;"/>
    </div>
    <br />

    
    <asp:GridView ID="usersGV" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="ID" ShowHeaderWhenEmpty="True"
                GridLines="None" Height="405px" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="16px"
                OnRowCommand="usersGV_RowCommand"
                OnRowEditing="usersGV_RowEditing" 
                OnRowCancelingEdit="usersGV_RowCancelingEdit"
                OnRowDeleting="usersGV_RowDeleting"
                OnRowUpdating="usersGV_RowUpdating" ForeColor="Black" style="margin-left: 0px; color: #000000; font-size: small;" >
             
                <%-- Theme Properties --%>
             <AlternatingRowStyle BackColor="White" />
             <FooterStyle BackColor="#06283D" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#06283D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"/>
             <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
             <RowStyle BackColor="#E8F6EF" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
             <SortedAscendingCellStyle BackColor="#FDF5AC" />
             <SortedAscendingHeaderStyle BackColor="#4D0000" />
             <SortedDescendingCellStyle BackColor="#FCF6C0" />
             <SortedDescendingHeaderStyle BackColor="#820000" />

                 <Columns>                  
                     <%-- ID --%>
                    <asp:TemplateField HeaderText="User ID"> 
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("ID") %>' runat="server" Width="100px" Font-Size="Small"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtIdNumber" Text='<%# Eval("ID") %>' runat="server" Width="100px" Font-Size="Small"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtIdNumberFooter" runat="server" Width="100px" Font-Size="Small"/>
                        </FooterTemplate>                      
                    </asp:TemplateField>

                     <%-- Last Name --%>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("lname") %>' runat="server" Width="150px" Font-Size="Small"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" Text='<%# Eval("lname") %>' runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLastNameFooter" runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

			        <%-- First Name --%>
                   <asp:TemplateField HeaderText="First Name"> 
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("fname") %>' runat="server" Width="150px" Font-Size="Small"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" Text='<%# Eval("fname") %>' runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFirstNameFooter" runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </FooterTemplate>
                     </asp:TemplateField>

			        <%-- Email --%>
                   <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("email") %>' runat="server" Width="200px" Font-Size="X-Small"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" Text='<%# Eval("email") %>' runat="server" Width="200px" Font-Size="X-Small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEmailFooter" runat="server" Width="200px" Font-Size="Small"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

         		    <%-- Birth Date --%>
                   <asp:TemplateField HeaderText="Date of Birth"> 
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("bdate") %>' runat="server" Width="150px" Font-Size="Small"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDOB" Text='<%# Eval("bdate") %>' runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDOBFooter" runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

			        <%-- User Name --%>
                   <asp:TemplateField HeaderText="Username">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("usrname") %>' runat="server" Width="150px" Font-Size="Small"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUserName" Text='<%# Eval("usrname") %>' runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtUserNameFooter" runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </FooterTemplate>
                   </asp:TemplateField>

			        <%-- Balance --%>
                   <asp:TemplateField HeaderText="Balance">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("balance") %>' runat="server" Width="150px" Font-Size="Small"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBalance" Text='<%# Eval("balance") %>' runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBalanceFooter" runat="server" Width="150px" Font-Size="Small"></asp:TextBox>
                        </FooterTemplate>
                  </asp:TemplateField>

                     <%-- Command Buttons --%>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit" Width="70px" Height="30px"/>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" ToolTip="Delete" Width="70px" Height="30px" OnClientClick ="return confirm('Are you sure you want to delete this user?');"/>  
                </ItemTemplate>
                <ItemStyle Width ="40%"/>

                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" ToolTip="Update" Width="70px" Height="30px"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Cancel" Width="70px" Height="30px"/> 
                </EditItemTemplate>

                <FooterTemplate>
                    <asp:Button ID="btnAddNew" runat="server" ForeColor="Black" Text="Add" CommandName="AddNew" ToolTip="Add New User" Width="70px" Height="30px"/>
                </FooterTemplate>
                
            </asp:TemplateField>

                 </Columns>
                 
                </asp:GridView>
                <br />

                <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>


</asp:Content>
