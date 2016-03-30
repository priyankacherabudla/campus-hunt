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
    public partial class ManageStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAllDept();
                BindAllStudent();
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



        private void BindAllStudent()
        {
            try
            {
                DBHelper objHepler = new DBHelper("GetAllStudent_proc", true);
                DataTable dtLeaveType = objHepler.ResultantTable;
                objHepler.FillDataTable();
                ddlStudent.DataSource = dtLeaveType;
                ddlStudent.DataValueField = "UserId";
                ddlStudent.DataTextField = "UserName";
                ddlStudent.DataBind();
                ddlStudent.Items.Insert(0, "--Select--");
                ddlStudent.Items.Add(new ListItem("Create new", "new"));
                ddlStudent.SelectedIndex = 0;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
        
        
        
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBHelper objConnection = new DBHelper("InsertUpdateUser_proc", false);

            objConnection.OpenConnection();
            objConnection.AddParameters("@UserName", txtName.Text);
            objConnection.AddParameters("@EmailId", txtEmail.Text);
            objConnection.AddParameters("@PhoneNo", txtPhoneno.Text);
            objConnection.AddParameters("@RoleId", 3);
            objConnection.AddParameters("@DeptId", ddlDept.SelectedValue);
            objConnection.AddParameters("@SemesterId", ddlSemester.SelectedValue);
            if (ddlStudent.SelectedIndex > 0 && ddlStudent.SelectedValue != "new")
            {
                objConnection.AddParameters("@UserId", ddlStudent.SelectedValue);
            }

            int success = objConnection.ExecuteNonQuery();
            objConnection.CloseConnection();
        }

        protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlStudent.SelectedIndex > 0 && ddlStudent.SelectedValue != "new")
                {
                    DBHelper objHepler = new DBHelper("GetStudentDetails_proc", true);
                    objHepler.AddParameters("@UserId", ddlStudent.SelectedValue);
                    DataTable dtEmp = objHepler.ResultantTable;
                    objHepler.FillDataTable();

                    txtName.Text = dtEmp.Rows[0]["UserName"].ToString();
                    txtPhoneno.Text = dtEmp.Rows[0]["PhoneNo"].ToString();
                    txtEmail.Text = dtEmp.Rows[0]["EmailId"].ToString();
                    ddlDept.SelectedValue = dtEmp.Rows[0]["DeptId"].ToString();
                    ddlSemester.SelectedValue = dtEmp.Rows[0]["SemesterId"].ToString();

                }
                else if (ddlStudent.SelectedValue == "new")
                {
                    txtName.Text = string.Empty;
                    txtPhoneno.Text = string.Empty;
                    ddlDept.SelectedIndex = 0;
                    txtEmail.Text = string.Empty;

                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Object reference"))
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                  //  lblmessage.Text = "There was an error, please try again";
                   // lblmessage.ForeColor = Color.Red;
                }
            }
        }
    }
}