using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM
{
    public partial class MASTER : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblAdSoyad.Text = "" + Session["ADSOYAD"];

                if (Session["YETKILI"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    if (Session["YETKILI"].ToString() == "1")
                    {
                        Panel.Visible = true;
                        Gorusme.Visible = true;
                    }
                    else
                    {
                        Panel.Visible = false;
                        Gorusme.Visible = false;
                    }
                }       
                
            }
        }

        protected void grtl_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("");
        }
    }
}