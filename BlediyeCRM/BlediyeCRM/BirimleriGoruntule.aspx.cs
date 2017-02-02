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
                if(Request.QueryString["BELEDIYE_ID"]==null)
                Response.Redirect("Belediyeleri_Goruntule.aspx");

              
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
            if (e.CommandName =="GORUSME")
            {
                if (Session["YETKILI"].ToString() == "2")
                {
                    Label2.ForeColor = Color.Red;
                    Label2.Text = "Yetkiniz bulunmamaktadır.";
                    ModalPopupExtender1.Show();
                }
                else
                Response.Redirect("Gorusmeleri_Goruntule.aspx?BIRIM_ID=" + (e.CommandArgument) + "&BELEDIYE_ID=" + (Request.QueryString["BELEDIYE_ID"]));
             //   Response.Redirect("Gorusme_Ekle.aspx?BELEDIYE_ID=" + Convert.ToInt32(e.CommandName) + "&BIRIM_ID=" + Convert.ToInt32(e.CommandArgument));
                 
            }

            if (e.CommandName == "DETAY")
            {
                Response.Redirect("Birim_Ekle.aspx?BIRIM_GUNCELLE=1&BIRIM_ID=" + e.CommandArgument + "&BELEDIYE_ID=" + Request.QueryString["BELEDIYE_ID"]);
            }

            if (e.CommandName == "SIL")
            {
                DB a = new DB();
                if (a.BirimSil(Convert.ToInt32(e.CommandArgument),0) == 1)
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

        protected void btnYeniBirimEkle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Birim_Ekle.aspx?BELEDIYE_ID=" + Convert.ToInt32(Request.QueryString["BELEDIYE_ID"]));
        }

        protected void rptBIRIMLER_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
             
        }

        
  

    }
}