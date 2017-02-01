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
    public partial class Kullanicilari_Goruntule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["YETKILI"].ToString() == "2")
                    Response.Redirect("Default.aspx");

                Kullanici_Getir(0);

            }

        }

        protected void rptBIRIMLER_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DETAY")
            {
                Response.Redirect("Kullanici_Ekle.aspx?KULLANICI_GUNCELLE=1&KULLANICI_ID=" + e.CommandArgument);
            }

            if (e.CommandName == "SIL")
            {
                DB a = new DB();
                if (a.KullanicieSil(Convert.ToInt32(e.CommandArgument)) == 1)
                {
                    lblMesaj.ForeColor = Color.Green;
                    lblMesaj.Text = "Silindi.";
                    Kullanici_Getir(0);
                }
                else
                {
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
                }

            }
        }



        public void Kullanici_Getir(int KULLANICI_ID)
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.KullanicilariGetir(KULLANICI_ID );
                rptBIRIMLER.DataSource = dr;
                rptBIRIMLER.DataBind();


            }
            catch (Exception ex)
            {

            }
        }

        protected void btnYeniKullanici_Click(object sender, EventArgs e)
        {
            Response.Redirect("Kullanici_Ekle.aspx");
        }




    }
}