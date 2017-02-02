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
    public partial class Gorusmeleri_Goruntule : System.Web.UI.Page
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

                GorusmeCek();

            }
        }

        protected void rptBIRIMLER_ItemCommand(object source, RepeaterCommandEventArgs e)
        { 

            if (e.CommandName == "DETAY")
            {
                Response.Redirect("Gorusme_Ekle.aspx?GORUSME_GUNCELLE=1&GORUSME_ID=" + e.CommandArgument + "&BELEDIYE_ID=" + Request.QueryString["BELEDIYE_ID"] + "&BIRIM_ID=" + Request.QueryString["BIRIM_ID"]);
            }

            if (e.CommandName == "SIL")
            {
                DB a = new DB();
                if (a.GorusmeSil(Convert.ToInt32(e.CommandArgument), 0,0) == 1)
                {
                    lblMesaj.ForeColor = Color.Green;
                    lblMesaj.Text = "Silindi.";
                    GorusmeCek();
                }
                else
                {
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
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

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gorusme_Ekle.aspx?BELEDIYE_ID=" + Request.QueryString["BELEDIYE_ID"] + "&BIRIM_ID=" + Request.QueryString["BIRIM_ID"]);
        }

        protected void rptBIRIMLER_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "waitingDialog.show();setTimeout(function () {waitingDialog.hide();}, 3000);", true);
        }

    
    
    
    
    
    
    
    
    }
}