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
        int TUM;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["BELEDIYE_ID"] == null)
                {
                    TUM = 1;

                    geri.Visible = false;
                    BirimleriCekHepsi();

                    if (TUM == 1)
                    {
                        foreach (RepeaterItem item in rptBIRIMLER.Items)
                        {
                            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                            {
                                var lbl = (Button)item.FindControl("btnGorusmeEkle");
                                lbl.Visible = false;
                            }
                        }
                    }

                }
                else
                {
                    TUM = 0;
                    BirimleriCek();
                }
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
        public void BirimleriCekHepsi()
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.BirimleriGetirHespi();
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
            if (e.CommandName == "GORUSME")
            {


                if (Session["YETKILI"].ToString() == "2")
                {
                    Label2.ForeColor = Color.Red;
                    Label2.Text = "Yetkiniz bulunmamaktadır.";
                    ModalPopupExtender1.Show();
                }
                else
                {
                    DB a = new DB();
                    int BELEDIYE_ID = a.BirimBelediyeID(Convert.ToInt32(e.CommandArgument));
                    Response.Redirect("Gorusmeleri_Goruntule.aspx?BIRIM_ID=" + (e.CommandArgument) + "&BELEDIYE_ID=" + BELEDIYE_ID);
                }

            }

            if (e.CommandName == "DETAY")
            {
                DB a = new DB();
                int BELEDIYE_ID = a.BirimBelediyeID(Convert.ToInt32(e.CommandArgument));
                Response.Redirect("Birim_Ekle.aspx?BIRIM_GUNCELLE=1&BIRIM_ID=" + e.CommandArgument + "&BELEDIYE_ID=" + BELEDIYE_ID);
            }

            if (e.CommandName == "SIL")
            {

                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Evet")
                {

                    DB a = new DB();

                    try
                    {
                        SqlDataReader dr = a.BirimGetir(Convert.ToInt32(e.CommandArgument));
                        dr.Read();
                        if (dr.HasRows)
                        {
                            SqlConnection con = null;
                            SqlCommand cmd = null;
                            con = new SqlConnection((a.ConnectionBelediye()));
                            cmd = new SqlCommand("INSERT INTO [dbo].[SILINEN_BIRIMLER] ([BIRIM_ADI],[YETKILI_ADI],[MAIL], " +
                                               "  [KULLANICI_ADI],[SILME_TARIHI] )  VALUES(@BIRIM_ADI,@YETKILI_ADI,@MAIL ,@KULLANICI_ADI,@SILME_TARIHI )", con);

                            cmd.Parameters.AddWithValue("@BIRIM_ADI", "" + dr["BIRIM_ADI"]);
                            cmd.Parameters.AddWithValue("@YETKILI_ADI", "" + dr["YETKILI_ADI"]);
                            cmd.Parameters.AddWithValue("@MAIL", "" + dr["MAIL"]);
                            cmd.Parameters.AddWithValue("@KULLANICI_ADI", "" + Session["ADSOYAD"]);
                            cmd.Parameters.AddWithValue("@SILME_TARIHI", " " + DateTime.Now);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();

                        }
                    }
                    catch (Exception ex)
                    {
                        lblMesaj.ForeColor = Color.Red;
                        lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";

                    }


                    if (a.BirimSil(Convert.ToInt32(e.CommandArgument), 0) == 1)
                    {
                        lblMesaj.ForeColor = Color.Green;
                        lblMesaj.Text = "Silindi.";
                        if (Request.QueryString["BELEDIYE_ID"] == null)
                            BirimleriCekHepsi();
                        else if (TUM == 0)
                            BirimleriCek();
                    }
                    else
                    {
                        lblMesaj.ForeColor = Color.Red;
                        lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
                    }

                }
                else
                {

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