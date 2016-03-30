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
    public partial class ViewMarks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindMarks();
            }
        }

        private void bindMarks()
        {
            DBHelper objHepler = new DBHelper("ViewMarks_proc", true);
            objHepler.AddParameters("@StudentId",Session["UserId"]);           
            DataTable dtMarks = objHepler.ResultantTable;
            objHepler.FillDataTable();
            gvMarks.DataSource = dtMarks;
            gvMarks.DataBind();
        }
    }
}