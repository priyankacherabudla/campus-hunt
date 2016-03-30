<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true"
    CodeBehind="ManageStudents.aspx.cs" Inherits="CampusHunt.ManageStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblModId" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlStudent" runat="server" CssClass="csddl" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlStudent"
                    ErrorMessage="Select Student" Text="*" InitialValue="--Select--"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="cstxt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName"
                    Text="*" ErrorMessage="Enter name"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" Text="*" runat="server" CssClass="cstxt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email"
                    Text="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid emailid"
                    ControlToValidate="txtEmail" Text="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Phoneno"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPhoneno" runat="server" CssClass="cstxt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter PhoneNo"
                    ControlToValidate="txtPhoneno" Text="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Department"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDept" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Semester"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSemester" runat="server" AutoPostBack="True">
                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*"
                    ControlToValidate="ddlSemester" ErrorMessage="Select Semester" InitialValue="--Select--"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="csbuttons" OnClick="btnSubmit_Click" />
            </td>
            <td align="left">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="csbuttons" CausesValidation="False" />
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false"
                    ShowMessageBox="true" />
            </td>
        </tr>
    </table>
</asp:Content>
