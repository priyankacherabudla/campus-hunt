<%@ Page Title="" Language="C#" MasterPageFile="~/CampusHunt.Master" AutoEventWireup="true" CodeBehind="CollegeTree.aspx.cs" Inherits="CampusHunt.CollegeTree" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:TreeView ID="treeviwExample"  runat="server" ImageSet="Arrows">
            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
            <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />            
        </asp:TreeView>

</asp:Content>
