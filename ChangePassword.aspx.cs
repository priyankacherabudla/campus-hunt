using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CampusHunt.Utilities;

namespace CampusHunt
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBHelper objConnection = new DBHelper("changepassword", false);

            objConnection.OpenConnection();
            objConnection.AddParameters("@userid", Session["UserId"]);
            objConnection.AddParameters("@Oldpassword", txtOldPwd.Text);
            objConnection.AddParameters("@Newpassword", txtNewPwd.Text);


            int success = objConnection.ExecuteNonQuery();
            objConnection.CloseConnection();
        }

    }
}