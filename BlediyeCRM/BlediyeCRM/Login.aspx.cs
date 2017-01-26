using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtGiris_Click(object sender, EventArgs e)
        {
            try 
            {
                DB a = new DB();
                SqlDataReader dr = a.KullaniciGirisi(txtKadi.Text.Trim(),txtSifre.Text.Trim());
                dr.Read();
                if (dr.HasRows)
                {
                    
                    Session["YETKI"] =""+ dr["YETKI"];
                    Session["ADSOYAD"] =""+ dr["ADSOYAD"].ToString();
                    Session["KULLANICI_ID"] =""+ dr["KULLANICI_ID"];
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "Hata. Tüm alanları doldurmalısınız.";
                }

            }
            catch (Exception ex)
            {
                lblMesaj.ForeColor = Color.Red;
                lblMesaj.Text = "Tüm alanları doldurmalısınız.";
            }
        }
    }
}