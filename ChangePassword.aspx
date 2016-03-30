<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="CampusHunt.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="currentPassword"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOldPwd" runat="server" CssClass="cstxt" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Oldpassword"
                    ControlToValidate="txtOldPwd" Text="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="NewPassword"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNewPwd" runat="server" CssClass="cstxt" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Newpassword"
                    ControlToValidate="txtNewPwd" Text="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="csbuttons" OnClick="btnSubmit_Click" />
            </td>
            <td align="left">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false"
                    CssClass="csbuttons" />
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false"
                    ShowMessageBox="true" />
            </td>
        </tr>
    </table>
</asp:Content>
