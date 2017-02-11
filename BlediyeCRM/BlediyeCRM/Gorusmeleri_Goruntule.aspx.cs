using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM.pages
{
    public partial class Gorusmeleri_Goruntule : System.Web.UI.Page
    {
        int TUM = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["YETKILI"].ToString() == "2")
                {
                    Response.Redirect("Belediyeleri_Goruntule.aspx");
                }


                if (Request.QueryString["BELEDIYE_ID"] == null)
                {
                    TUM = 1;
                    geri.Visible = false;
                    GorusmeCekHepsi();
                }
                else
                {
                    GorusmeCek();
                }

            }
        }

        protected void rptBIRIMLER_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName == "DETAY")
            {
                DB a = new DB();
                int BELEDIYE_ID = a.GorusmeBelediyeID(Convert.ToInt32(e.CommandArgument));
                int BIRIM_ID = a.GorusmeBirimID(Convert.ToInt32(e.CommandArgument));

                Response.Redirect("Gorusme_Ekle.aspx?GORUSME_GUNCELLE=1&GORUSME_ID=" + e.CommandArgument + "&BELEDIYE_ID=" + BELEDIYE_ID + "&BIRIM_ID=" + BIRIM_ID);
            }

            if (e.CommandName == "SIL")
            {

                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Evet")
                {
                   // this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES!')", true);

                    DB a = new DB();

                    try
                    {
                        SqlDataReader dr = a.GorusmeGetir(Convert.ToInt32(e.CommandArgument));
                        dr.Read();
                        if (dr.HasRows)
                        {
                            SqlConnection con = null;
                            SqlCommand cmd = null;
                            con = new SqlConnection((a.ConnectionBelediye()));
                            cmd = new SqlCommand("INSERT INTO [dbo].[SILINEN_GORUSMELER] ([GORUSME_KONUSU],  " +
                                               "  [KULLANICI_ADI],[SILME_TARIHI] )  VALUES(@GORUSME_KONUSU, @KULLANICI_ADI,@SILME_TARIHI )", con);

                            cmd.Parameters.AddWithValue("@GORUSME_KONUSU", "" + dr["GORUSME_KONUSU"]);
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




                    FileInfo TheFile = new FileInfo(Server.MapPath("~/dosya/") + a.GorusmeDOSYA_YOLU(Convert.ToInt32(Request.QueryString["GORUSMEID"])));
                    if (TheFile.Exists)
                    {
                        File.Delete(MapPath("~/dosya/") + a.GorusmeDOSYA_YOLU(Convert.ToInt32(Request.QueryString["GORUSMEID"])));
                    }

                    if (a.GorusmeSil(Convert.ToInt32(e.CommandArgument), 0, 0) == 1)
                    {
                        lblMesaj.ForeColor = Color.Green;
                        lblMesaj.Text = "Silindi.";
                        if (Request.QueryString["BELEDIYE_ID"] == null)
                            GorusmeCekHepsi();
                        else
                            GorusmeCek();
                    }
                    else
                    {
                        lblMesaj.ForeColor = Color.Red;
                        lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
                    }
                     
                }
                else
                {
                   // this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO!')", true);
                }

            }
        }

        public void GorusmeCek()
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.GorusmeleriGetir(Convert.ToInt32(Request.QueryString["BIRIM_ID"]));
                rptBIRIMLER.DataSource = dr;
                rptBIRIMLER.DataBind();
            }
            catch (Exception ex)
            {
                lblMesaj.ForeColor = Color.Red;
                lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
            }
        }

        public void GorusmeCekHepsi()
        {
            try
            {
                DB a = new DB();
                SqlDataReader dr = a.GorusmeleriGetirHepsi();
                rptBIRIMLER.DataSource = dr;
                rptBIRIMLER.DataBind();
            }
            catch (Exception ex)
            {
                lblMesaj.ForeColor = Color.Red;
                lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gorusme_Ekle.aspx?BELEDIYE_ID=" + Request.QueryString["BELEDIYE_ID"] + "&BIRIM_ID=" + Request.QueryString["BIRIM_ID"]);
        }

        protected void rptBIRIMLER_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }


        public void OnConfirm(object sender, EventArgs e)
        {

        }

       
       






    }
}