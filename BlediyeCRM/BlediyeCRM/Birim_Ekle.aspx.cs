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
    public partial class Birim_Ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["BELEDIYE_ID"] == null)
                {
                    Response.Redirect("Belediyeleri_Goruntule.aspx");
                }

                if (Request.QueryString["BIRIM_GUNCELLE"] == "1")
                {
                    txtBirimAdi.Enabled = false;
                    txtYetkiliAdi.Enabled = false;
                    txtGorevi.Enabled = false;
                    txtTelefon.Enabled = false;
                    txtDahili.Enabled = false;
                    txtGsm.Enabled = false;
                    txtEmail.Enabled = false;
                    txtNot.Enabled = false;

                    rdNumaratajVAR.Enabled = false;
                    rdNumaratajYOK.Enabled = false;
                    rdTabelaVAR.Enabled = false;
                    rdTabelaYOK.Enabled = false;
                    rdVAR.Enabled = false;
                    rdYOK.Enabled = false;
                    txtLisans.Enabled = false;
                  

                    btnDuzenle.Visible = true;
                    btnIptal.Visible = false;
                    btnKaydet.Visible = false;
                    btnKaydet.Text = "Güncelle";
                    Birim_Getir(Convert.ToInt32(Request.QueryString["BIRIM_ID"]));
                }

                else
                {
                    txtBirimAdi.Enabled = true;
                    txtYetkiliAdi.Enabled = true;
                    txtGorevi.Enabled = true;
                    txtTelefon.Enabled = true;
                    txtDahili.Enabled = true;
                    txtGsm.Enabled = true;
                    txtEmail.Enabled = true;
                    txtNot.Enabled = true;

                    rdNumaratajVAR.Enabled = true;
                    rdNumaratajYOK.Enabled = true;
                    rdTabelaVAR.Enabled = true;
                    rdTabelaYOK.Enabled = true;
                    rdVAR.Enabled = true;
                    rdYOK.Enabled = true;
                    txtLisans.Enabled = true;

                    btnDuzenle.Visible = false;
                    btnIptal.Visible = true;
                    btnKaydet.Visible = true;
                }

            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            lblsonuc.Visible = false;

            if (Request.QueryString["BIRIM_GUNCELLE"] == "1")
            { 

                try
                {

                    int cbs = 0;
                    if (rdVAR.Checked == true)
                        cbs = 1;
                    else if (rdYOK.Checked == true)
                        cbs = 0;

                    int NUM = 0;
                    if (rdNumaratajVAR.Checked == true)
                        NUM = 1;
                    else if (rdNumaratajYOK.Checked == true)
                        NUM = 0;

                    int TAB = 0;
                    if (rdTabelaVAR.Checked == true)
                        TAB = 1;
                    else if (rdTabelaYOK.Checked == true)
                        TAB = 0;

                    DB a = new DB();
                    SqlConnection con = null;
                    SqlCommand cmd = null;
                    con = new SqlConnection((a.ConnectionBelediye()));
                    cmd = new SqlCommand("UPDATE [dbo].[BIRIMLER] SET  [BIRIM_ADI]='" + txtBirimAdi.Text.Trim().Replace("'", "`") + "',[YETKILI_ADI]='" + txtYetkiliAdi.Text.Trim().Replace("'", "`") + "', [GOREVI]='" + txtGorevi.Text.Trim().Replace("'", "`") + "'," + "[TELEFON]=" + Convert.ToInt64(txtTelefon.Text.Trim()) + " ,[DAHILI]='" + Convert.ToInt64(txtDahili.Text.Trim()) + "',[GSM]='" + Convert.ToInt64(txtGsm.Text.Trim()) + "',[MAIL]='" + txtEmail.Text.Trim().Replace("'", "`") + "',[NOT_ACIKLAMA]='" + txtNot.Text.Trim().Replace("'", "`") + ",[LISANS_DURUMU]='" + txtLisans.Text.Trim().Replace("'", "`") + "' ,[CBS_YAZILIMI]=" + cbs + "' ,[NUMARATAJ]='" + NUM + "',[NUMARATAJ_TABELASI]='" + TAB + "' where BIRIM_ID= " + Convert.ToInt32(Request.QueryString["BIRIM_ID"]), con);

                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        lblsonuc.Visible = true;
                        Label1.Text = "Birim başarıyla güncellendi.";
                        lblsonuc.Text = "Birim başarıyla güncellendi.";
                        ModalPopupExtender1.Show();
                        Birim_Getir(Convert.ToInt32(Request.QueryString["BIRIM_ID"]));

                        btnDuzenle.Visible = true;
                        btnKaydet.Visible = false;
                        btnIptal.Visible = false;

                        txtBirimAdi.Enabled = false;
                        txtYetkiliAdi.Enabled = false;
                        txtGorevi.Enabled = false;
                        txtTelefon.Enabled = false;
                        txtDahili.Enabled = false;
                        txtGsm.Enabled = false;
                        txtEmail.Enabled = false;
                        txtNot.Enabled = false;
                        rdNumaratajVAR.Enabled = false;
                        rdNumaratajYOK.Enabled = false;
                        rdTabelaVAR.Enabled = false;
                        rdTabelaYOK.Enabled = false;
                        rdVAR.Enabled = false;
                        rdYOK.Enabled = false;
                        txtLisans.Enabled = false;

                    }
                    else
                    {

                        lblsonuc.Visible = true;
                        Label1.Text = "Güncelleme sırasında hata oluştu.";
                        lblsonuc.Text = "Güncelleme sırasında hata oluştu.";
                        ModalPopupExtender1.Show();

                    }
                    con.Close();

                }
                catch (Exception ex)
                {
                    lblsonuc.Visible = true;
                    lblsonuc.ForeColor = Color.Red;
                    Label1.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    lblsonuc.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    ModalPopupExtender1.Show();
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
                    cmd = new SqlCommand("INSERT INTO [dbo].[BIRIMLER] ([BELEDIYE_ID],[BIRIM_ADI],[YETKILI_ADI],[GOREVI]," +
                                       "[TELEFON],[DAHILI],[GSM],[MAIL],[NOT_ACIKLAMA],[KULLANICI_ADI],[KAYIT_ZAMANI],[LISANS_DURUMU],[CBS_YAZILIMI],[NUMARATAJ], [NUMARATAJ_TABELASI] )" +
                                       "  VALUES(@BELEDIYE_ID,@BIRIM_ADI,@YETKILI_ADI,@GOREVI,@TELEFON,@DAHILI, @GSM,@MAIL, @NOT_ACIKLAMA,@KULLANICI_ADI,@KAYIT_ZAMANI,@LISANS_DURUMU,@CBS_YAZILIMI,@NUMARATAJ,@NUMARATAJ_TABELASI )", con);

                    cmd.Parameters.AddWithValue("@BELEDIYE_ID", "" + Convert.ToInt32(Request.QueryString["BELEDIYE_ID"]));
                    cmd.Parameters.AddWithValue("@BIRIM_ADI", "" + txtBirimAdi.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@YETKILI_ADI", "" + txtYetkiliAdi.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@GOREVI", "" + txtGorevi.Text.Trim().Replace("'", "`"));

                    cmd.Parameters.AddWithValue("@TELEFON", Convert.ToInt64(txtTelefon.Text.Trim()));
                    cmd.Parameters.AddWithValue("@DAHILI", Convert.ToInt64(txtDahili.Text.Trim()));
                    cmd.Parameters.AddWithValue("@GSM", Convert.ToInt64(txtGsm.Text.Trim()));

                    cmd.Parameters.AddWithValue("@MAIL", "" + txtEmail.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@NOT_ACIKLAMA", "" + txtNot.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@KULLANICI_ADI", "" + Session["ADSOYAD"]);
                    cmd.Parameters.AddWithValue("@KAYIT_ZAMANI", " " + DateTime.Now);

                    if (rdVAR.Checked)
                        cmd.Parameters.AddWithValue("@CBS_YAZILIMI", 1);
                    else
                        cmd.Parameters.AddWithValue("@CBS_YAZILIMI", 0);

                    if (rdNumaratajVAR.Checked)
                        cmd.Parameters.AddWithValue("@NUMARATAJ", 1);
                    else
                        cmd.Parameters.AddWithValue("@NUMARATAJ", 0);

                    if (rdTabelaVAR.Checked)
                        cmd.Parameters.AddWithValue("@NUMARATAJ_TABELASI", 1);
                    else
                        cmd.Parameters.AddWithValue("@NUMARATAJ_TABELASI", 0);

                    cmd.Parameters.AddWithValue("@LISANS_DURUMU", "" + txtLisans.Text.Trim().Replace("'", "`"));

                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        //lblsonuc.Visible = true;
                        Label1.Text = "Birim başarıyla kaydedildi.";
                        lblsonuc.Text = "Birim başarıyla kaydedildi.";
                        ModalPopupExtender1.Show();


                        txtBirimAdi.Text = "";
                        txtYetkiliAdi.Text = "";
                        txtGorevi.Text = "";
                        txtTelefon.Text = "0";
                        txtDahili.Text = "0";
                        txtGsm.Text = "0";
                        txtEmail.Text = "";
                        txtNot.Text = "";
 
                        txtLisans.Text = "";

                    }
                    else
                    {
                        // lblsonuc.Visible = true;
                        Label1.Text = "Kaydetme sırasında hata oluştu.";
                        lblsonuc.Text = "Kaydetme sırasında hata oluştu.";
                        ModalPopupExtender1.Show();

                    }
                    con.Close();

                }
                catch (Exception ex)
                {
                    lblsonuc.Visible = true;
                    lblsonuc.ForeColor = Color.Red;
                    // Label1.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    lblsonuc.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    ModalPopupExtender1.Show();
                }
            }
        }

        public void Birim_Getir(int BIRIM_ID)
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.BirimGetir(BIRIM_ID);
                dr.Read();
                if (dr.HasRows)
                {

                    if (Convert.ToBoolean(dr["CBS_YAZILIMI"]) == true)
                        rdVAR.Checked = true;
                    else
                        rdYOK.Checked = true;

                    if (Convert.ToBoolean(dr["NUMARATAJ"]) == true)
                        rdNumaratajVAR.Checked = true;
                    else
                        rdNumaratajYOK.Checked = true;

                    if (Convert.ToBoolean(dr["NUMARATAJ_TABELASI"]) == true)
                        rdTabelaVAR.Checked = true;
                    else
                        rdTabelaYOK.Checked = true;

                    txtLisans.Text = "" + dr["LISANS_DURUMU"];
                    txtBirimAdi.Text = "" + dr["BIRIM_ADI"];
                    txtYetkiliAdi.Text = "" + dr["YETKILI_ADI"];
                    txtGorevi.Text = "" + dr["GOREVI"];
                    txtTelefon.Text = "" + dr["TELEFON"];
                    txtDahili.Text = "" + dr["DAHILI"];
                    txtGsm.Text = "" + dr["GSM"];
                    txtEmail.Text = "" + dr["MAIL"];
                    txtNot.Text = "" + dr["NOT_ACIKLAMA"];
                }
                dr.Close();
            }
            catch (Exception ex)
            {

            }

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("BirimleriGoruntule.aspx?BELEDIYE_ID=" + Convert.ToInt32(Request.QueryString["BELEDIYE_ID"]));
        }

        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            btnDuzenle.Visible = false;
            btnKaydet.Visible = true;
            btnIptal.Visible = true;

            txtBirimAdi.Enabled = true;
            txtYetkiliAdi.Enabled = true;
            txtGorevi.Enabled = true;
            txtTelefon.Enabled = true;
            txtDahili.Enabled = true;
            txtGsm.Enabled = true;
            txtEmail.Enabled = true;
            txtNot.Enabled = true;


            rdNumaratajVAR.Enabled = true;
            rdNumaratajYOK.Enabled = true;
            rdTabelaVAR.Enabled = true;
            rdTabelaYOK.Enabled = true;
            rdVAR.Enabled = true;
            rdYOK.Enabled = true;
            txtLisans.Enabled = true;


        }

        protected void btnIptal_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["BIRIM_GUNCELLE"] == "1")
            {
                btnDuzenle.Visible = true;
                btnKaydet.Visible = false;
                btnIptal.Visible = false;

                txtBirimAdi.Enabled = false;
                txtYetkiliAdi.Enabled = false;
                txtGorevi.Enabled = false;
                txtTelefon.Enabled = false;
                txtDahili.Enabled = false;
                txtGsm.Enabled = false;
                txtEmail.Enabled = false;
                txtNot.Enabled = false;

                rdNumaratajVAR.Enabled = false;
                rdNumaratajYOK.Enabled = false;
                rdTabelaVAR.Enabled = false;
                rdTabelaYOK.Enabled = false;
                rdVAR.Enabled = false;
                rdYOK.Enabled = false;
                txtLisans.Enabled = false;

            }
        }
  
    
    }
}