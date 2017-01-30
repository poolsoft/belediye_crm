using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM.pages
{
    public partial class BirimleriGoruntule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BirimleriCek();
            }
        }

        protected void btnGorusmeEkle_Click(object sender, EventArgs e)
        {

        }

        public void BirimleriCek()
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.BirimleriGetir(Convert.ToInt32(Request.QueryString["BELEDIYE_ID"]));
                rptBIRIMLER.DataSource = dr;
                rptBIRIMLER.DataBind();
            }
            catch (Exception ex)
            {
                lblMesaj.ForeColor = Color.Red;
                lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
            }
        }

        protected void rptBIRIMLER_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "BIRIM")
            {
                Response.Redirect("Gorusme_Ekle.aspx?BELEDIYE_ID=" + Convert.ToUInt32(e.CommandArgument)+"&BIRIM_ID="+Convert.ToInt32(Label1.Text));
            }

            if (e.CommandName == "DETAY")
            {
                Response.Redirect("Belediye_Ekle.aspx?BELEDIYE_GUNCELLE=1&BELEDIYE_ID=" + e.CommandArgument);
            }

            if (e.CommandName == "SIL")
            {
                DB a = new DB();
                if (a.BelediyeSil(Convert.ToInt32(e.CommandArgument)) == 1)
                {
                    lblMesaj.ForeColor = Color.Green;
                    lblMesaj.Text = "Silindi.";
                    BirimleriCek();
                }
                else
                {
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
                }

            }
        }

    }
}