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
    public partial class ManageFaculty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAllDept();
                BindAllFaculty();
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


        private void BindAllFaculty()
        {
            try
            {
                DBHelper objHepler = new DBHelper("GetAllFaculty_proc", true);
                DataTable dtLeaveType = objHepler.ResultantTable;
                objHepler.FillDataTable();
                ddlFaculty.DataSource = dtLeaveType;
                ddlFaculty.DataValueField = "UserId";
                ddlFaculty.DataTextField = "UserName";
                ddlFaculty.DataBind();
                ddlFaculty.Items.Insert(0, "--Select--");
                ddlFaculty.Items.Add(new ListItem("Create new", "new"));
                ddlFaculty.SelectedIndex = 0;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void ddlFaculty_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlFaculty.SelectedIndex > 0 && ddlFaculty.SelectedValue != "new")
                {
                    DBHelper objHepler = new DBHelper("GetStudentDetails_proc", true);
                    objHepler.AddParameters("@UserId", ddlFaculty.SelectedValue);
                    DataTable dtEmp = objHepler.ResultantTable;
                    objHepler.FillDataTable();

                    txtName.Text = dtEmp.Rows[0]["UserName"].ToString();
                    txtPhoneno.Text = dtEmp.Rows[0]["PhoneNo"].ToString();
                    txtEmail.Text = dtEmp.Rows[0]["EmailId"].ToString();
                    ddlDept.SelectedValue = dtEmp.Rows[0]["DeptId"].ToString();
                  

                }
                else if (ddlFaculty.SelectedValue == "new")
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBHelper objConnection = new DBHelper("InsertUpdateUser_proc", false);

            objConnection.OpenConnection();
            objConnection.AddParameters("@UserName", txtName.Text);
            objConnection.AddParameters("@EmailId", txtEmail.Text);
            objConnection.AddParameters("@PhoneNo", txtPhoneno.Text);
            objConnection.AddParameters("@RoleId", 2);
            objConnection.AddParameters("@DeptId", ddlDept.SelectedValue);
         
            if (ddlFaculty.SelectedIndex > 0 && ddlFaculty.SelectedValue != "new")
            {
                objConnection.AddParameters("@UserId", ddlFaculty.SelectedValue);
            }

            int success = objConnection.ExecuteNonQuery();
            objConnection.CloseConnection();
        }


    }
}