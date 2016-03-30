using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusHunt.Utilities;
using System.Data;
using System.Data.SqlClient;

namespace CampusHunt
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DBHelper objConnection = new DBHelper("ValidateUser_prc", false);
            try
            {

                objConnection.OpenConnection();
                objConnection.AddParameters("@Email", txtemail.Text);
                objConnection.AddParameters("@Password", txtpassword.Text);
                objConnection.ExecuteReader();
                SqlDataReader dr = objConnection.DataReader;
                if (dr.Read())
                {
                    //string empid = dr[0].ToString();
                    //string rid = dr[1].ToString();
                    Session["UserId"] = dr[0].ToString();
                    Session["RoleId"] = dr[1].ToString();
                    string id = Session["RoleId"].ToString();
                    if (id == "1")
                    {
                        Response.Redirect("admin.aspx");
                    }
                    else if (id == "2")
                    {
                        Response.Redirect("faculty.aspx");
                    }
                    else if (id == "3")
                    {
                        Response.Redirect("student.aspx");
                    }


                }
                else
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "type3", "<script>alert('Invalid Username/password')</script>");
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                objConnection.CloseConnection();
            }
        }
    }
}