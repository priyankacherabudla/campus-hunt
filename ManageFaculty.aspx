<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true"
    CodeBehind="ManageFaculty.aspx.cs" Inherits="CampusHunt.ManageFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblModId" runat="server" Text="Name"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlFaculty" runat="server" CssClass="csddl" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlFaculty_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*"
                    ControlToValidate="ddlFaculty" ErrorMessage="Select Faculty" InitialValue="--Select--"></asp:RequiredFieldValidator>
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
                <asp:TextBox ID="txtEmail" runat="server" CssClass="cstxt"></asp:TextBox>
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
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                    ControlToValidate="ddlDept" ErrorMessage="Select Department" InitialValue="--Select--"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="csbuttons" OnClick="btnSubmit_Click" />
            </td>
            <td align="left">
                <asp:Button ID="btnCancel" CausesValidation="false" runat="server" Text="Cancel"
                    CssClass="csbuttons" />
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false"
                    ShowMessageBox="true" />
            </td>
        </tr>
    </table>
</asp:Content>
