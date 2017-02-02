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
    public partial class Gorusme_Ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               

                if (Session["YETKILI"].ToString() == "2")
                {
                    Response.Redirect("Belediyeleri_Goruntule.aspx");
                }

                if (Request.QueryString["BELEDIYE_ID"] == null)
                    Response.Redirect("Belediyeleri_Goruntule.aspx");

                if (Request.QueryString["GORUSME_GUNCELLE"] == "1")
                {
                    txtGorusme.Enabled = false;
                    txtHatirlatmaTarihi.Enabled = false;
                    txtSonDurum.Enabled = false;
                    txtGorusmeNotlari.Enabled = false;
                    imgPopup.Enabled = false;

                    btnDuzenle.Visible = true;
                    btnKaydet.Text = "Güncelle";
                    btnKaydet.Visible = false;
                    btnIptal.Visible = false;
                    Gorusme_Getir(Convert.ToInt32(Request.QueryString["GORUSME_ID"]));
                }


            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            lblMesaj.Visible = false;

            if (Request.QueryString["GORUSME_GUNCELLE"] == "1")
            {
                try
                {

                    DB a = new DB();
                    SqlConnection con = null;
                    SqlCommand cmd = null;
                    con = new SqlConnection((a.ConnectionBelediye()));
                    cmd = new SqlCommand("UPDATE [dbo].[GORUSMELER] SET  [GORUSME_KONUSU]='" + txtGorusme.Text.Trim().Replace("'", "`") + "',[HATIRLATMA_TARIHI]='" + txtHatirlatmaTarihi.Text.Trim().Replace("'", "`") + "', [SON_DURUMU]='" + txtSonDurum.Text.Trim().Replace("'", "`") + "',[GORUSME_NOTLARI]='" + txtGorusmeNotlari.Text.Trim().Replace("'", "`") + "'  where GORUSME_ID= " + Convert.ToInt32(Request.QueryString["GORUSME_ID"]), con);

                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                       // lblMesaj.Visible = true;
                        Label1.Text = "Görüşme başarıyla güncellendi.";
                        lblMesaj.Text = "Görüşme başarıyla güncellendi.";
                        ModalPopupExtender2.Show();
                        Gorusme_Getir(Convert.ToInt32(Request.QueryString["GORUSME_ID"]));
                        btnDuzenle.Visible = true;
                        btnIptal.Visible = false;
                        btnKaydet.Visible = false;
                      
                        imgPopup.Enabled = false;

                        txtGorusme.Enabled = false;
                        txtHatirlatmaTarihi.Enabled = false;
                        txtSonDurum.Enabled = false;
                        txtGorusmeNotlari.Enabled = false;
                    }
                    else
                    {

                       // lblMesaj.Visible = true;
                        Label1.Text = "Güncelleme sırasında hata oluştu.";
                        lblMesaj.Text = "Güncelleme sırasında hata oluştu.";
                        ModalPopupExtender2.Show();

                    }
                    con.Close();

                }
                catch (Exception ex)
                {
                    //lblMesaj.Visible = true;
                    lblMesaj.ForeColor = Color.Red;
                    Label1.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    ModalPopupExtender2.Show();
                }
            }
            else
            {

                try
                {
                    DB a = new DB();
                    SqlConnection con = null;
                    SqlCommand cmd = null;
                    con = new SqlConnection((a.ConnectionBelediye()));
                    cmd = new SqlCommand("INSERT INTO [dbo].[GORUSMELER] ([BIRIM_ID],[GORUSME_KONUSU],[HATIRLATMA_TARIHI]," +
                                       "[SON_DURUMU],[GORUSME_NOTLARI],[KULLANICI_ADI],[KAYIT_ZAMANI],[BELEDIYE_ID])" +
                                       "  VALUES(@BIRIM_ID,@GORUSME_KONUSU,@HATIRLATMA_TARIHI,@SON_DURUMU, @GORUSME_NOTLARI,@KULLANICI_ADI,@KAYIT_ZAMANI,@BELEDIYE_ID )", con);

                    cmd.Parameters.AddWithValue("@BIRIM_ID", "" + Convert.ToInt32(Request.QueryString["BIRIM_ID"]));
                    cmd.Parameters.AddWithValue("@BELEDIYE_ID", "" + Convert.ToInt32(Request.QueryString["BELEDIYE_ID"]));

                    cmd.Parameters.AddWithValue("@GORUSME_KONUSU", "" + txtGorusme.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@HATIRLATMA_TARIHI", "" + txtHatirlatmaTarihi.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@SON_DURUMU", "" + txtSonDurum.Text.Trim().Replace("'", "`"));

                    cmd.Parameters.AddWithValue("@GORUSME_NOTLARI", "" + txtGorusmeNotlari.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@KULLANICI_ADI", "" + Session["ADSOYAD"]);
                    cmd.Parameters.AddWithValue("@KAYIT_ZAMANI", " " + DateTime.Now);
                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                      //lblMesaj.Visible = true;
                        Label1.Text = "Görüşme başarıyla kaydedildi.";
                        lblMesaj.Text = "Görüşme başarıyla kaydedildi.";
                        ModalPopupExtender2.Show();


                        txtGorusme.Text = "";
                        txtHatirlatmaTarihi.Text = "";
                        txtSonDurum.Text = "";
                        txtGorusmeNotlari.Text = "";

                    }
                    else
                    {
                      // lblMesaj.Visible = true;
                        Label1.Text = "Kaydetme sırasında hata oluştu.";
                        lblMesaj.Text = "Kaydetme sırasında hata oluştu.";
                        ModalPopupExtender2.Show();

                    }
                    con.Close();

                }
                catch (Exception ex)
                {
                     //lblMesaj.Visible = true;
                    lblMesaj.ForeColor = Color.Red;
                    Label1.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    ModalPopupExtender2.Show();
                }
            }
        }

        public void Gorusme_Getir(int GORUSME_ID)
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.GorusmeGetir(GORUSME_ID);
                dr.Read();
                if (dr.HasRows)
                {

                    txtGorusme.Text = "" + dr["GORUSME_KONUSU"];
                    txtHatirlatmaTarihi.Text = "" + dr["HATIRLATMA_TARIHI"];
                    txtSonDurum.Text = "" + dr["SON_DURUMU"];
                    txtGorusmeNotlari.Text = "" + dr["GORUSME_NOTLARI"];
                    txtGORUSMEYI_YAPAN_KISI.Text = "" + dr["KULLANICI_ADI"];
                    txtTARIH.Text = "" + dr["KAYIT_ZAMANI"];

                }
                 
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            btnDuzenle.Visible = false;
            btnKaydet.Visible = true;
            btnIptal.Visible = true;

            txtGorusme.Enabled = true;
            txtHatirlatmaTarihi.Enabled = true;
            txtSonDurum.Enabled = true;
            txtGorusmeNotlari.Enabled = true;
            imgPopup.Enabled = true;

        }

        protected void btnIptal_Click(object sender, EventArgs e)
        {
            btnDuzenle.Visible = true;
            btnKaydet.Visible = false;
            btnIptal.Visible = false;

            txtGorusme.Enabled = false;
            txtHatirlatmaTarihi.Enabled = false;
            txtSonDurum.Enabled = false;
            txtGorusmeNotlari.Enabled = false;
            imgPopup.Enabled = false;
        }









    }
}