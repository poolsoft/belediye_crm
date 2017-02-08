using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM
{
    public partial class Anasayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["YETKILI"].ToString() == "0")
                {
                    Response.Redirect("Default.aspx");

                }

                BelediyeAdet();
            }
        }


        public void BelediyeAdet()
        {

            DB a = new DB(); 
            lblBelAdet.Text = "" + a.BelediyeAdet();
            lblBirimAdet.Text = "" + a.BirimAdet();
            lblGorusme.Text = "" + a.GorusmeAdet();


        }

        protected void rptUcGun_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rptUcGun_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }



    }
}