using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusHunt
{
    public partial class CampusHunt : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RoleId"] != null)
            {

                if (Session["RoleId"].ToString() == "1")
                {
                    lnkLogout.Visible = true;
                    lnkLogin.Visible = false;
                    pnladmin.Visible = true;
                    pnlfaculty.Visible = false;
                    pnlStudent.Visible = false;
                }
                else if (Session["RoleId"].ToString() == "2")
                {
                    lnkLogout.Visible = true;
                    lnkLogin.Visible = false;
                    pnladmin.Visible = false;
                    pnlfaculty.Visible = true;
                    pnlStudent.Visible = false;
                }
                else if (Session["RoleId"].ToString() == "3")
                {
                    lnkLogout.Visible = true;
                    lnkLogin.Visible = false;
                    pnladmin.Visible = false;
                    pnlfaculty.Visible = false;
                    pnlStudent.Visible = true;
                }
            }
            else
            {
                lnkLogout.Visible = false;
                lnkLogin.Visible = true;
                pnladmin.Visible = false;
                pnlfaculty.Visible = false;
                pnlStudent.Visible = false;
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("Home.aspx");
        }
    }
}