using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM.pages
{
    public partial class Belediyeleri_Goruntule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LOADING();

                lblMesaj.Text = "";
            }

        }



        protected void rptYAPI_ItemCommand(object source, RepeaterCommandEventArgs e)
        {


            if (e.CommandName == "BIRIM")
            {
                Response.Redirect("BirimleriGoruntule.aspx?BELEDIYE_ID=" + Convert.ToUInt32(e.CommandArgument));

            }




            if (e.CommandName == "DETAY")
            {
                Response.Redirect("Belediye_Ekle.aspx?BELEDIYE_GUNCELLE=1&BELEDIYE_ID=" + e.CommandArgument);
            }




            if (e.CommandName == "SIL")
            {
                DB a = new DB();
                try
                {
                    SqlDataReader dr = a.BelediyeGetirID(Convert.ToInt32(e.CommandArgument));
                    dr.Read();
                    if (dr.HasRows)
                    { 
                        SqlConnection con = null;
                        SqlCommand cmd = null;
                        con = new SqlConnection((a.ConnectionBelediye()));
                        cmd = new SqlCommand("INSERT INTO [dbo].[SILINEN_BELEDIYELER] ([IL],[ILCE],[BELEDIYE_ADI], " +
                                           " [BELEDIYE_BASKANI_ADI], " +
                                           "  [KULLANICI_ADI],[SILME_TARIHI] )  VALUES(@IL,@ILCE,@BELEDIYE_ADI,@BELEDIYE_BASKANI_ADI,@KULLANICI_ADI,@SILME_TARIHI )", con);

                        cmd.Parameters.AddWithValue("@IL", "" +dr["IL"]);
                        cmd.Parameters.AddWithValue("@ILCE", "" + dr["ILCE"]);
                        cmd.Parameters.AddWithValue("@BELEDIYE_ADI", "" + dr["BELEDIYE"]);
                        cmd.Parameters.AddWithValue("@BELEDIYE_BASKANI_ADI", "" + dr["BELEDIYE_BASKANI_ADI"]); 
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


                if (a.BelediyeSil(Convert.ToInt32(e.CommandArgument)) == 1)
                {
                    lblMesaj.ForeColor = Color.Green;
                    lblMesaj.Text = "Silindi.";
                    LOADING();
                }
                else
                {
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
                }

            }
        }

        public void LOADING()
        {

            BelediyeCek();
        }

        public void BelediyeCek()
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.BelediyeGetir();
                rptBELEDIYE.DataSource = dr;
                rptBELEDIYE.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnYeniBelediyeEkle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Belediye_Ekle.aspx");
        }


        protected void btnKaydet_Click(object sender, EventArgs e)
        {

        }

        protected void btnBirimEkle_Click(object sender, EventArgs e)
        {

        }

        protected void rptBELEDIYE_Load(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "waitingDialog.show();setTimeout(function () {waitingDialog.hide();}, 5000);", true);
        }

        protected void rptBELEDIYE_Init(object sender, EventArgs e)
        {

        }

        protected void rptBELEDIYE_DataBinding(object sender, EventArgs e)
        {

        }

        protected void rptBELEDIYE_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "waitingDialog.show();setTimeout(function () {waitingDialog.hide();}, 5000);", true);
        }








    }
}