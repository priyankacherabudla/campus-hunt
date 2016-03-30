<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true" CodeBehind="ViewStudentDetails.aspx.cs" Inherits="CampusHunt.ViewStudentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
<tr><td><asp:Label ID="lblDept" runat="server" Text="Department"></asp:Label> </td><td> <asp:DropDownList ID="ddlDept" runat="server"></asp:DropDownList></td></tr>
<tr><td> <asp:Label ID="Label4" runat="server" Text="Semester"></asp:Label></td><td>  
    <asp:DropDownList ID="ddlSemester" runat="server" AutoPostBack="True" onselectedindexchanged="ddlSemester_SelectedIndexChanged" 
                      >
                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="8" Value="8"></asp:ListItem>                   
                    </asp:DropDownList> </td></tr>
<tr><td></td><td></td></tr>
</table>

<asp:GridView ID="gvStudentDetails" runat="server" AutoGenerateColumns="false">
<Columns>
<asp:TemplateField HeaderText="Name">
<ItemTemplate>
<asp:LinkButton ID="lnkName" runat="server" Text='<%# Bind("UserName") %>' CommandArgument='<%# Bind("UserId") %>' OnClick="lnkName_Click"></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>

<asp:Panel ID="pnlModal" runat="server" BackColor="AliceBlue" BorderStyle="Solid" BorderWidth="2px" Height="250px" Width="350px"  >
  <div style="padding:100px 120px 20px 80px">
<table>
<tr><td ><asp:Label ID="lblmpnl" runat="server" Text="Name" ForeColor="Green"></asp:Label></td>
<td><asp:TextBox ID="txtStudentName" runat="server" Enabled="false" ></asp:TextBox></td></tr>
<tr><td ><asp:Label ID="Label1" runat="server" Text="Email" ForeColor="Green"></asp:Label></td>
<td><asp:TextBox ID="txtEmail" runat="server" Enabled="false"></asp:TextBox></td></tr>
<tr><td ><asp:Label ID="Label2" runat="server" Text="PhoneNo" ForeColor="Green"></asp:Label></td>
<td><asp:TextBox ID="txtPhoneNO" runat="server" Enabled="false"></asp:TextBox></td></tr>

        <tr><td colspan="2" align="center"><asp:Button ID="btnCancel" runat="server" Text="Canel" BackColor="Green" /></td></tr>
</table>
</div>
</asp:Panel>
<aj1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btndummy" PopupControlID="pnlModal" CancelControlID="btnCancel" >
    </aj1:ModalPopupExtender> 
    
    <asp:Button ID="btndummy" runat="server" style="display:none" />

</asp:Content>
