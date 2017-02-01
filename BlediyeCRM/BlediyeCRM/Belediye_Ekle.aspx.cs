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
    public partial class Belediye_Ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                BelediyeTurleriGetir();

                if (Request.QueryString["BELEDIYE_GUNCELLE"] == "1")
                {
                    Button2.Text = "Güncelle";
                    BelediyeCek();
                }
            }

        }

        //Belediye türü Getir
        public void BelediyeTurleriGetir()
        {

            try
            {
                DB a = new DB();
                SqlDataReader dr = a.BelediyeTuruGetir();
                while (dr.Read())
                {
                    DDBElediyeTuru.Items.Add("" + dr["BELEDIYE_TURU_ADI"]);
                }
            }
            catch (Exception ex)
            {

            }

        }

        protected void DDBElediyeTuru_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        protected void Button2_Click(object sender, EventArgs e)
        {

            if (Request.QueryString["BELEDIYE_GUNCELLE"] == "1")
            {
                try
                {
                    int cbs = 0;
                    if (rdVAR.Checked)
                        cbs = 1;
                    else
                        cbs = 0;

                    DB a = new DB();
                    SqlConnection con = null;
                    SqlCommand cmd = null;
                    con = new SqlConnection((a.ConnectionBelediye()));
                    cmd = new SqlCommand("UPDATE [dbo].[BELEDIYE] SET [IL]='" + txtIl.Text.Trim().Replace("'", "`") + "',[ILCE]='" + txtIlce.Text.Trim().Replace("'", "`") + "',[BELEDIYE]='" + txtBelediye.Text.Trim().Replace("'", "`") + "', [BELEDIYE_TURU]='" + DDBElediyeTuru.SelectedItem.Text + "'," + "[NUFUS]=" + Convert.ToInt64(txtNufusSayisi.Text.Trim()) + " ,[PARTISI]='" + txtPartisi.Text.Trim().Replace("'", "`") + "',[BELEDIYE_BASKANI_ADI]='" + txtBelediyeBaskaniAdi.Text.Trim().Replace("'", "`") + "',[BELEDIYE_ADRESI]='" + txtBelediyeAdresi.Text.Trim().Replace("'", "`") + "',[TELEFON]=" + Convert.ToInt64(txtTelefon.Text.Trim()) + "," + "[CBS_YAZILIMI]=" + cbs + ",[LISANS_DURUMU]='" + txtLisans.Text.Trim().Replace("'", "`") + "',[NOT_ACIKLAMA]='" + txtNot.Text.Trim().Replace("'", "`") + "' where BELEDIYE_ID= " + Convert.ToInt32(Request.QueryString["BELEDIYE_ID"]), con);

                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {

                        lblMesaj.Text = "Belediye başarıyla güncellendi.";
                        ModalPopupExtender2.Show();
                        BelediyeCek();

                    }
                    else
                    {

                        lblMesaj.Text = "Güncelleme sırasında hata oluştu.";
                        ModalPopupExtender2.Show();

                    }
                    con.Close();

                }
                catch (Exception ex)
                {
                    lblMesaj.ForeColor = Color.Red;
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
                    cmd = new SqlCommand("INSERT INTO [dbo].[BELEDIYE] ([IL],[ILCE],[BELEDIYE],[BELEDIYE_TURU]," +
                                       "[NUFUS],[PARTISI],[BELEDIYE_BASKANI_ADI],[BELEDIYE_ADRESI],[TELEFON]," +
                                       "[CBS_YAZILIMI],[LISANS_DURUMU],[NOT_ACIKLAMA],[KULLANICI_ADI],[KAYIT_ZAMANI] )  VALUES(@IL,@ILCE,@BELEDIYE,@BELEDIYE_TURU,@NUFUS,@PARTISI,@BELEDIYE_BASKANI_ADI,@BELEDIYE_ADRESI, @TELEFON,@CBS_YAZILIMI,@LISANS_DURUMU,@NOT_ACIKLAMA,@KULLANICI_ADI,@KAYIT_ZAMANI )", con);

                    cmd.Parameters.AddWithValue("@IL", "" + txtIl.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@ILCE", "" + txtIlce.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@BELEDIYE", "" + txtBelediye.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@BELEDIYE_TURU", "" + DDBElediyeTuru.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@KAYIT_ZAMANI", " " + DateTime.Now);
                    cmd.Parameters.AddWithValue("@NUFUS", Convert.ToInt64(txtNufusSayisi.Text.Trim()));
                    cmd.Parameters.AddWithValue("@PARTISI", "" + txtPartisi.Text.Trim().Replace("'", "`"));

                    cmd.Parameters.AddWithValue("@BELEDIYE_BASKANI_ADI", "" + txtBelediyeBaskaniAdi.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@BELEDIYE_ADRESI", "" + txtBelediyeAdresi.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@TELEFON", Convert.ToInt64(txtTelefon.Text.Trim()));
                    if (rdVAR.Checked)
                        cmd.Parameters.AddWithValue("@CBS_YAZILIMI", 1);
                    else
                        cmd.Parameters.AddWithValue("@CBS_YAZILIMI", 0);

                    cmd.Parameters.AddWithValue("@LISANS_DURUMU", "" + txtLisans.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@NOT_ACIKLAMA", "" + txtNot.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@KULLANICI_ADI", "" + Session["ADSOYAD"]);

                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {

                        lblMesaj.Text = "Belediye başarıyla kaydedildi.";
                        ModalPopupExtender2.Show();


                        txtIl.Text = "";
                        txtIlce.Text = "";
                        txtBelediye.Text = "";
                        txtNufusSayisi.Text = "";
                        txtPartisi.Text = "";
                        txtBelediyeBaskaniAdi.Text = "";
                        txtBelediyeAdresi.Text = "";
                        txtTelefon.Text = "";
                        txtLisans.Text = "";
                        txtNot.Text = "";
                        DDBElediyeTuru.SelectedIndex = 0;

                    }
                    else
                    {

                        lblMesaj.Text = "Kaydetme sırasında hata oluştu.";
                        ModalPopupExtender2.Show();

                    }
                    con.Close();

                }
                catch (Exception ex)
                {
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                    ModalPopupExtender2.Show();
                }
            }
        }

        public void BelediyeCek()
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.BelediyeGetirID(Convert.ToInt32(Request.QueryString["BELEDIYE_ID"]));

                dr.Read();
                if (dr.HasRows)
                {

                    if (Convert.ToBoolean(dr["CBS_YAZILIMI"]) == true)
                        rdVAR.Checked = true;
                    else
                        rdYOK.Checked = true;


                    txtIl.Text = "" + dr["IL"];
                    txtIlce.Text = "" + dr["ILCE"];
                    txtBelediye.Text = "" + dr["BELEDIYE"];
                    txtNufusSayisi.Text = "" + dr["NUFUS"];
                    txtPartisi.Text = "" + dr["PARTISI"];
                    txtBelediyeBaskaniAdi.Text = "" + dr["BELEDIYE_BASKANI_ADI"];
                    txtBelediyeAdresi.Text = "" + dr["BELEDIYE_ADRESI"];
                    txtTelefon.Text = "" + dr["TELEFON"];
                    txtLisans.Text = "" + dr["LISANS_DURUMU"];
                    txtNot.Text = "" + dr["NOT_ACIKLAMA"];

                    for (int i = 0; i < DDBElediyeTuru.Items.Count ; i++)
                    {
                        if (DDBElediyeTuru.Items[i].ToString() ==  dr["BELEDIYE_TURU"].ToString())
                            DDBElediyeTuru.SelectedIndex = i;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

      


    }
}