<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true" CodeBehind="ManageDept.aspx.cs" Inherits="CampusHunt.ManageDept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table ID="tbleditprofile" runat="server"  cellpadding="2" 
            cellspacing="0" 
            style="height: 281px; width: 412px; margin-left: 1px; margin-top: 0px;border-style:solid; border-width: 2px">
            <tr>
                <td style="width: 329px">
                    Select Department</td>
                <td style="width: 209px">
                    <asp:DropDownList ID="ddlDept" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlDept_SelectedIndexChanged"       >
                                      
                    </asp:DropDownList>
                    <br />
                </td>
                <td style="width: 11px">
                    &nbsp;</td>
            </tr>           
            <tr>
                <td align="center" style="width: 329px">
                    Department
                    <br />
                </td>
                <td style="width: 209px">
                    <asp:TextBox ID="txtDept" runat="server" Enabled="False"></asp:TextBox>
                    
                </td>
                <td style="width: 11px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtDept" ErrorMessage="Enter Department">*</asp:RequiredFieldValidator>
                </td>
            </tr>                              
         
            <tr>
                <td align="center" colspan="3">
                    
                    <asp:Button ID="btnUpdate" runat="server" BackColor="#FF9900" 
                         style="margin-left: 0px" Text="Save" Width="69px" onclick="btnUpdate_Click" 
                        />
                    <asp:Button ID="btnCancel" runat="server" BackColor="#FF9900" 
                        CausesValidation="False"  Text="Cancel"  />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        ShowMessageBox="True" ShowSummary="False" />
                    <asp:Label ID="lblmessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>
