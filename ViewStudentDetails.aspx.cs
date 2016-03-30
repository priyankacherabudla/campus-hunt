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
    public partial class ViewStudentDetails : System.Web.UI.Page
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
        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDept.SelectedIndex > 0 && ddlSemester.SelectedIndex > 0)
            {
                DBHelper objHepler = new DBHelper("GetSemesterStudents_proc", true);
                objHepler.AddParameters("@SemesterId", ddlSemester.SelectedValue);
                objHepler.AddParameters("@DeptId", ddlDept.SelectedValue);
                DataTable dtSemesterStudents = objHepler.ResultantTable;
                objHepler.FillDataTable();
                gvStudentDetails.DataSource = dtSemesterStudents;
                gvStudentDetails.DataBind();
            }
        }

        protected void lnkName_Click(object sender, EventArgs e)
        {
            LinkButton lnknn = sender as LinkButton;
            int id =Convert.ToInt32(lnknn.CommandArgument);
            DBHelper objHepler = new DBHelper("GetStudentDetails_proc", true);
            objHepler.AddParameters("@UserId", id);
            DataTable dtStudent = objHepler.ResultantTable;
            objHepler.FillDataTable();
            txtStudentName.Text = dtStudent.Rows[0]["UserName"].ToString();
            txtEmail.Text = dtStudent.Rows[0]["EmailId"].ToString();
            txtPhoneNO.Text = dtStudent.Rows[0]["PhoneNo"].ToString();
            ModalPopupExtender1.Show();
        }
    }
}