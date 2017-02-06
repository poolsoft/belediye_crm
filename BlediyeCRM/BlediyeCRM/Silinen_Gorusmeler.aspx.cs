using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM
{
    public partial class Silinen_Gorusmeler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["YETKILI"]==null)
                Response.Redirect("Belediyeleri_Goruntule.aspx");

            if (Session["YETKILI"].ToString() == "2")
            {
                Response.Redirect("Belediyeleri_Goruntule.aspx");
            }

            if (!IsPostBack)
            {
                silinen_Gorusmeler();
            }

        }

        protected void rptBELEDIYE_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SIL")
            {
                DB a = new DB();
                int b = a.SilinenGorusmeSil(Convert.ToInt32(e.CommandArgument));
                if (b > -1)
                {
                    Label1.Visible = true;
                    Label1.ForeColor = Color.Green;
                    Label1.Text = "Silindi";
                    silinen_Gorusmeler();
                }
                else
                {
                    Label1.Visible = true;
                    Label1.ForeColor = Color.Green;
                    Label1.Text = "İnternet bağlantınızı kontrol ediniz.";
                }
            }
        }

        protected void rptBELEDIYE_DataBinding(object sender, EventArgs e)
        {

        }

        protected void rptBELEDIYE_Init(object sender, EventArgs e)
        {

        }

        protected void rptBELEDIYE_Load(object sender, EventArgs e)
        {

        }

        protected void rptBELEDIYE_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        public void silinen_Gorusmeler()
        {
            DB a = new DB();
            SqlDataReader dr = a.SilinenGorusmeleriGetir();
            rptBELEDIYE.DataSource = dr;
            rptBELEDIYE.DataBind();
        }


    }
}