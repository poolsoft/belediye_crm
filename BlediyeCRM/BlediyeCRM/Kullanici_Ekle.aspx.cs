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
    public partial class Kullanici_Ekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["YETKILI"].ToString() == "2")
                    Response.Redirect("Default.aspx");
                if (Request.QueryString["KULLANICI_GUNCELLE"] == "1")
                {
                    btnKaydet.Text = "Güncelle";
                    Kullanici_Getir(Convert.ToInt32(Request.QueryString["KULLANICI_ID"]));
                }
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            lblMesaj.Visible = false;

            if (Request.QueryString["KULLANICI_GUNCELLE"] == "1")
            {
                try
                {
                    string yetki="";
                       if (DropDownList1.SelectedIndex == 1)
                       yetki= "1";
                    else if (DropDownList1.SelectedIndex == 2)
                         yetki= "2";
                    else
                         yetki= "0";


                    DB a = new DB();
                    SqlConnection con = null;
                    SqlCommand cmd = null;
                    con = new SqlConnection((a.ConnectionBelediye()));
                    cmd = new SqlCommand("UPDATE [dbo].[KULLANICILAR] SET  [ADSOYAD]='" + txtAdSoyad.Text.Trim().Replace("'", "`") + "',[KADI]='" +
                    txtKadi.Text.Trim().Replace("'", "`") + "', [SIFRE]='" + txtsifre.Text.Trim().Replace("'", "`") + "', YETKI='"+yetki+"'  where KULLANICI_ID= " + Convert.ToInt32(Request.QueryString["KULLANICI_ID"]), con);

                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        // lblMesaj.Visible = true;
                        Label1.Text = "Kullanıcı başarıyla güncellendi.";
                        lblMesaj.Text = "Kullanıcı başarıyla güncellendi.";
                        ModalPopupExtender2.Show();
                        Kullanici_Getir(Convert.ToInt32(Request.QueryString["KULLANICI_ID"]));
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
                    cmd = new SqlCommand("INSERT INTO [dbo].[KULLANICILAR] ([ADSOYAD],[KADI],[SIFRE]," +
                                       "[YETKI])" +
                                       "  VALUES(@ADSOYAD,@KADI,@SIFRE,@YETKI )", con);

                    cmd.Parameters.AddWithValue("@ADSOYAD", "" + txtAdSoyad.Text.Trim().Replace("'", "`"));
                    cmd.Parameters.AddWithValue("@KADI", "" + txtKadi.Text.Trim().Replace("'", "`"));

                    cmd.Parameters.AddWithValue("@SIFRE", "" + txtsifre.Text.Trim().Replace("'", "`"));

                    if (DropDownList1.SelectedIndex == 1)
                        cmd.Parameters.AddWithValue("@YETKI", "1");
                    else if (DropDownList1.SelectedIndex == 2)
                        cmd.Parameters.AddWithValue("@YETKI", "2");
                    else
                        cmd.Parameters.AddWithValue("@YETKI", "0");
                   


                    con.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        //lblMesaj.Visible = true;
                        Label1.Text = "Kullanıcı başarıyla kaydedildi.";
                        lblMesaj.Text = "Kullanıcı başarıyla kaydedildi.";
                        ModalPopupExtender2.Show();


                        txtAdSoyad.Text = "";
                        txtKadi.Text = "";
                        txtsifre.Text = "";
                        DropDownList1.SelectedIndex = 0;
                       

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


        public void Kullanici_Getir(int KULLANICI_ID)
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.KullanicilariGetir(KULLANICI_ID);
                dr.Read();
                if (dr.HasRows)
                {

                    txtAdSoyad.Text = "" + dr["ADSOYAD"];
                    txtKadi.Text = "" + dr["KADI"];
                    txtsifre.Text = "" + dr["SIFRE"];

                    if (dr["YETKI"].ToString() == "1")
                        DropDownList1.SelectedIndex = 1;
                    else if (dr["YETKI"].ToString() == "2")
                        DropDownList1.SelectedIndex = 2;
                    else
                        DropDownList1.SelectedIndex = 0;

                }

            }
            catch (Exception ex)
            {

            }
        }






    }
}