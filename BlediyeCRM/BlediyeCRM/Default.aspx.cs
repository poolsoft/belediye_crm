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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

            if (!IsPostBack)
            {
                Session["YETKI"] = "";
                Session["ADSOYAD"] = "";
                Session["KULLANICI_ID"] = "";

                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    chkRememberMe.Checked = true;
                    txtKadi.Text = Request.Cookies["UserName"].Value;
                    txtSifre.Attributes["value"] = Request.Cookies["Password"].Value;
                }
            }
        }

        protected void txtGiris_Click(object sender, EventArgs e)
        { 
            DB a = new DB();
            SqlDataReader dr = a.KullaniciGirisi(txtKadi.Text.Trim(), txtSifre.Text.Trim());
            dr.Read();
            if (dr.HasRows)
            {
                try
                {
                    Session["YETKI"] = "" + dr["YETKI"].ToString();
                    Session["ADSOYAD"] = "" + dr["ADSOYAD"].ToString();
                    Session["KULLANICI_ID"] = "" + dr["KULLANICI_ID"].ToString();

                    if (chkRememberMe.Checked)
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                    }
                    Response.Cookies["UserName"].Value = txtKadi.Text.Trim();
                    Response.Cookies["Password"].Value = txtSifre.Text.Trim();


                    Response.Redirect("Anasayfa.aspx");
                }
                catch (Exception ex)
                {
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "Tüm alanları doldurmalısınız." + ex;
                }
            }
            else
            {
                lblMesaj.ForeColor = Color.Red;
                lblMesaj.Text = "Hata. Tüm alanları doldurmalısınız.";
            } 
        }
    }
}