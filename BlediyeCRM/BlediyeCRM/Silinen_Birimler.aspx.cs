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
    public partial class Silinen_Birimler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["YETKILI"] == null)
                Response.Redirect("Belediyeleri_Goruntule.aspx");

            if (Session["YETKILI"].ToString() == "2")
            {
                Response.Redirect("Belediyeleri_Goruntule.aspx");
            }

            if (!IsPostBack)
            {
                silinen_Birimler();
            }

        }

        public void silinen_Birimler()
        {
            DB a = new DB();
            SqlDataReader dr = a.SilinenBirimleriGetir();
            rptBELEDIYE.DataSource = dr;
            rptBELEDIYE.DataBind();
        }

        protected void rptBELEDIYE_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SIL")
            {


                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Evet")
                {
                    DB a = new DB();
                    int b = a.SilinenBirimSil(Convert.ToInt32(e.CommandArgument));
                    if (b > -1)
                    {
                        Label1.Visible = true;
                        Label1.ForeColor = Color.Green;
                        Label1.Text = "Silindi";
                        silinen_Birimler();
                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.ForeColor = Color.Green;
                        Label1.Text = "İnternet bağlantınızı kontrol ediniz.";
                    }

                }
                else
                { }


            }
        }
    }
}