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
    public partial class AssignSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAllDept();
            }
        }

        private void BindAllDept()
        {
            try
            {
                DBHelper objHepler = new DBHelper("GetAllDept_proc", true);
                DataTable dtLeaveType = objHepler.ResultantTable;
                objHepler.FillDataTable();
                ddlDept.DataSource = dtLeaveType;
                ddlDept.DataValueField = "DeptId";
                ddlDept.DataTextField = "Department";
                ddlDept.DataBind();
                ddlDept.Items.Insert(0, "--Select--");
                ddlDept.SelectedIndex = 0;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDept.SelectedIndex > 0)
            {
                DBHelper objHepler = new DBHelper("GetDepartmentFaculty_proc", true);
                objHepler.AddParameters("@Deptid", ddlDept.SelectedValue);
                DataTable dtFaculty = objHepler.ResultantTable;
                objHepler.FillDataTable();
                ddlFaculty.DataSource = dtFaculty;
                ddlFaculty.DataValueField = "UserId";
                ddlFaculty.DataTextField = "UserName";
                ddlFaculty.DataBind();
                ddlFaculty.Items.Insert(0, "--Select--");
                ddlFaculty.SelectedIndex = 0;
            }
        }

        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDept.SelectedIndex > 0 && ddlSemester.SelectedIndex > 0)
            {
                DBHelper objHepler = new DBHelper("GetSemesterSubjects_proc", true);
                objHepler.AddParameters("@DeptId",ddlDept.SelectedValue);
                objHepler.AddParameters("@SemesterId", ddlSemester.SelectedValue);
                DataTable dtSubject = objHepler.ResultantTable;
                objHepler.FillDataTable();
                chklstSubject.DataSource = dtSubject;
                chklstSubject.DataTextField = "Subject";
                chklstSubject.DataValueField = "SubjectId";
                chklstSubject.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBHelper objConnection = new DBHelper("ManageAssignSubject_proc", false);
          
            
        
            foreach (ListItem li in chklstSubject.Items)
            {
                objConnection.OpenConnection();
                objConnection.AddParameters("@FacultyId", ddlFaculty.SelectedValue);
                if (li.Selected)
                {
                    objConnection.AddParameters("@SubjectId",li.Value);
                    objConnection.AddParameters("@assing", 1);

                }
                else
                {
                    objConnection.AddParameters("@SubjectId", li.Value);
                    objConnection.AddParameters("@unassign", 1);
                }
                int success = objConnection.ExecuteNonQuery();
                objConnection.CloseConnection();
                objConnection.RemoveParameters();
            }       
           
   

           
        }

        protected void ddlFaculty_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBHelper objHepler = new DBHelper("GetFacultySubject", true);
            objHepler.AddParameters("@FacultyId", ddlFaculty.SelectedValue);
            DataTable dtFacSubject = objHepler.ResultantTable;
            objHepler.FillDataTable();
            foreach (ListItem li in chklstSubject.Items)
            {
                li.Selected = false;
            }

            foreach (DataRow dr in dtFacSubject.Rows)
            {
                foreach (ListItem li in chklstSubject.Items)
                {
                    if (li.Value.ToString() == dr[0].ToString())
                    {
                        li.Selected = true;
                    }

                }
            }
        }
    }
}