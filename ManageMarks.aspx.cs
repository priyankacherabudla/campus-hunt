using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CampusHunt.Utilities;
using System.Drawing;


namespace CampusHunt
{
    public partial class ManageMarks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindSubject();
            }

        }

        private void bindSubject()
        {
            try
            {
                DBHelper objHepler = new DBHelper("GetFacultySubject", true);
                objHepler.AddParameters("@FacultyId", Session["UserId"]);
                DataTable dtFacSubject = objHepler.ResultantTable;
                objHepler.FillDataTable();
                ddlSubject.DataSource = dtFacSubject;
                ddlSubject.DataValueField = "SubjectId";
                ddlSubject.DataTextField = "Subject";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, "--Select--");
                ddlSubject.SelectedIndex = 0;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSubject.SelectedIndex > 0)
            {
                DBHelper objHepler = new DBHelper("GetSubjectStudent", true);
                objHepler.AddParameters("@SubjectId", ddlSubject.SelectedValue);
                DataTable dtStudent = objHepler.ResultantTable;
                objHepler.FillDataTable();
                ddlStudent.DataSource = dtStudent;
                ddlStudent.DataValueField = "UserId";
                ddlStudent.DataTextField = "UserName";
                ddlStudent.DataBind();
                ddlStudent.Items.Insert(0, "--Select--");
                ddlStudent.SelectedIndex = 0;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBHelper objConnection = new DBHelper("InsertMarks_proc", false);

            objConnection.OpenConnection();
            objConnection.AddParameters("@SubjectId",ddlSubject.SelectedValue);
            objConnection.AddParameters("@Marks", txtMarks.Text);
            objConnection.AddParameters("@StudentId", ddlStudent.SelectedValue);
            objConnection.AddParameters("@GivenBy", Session["UserId"]);
            objConnection.AddParameters("@description", txtDescription.Text);        

            int success = objConnection.ExecuteNonQuery();
            objConnection.CloseConnection();
        }
    }
}