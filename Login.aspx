<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CampusHunt.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
<tr>
<td> EmailId       
</td>
<td> <asp:TextBox ID="txtemail" runat="server" class="input_field"></asp:TextBox>
<asp:RequiredFieldValidator
    ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter UserName" ControlToValidate="txtemail" Text="*"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td><label>Password</label>
</td>
<td>  <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" class="input_field"></asp:TextBox>
<asp:RequiredFieldValidator
    ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtpassword" Text="*"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>

<td colspan="2" align="center">
  <asp:Button ID="btnLogin" runat="server" Text="Login" onclick="btnLogin_Click" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false"/>
</td>
</tr>

</table>
</asp:Content>
