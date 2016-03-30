<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true" CodeBehind="ManageSubject.aspx.cs" Inherits="CampusHunt.ManageSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table ID="tbleditprofile" runat="server"  cellpadding="2" 
            cellspacing="0" 
            style="height: 281px; width: 412px; margin-left: 1px; margin-top: 0px;border-style:solid; border-width: 2px">
            <tr>
                <td style="width: 329px">
                    <asp:Label ID="lblRegistration" runat="server" Font-Bold="True" 
                        Text="Select Department" Font-Size="Small" ForeColor="#FF6600"></asp:Label>
                </td>
                <td style="width: 209px">
                    <asp:DropDownList ID="ddlDept" runat="server"  
                        >
                                      
                    </asp:DropDownList>
                    <br />
                </td>
                <td style="width: 11px">
                    &nbsp;</td>
            </tr>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtage" ErrorMessage="Enter Age"></asp:RequiredFieldValidator>--%>
            <tr>
                <td align="center" style="width: 329px">
                    <asp:Label ID="lblAspiration" runat="server" Text="Semester"></asp:Label>
                    <br />
                </td>
                <td style="width: 209px">
                    <asp:DropDownList ID="ddlSemester" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlSemester_SelectedIndexChanged">
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
                <td style="width: 11px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="ddlSemester" ErrorMessage="select semester" InitialValue="--Select--">*</asp:RequiredFieldValidator>
                </td>
            </tr>
              <tr>
                <td align="center" style="width: 329px">
                    <asp:Label ID="Label1" runat="server" Text="Subject"></asp:Label>
                    <br />
                </td>
                <td style="width: 209px">
                    <asp:DropDownList ID="ddlSubject" runat="server" AutoPostBack="true"
                        onselectedindexchanged="ddlSubject_SelectedIndexChanged">
                                
                    </asp:DropDownList>
                    
                </td>
                <td style="width: 11px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="ddlSubject" ErrorMessage="select semester" InitialValue="--Select--">*</asp:RequiredFieldValidator>
                </td>
            </tr>                
         <tr>
                <td align="center" style="width: 329px">
                    <asp:Label ID="lblMaxleave" runat="server" Text="Subject Name"></asp:Label>
                    <br />
                </td>
                <td style="width: 209px">
                    <asp:TextBox ID="txtSubject" runat="server" Enabled="False"></asp:TextBox>
                    
                </td>
                <td style="width: 11px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtSubject" ErrorMessage="Enter Subject">*</asp:RequiredFieldValidator>
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
