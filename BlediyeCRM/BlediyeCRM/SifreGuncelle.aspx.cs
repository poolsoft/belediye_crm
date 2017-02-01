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
    public partial class SifreGuncelle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["YETKILI"].ToString() == "2")
                //    Response.Redirect("Default.aspx");
                
            }
        }

        protected void btnGuncelle_Click1(object sender, EventArgs e)
        {

            DB a = new DB();

            if (a.SifreGuncelleme(Convert.ToInt32(Session["KULLANICI_ID"]), ""+txtsifreeski.Text.Trim().Replace("'", "`")) > -1)
            {
                if (txtsifreyeni.Text.Trim() == txtsifretekrar.Text.Trim())
                {
                    try
                    {
                         
                        SqlConnection con = null;
                        SqlCommand cmd = null;
                        con = new SqlConnection((a.ConnectionBelediye()));
                        cmd = new SqlCommand("UPDATE [dbo].[KULLANICILAR] SET  [SIFRE]='" + txtsifreyeni.Text.Trim().Replace("'", "`")   + "'  where KULLANICI_ID= " + Convert.ToInt32(Session["KULLANICI_ID"]), con);

                        con.Open();
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            // lblMesaj.Visible = true;
                            Label1.Text = "Şifre başarıyla güncellendi.";
                            lblMesaj.Text = "Şifre başarıyla güncellendi.";
                            ModalPopupExtender1.Show();
                            
                        }
                        else
                        {

                            // lblMesaj.Visible = true;
                            Label1.Text = "Güncelleme sırasında hata oluştu.";
                            lblMesaj.Text = "Güncelleme sırasında hata oluştu.";
                            ModalPopupExtender1.Show();

                        }
                        con.Close();

                    }
                    catch (Exception ex)
                    {
                        //lblMesaj.Visible = true;
                        lblMesaj.ForeColor = Color.Red;
                        Label1.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                        lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz. Beklenmedik bir hata oluştu.";
                        ModalPopupExtender1.Show();
                    }
                }
                else
                {
                    // lblMesaj.Visible = true;
                    Label1.Text = "Şifreler uyuşmamaktadır"; 
                    ModalPopupExtender1.Show();
                }
            }
            else
            {
                // lblMesaj.Visible = true;
                Label1.Text = "Eski şifreniz hatalıdır.";
                ModalPopupExtender1.Show();
            }
        }

        
    }
}