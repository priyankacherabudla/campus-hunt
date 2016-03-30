using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CampusHunt
{
    public partial class CollegeTree : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTreeViewControl();
            }
        }

        private void BindTreeViewControl()
        {
            try
            {
                DataSet ds = GetDataSet("Select SubjectId,Subject,tbl_Dept.DeptId,Department from tbl_Subject inner join tbl_Dept on tbl_Dept.DeptId=tbl_Subject.DeptId");
                //DataRow[] Rows = ds.Tables[0].Select("DeptId IS NOT NULL");
                // Get all parents nodes
                DataTable dtDidtrinct = ds.Tables[0].DefaultView.ToTable("Didtinct", true, "DeptId","Department");
                DataRow[] Rows = dtDidtrinct.Select("DeptId IS NOT NULL");
                for (int i = 0; i < Rows.Length; i++)
                {
                    TreeNode root = new TreeNode(Rows[i]["Department"].ToString(), Rows[i]["DeptId"].ToString());
                    root.SelectAction = TreeNodeSelectAction.Expand;
                    CreateNode(root, ds.Tables[0]);
                    
                    treeviwExample.Nodes.Add(root);
                   //  i= i + 1;
                }
            }
            catch (Exception Ex) { throw Ex; }
        }

        public void CreateNode(TreeNode node, DataTable Dt)
        {
            DataRow[] Rows = Dt.Select("DeptId =" + node.Value);
            if (Rows.Length == 0) { return; }
            for (int i = 0; i < Rows.Length; i++)
            {
                TreeNode Childnode = new TreeNode(Rows[i]["Subject"].ToString(), Rows[i]["SubjectId"].ToString());
                Childnode.SelectAction = TreeNodeSelectAction.Expand;
                node.ChildNodes.Add(Childnode);
                //CreateNode(Childnode, Dt);
            }
        }

        private DataSet GetDataSet(string Query)
        {
            DataSet Ds = new DataSet();
            try
            {
               // string strCon = @"Data Source=CHAITANYA-EMP\\SQLEXPRESS;Initial Catalog=CampusHunt;Integrated Security=True";
                SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["CHConnectionString"].ConnectionString);
                SqlDataAdapter Da = new SqlDataAdapter(Query, Con);
                Da.Fill(Ds);
            }
            catch (Exception) { }
            return Ds;
        }
    }
}