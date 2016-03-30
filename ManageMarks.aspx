<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true"
    CodeBehind="ManageMarks.aspx.cs" Inherits="CampusHunt.ManageMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Subjects"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="csddl" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                    ControlToValidate="ddlSubject" ErrorMessage="Select Subject" InitialValue="--Select--"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblModId" runat="server" Text="Students"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlStudent" runat="server" CssClass="csddl">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*"
                    ControlToValidate="ddlStudent" ErrorMessage="Select Student" InitialValue="--Select--"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Marks"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMarks" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Marks"
                    ControlToValidate="txtMarks" Text="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Description"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Description"
                    ControlToValidate="txtDescription" Text="*"></asp:RequiredFieldValidator>
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
