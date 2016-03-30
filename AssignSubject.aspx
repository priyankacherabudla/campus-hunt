<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true"
    CodeBehind="AssignSubject.aspx.cs" Inherits="CampusHunt.AssignSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDept" runat="server" CssClass="csddl" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
   
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Semester"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSemester" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged">
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
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Subject"></asp:Label>
            </td>
            <td>
                <asp:CheckBoxList ID="chklstSubject" runat="server" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
             <tr>
            <td>
                <asp:Label ID="lblModId" runat="server" Text="Faculty"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlFaculty" runat="server" CssClass="csddl" AutoPostBack="true" OnSelectedIndexChanged="ddlFaculty_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="csbuttons" OnClick="btnSubmit_Click" />
            </td>
            <td align="left">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="csbuttons" />
            </td>
        </tr>
    </table>
</asp:Content>
