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
    public partial class Bilgilerimi_Guncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["YETKILI"].ToString() == "2")
                //    Response.Redirect("Default.aspx");

                KullaniciCek(Convert.ToInt32(Session["KULLANICI_ID"]));

            }

        }


        protected void btnGuncelle_Click(object sender, EventArgs e)
        {

            DB a = new DB();

            try
            {

                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection((a.ConnectionBelediye()));
                cmd = new SqlCommand("UPDATE [dbo].[KULLANICILAR] SET  [ADSOYAD]='" + txtAdsoyad.Text.Trim().Replace("'", "`") + "' , KADI='" + txtKadi.Text.Trim().Replace("'", "`") + "'  where KULLANICI_ID= " + Convert.ToInt32(Session["KULLANICI_ID"]), con);

                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    // lblMesaj.Visible = true;
                    Label1.Text = "Bilgileriniz başarıyla güncellendi.";
                    lblMesaj.Text = "Bilgileriniz başarıyla güncellendi.";
                    ModalPopupExtender2.Show();

                  
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


        public void KullaniciCek(int KULLANICI_ID)
        {
            DB a = new DB();
            SqlDataReader dr = a.KullaniciGetir(KULLANICI_ID);
            dr.Read();
            if (dr.HasRows)
            {
                txtAdsoyad.Text = "" + dr["ADSOYAD"];
                txtKadi.Text = "" + dr["KADI"];
            }



        }

        protected void btnHide_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

    }
}