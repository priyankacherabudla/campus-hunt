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
    public partial class ManageSubject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindAllDept();
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
            if (ddlSemester.SelectedIndex > 0 && ddlDept.SelectedIndex > 0)
            {
                DBHelper objHepler = new DBHelper("GetAllSubject_proc", true);
                objHepler.AddParameters("@DeptId", ddlDept.SelectedValue);
                objHepler.AddParameters("@Semester", ddlSemester.SelectedValue);
                DataTable dtSubject = objHepler.ResultantTable;
                objHepler.FillDataTable();
                ddlSubject.DataSource = dtSubject;
                ddlSubject.DataValueField = "SubjectId";
                ddlSubject.DataTextField = "Subject";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, "--Select--");
                ddlSubject.Items.Add(new ListItem("Create new", "new"));
                ddlSubject.SelectedIndex = 0;
            }
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlSubject.SelectedIndex > 0 && ddlSubject.SelectedValue != "new")
                {
                    txtSubject.Enabled = true;
                    txtSubject.Text = ddlSubject.SelectedItem.ToString();

                }
                else if (ddlSubject.SelectedValue == "new")
                {
                    txtSubject.Enabled = true;
                    txtSubject.Text = "";

                }
                else
                {
                    txtSubject.Text = string.Empty;
                    txtSubject.Enabled = false;

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
                    lblmessage.Text = "There was an error, please try again";
                    lblmessage.ForeColor = Color.Red;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                DBHelper objConnection = new DBHelper("InsertUpdateSubject_proc", false);
                if (txtSubject.Text != string.Empty)
                {
                    objConnection.OpenConnection();
                    objConnection.AddParameters("@Subject", txtSubject.Text);
                    objConnection.AddParameters("@DeptId",ddlDept.SelectedValue);
                    objConnection.AddParameters("@Semester",ddlSemester.SelectedValue);
                    if (ddlSubject.SelectedIndex > 0 && ddlSubject.SelectedValue != "new")
                    {

                        objConnection.AddParameters("@SubjectId", ddlSubject.SelectedValue);

                    }
                    else if (ddlDept.SelectedValue == "new")
                    {
                        //   objConnection.AddParameters("@LeaveTypeId", 0);

                    }
                    else
                    {
                        lblmessage.Text = "There was an error, Try again";
                        lblmessage.ForeColor = Color.Red;
                    }
                    int success = objConnection.ExecuteNonQuery();
                    if (success > 0)
                    {
                        lblmessage.Text = "Saved Successfully";
                        lblmessage.ForeColor = Color.Green;
                        txtSubject.Text = string.Empty;

                       
                    }
                    else
                    {
                        lblmessage.Text = "There was an error, Try again";
                        lblmessage.ForeColor = Color.Red;
                    }

                }
                else
                {
                    lblmessage.Text = "Select Group";
                    lblmessage.ForeColor = Color.Red;
                }
            }

            catch (Exception ex)
            {
                if (ex.Message.Contains("Violation of PRIMARY KEY constraint"))
                {
                    lblmessage.Text = "Donor Alreary Registered";
                    lblmessage.ForeColor = Color.Red;
                }
                else if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblmessage.Text = "Donor Alreary Registered";
                    lblmessage.ForeColor = Color.Red;
                }

                else if (ex.Message.Contains("Object reference"))
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblmessage.Text = "There was an error, please try again";
                    lblmessage.ForeColor = Color.Red;
                }
            }
        }

       
    }
}