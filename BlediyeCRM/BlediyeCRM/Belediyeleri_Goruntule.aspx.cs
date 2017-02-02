using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM.pages
{
    public partial class Belediyeleri_Goruntule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 

                LOADING();
                
                lblMesaj.Text = "";
            }
             
        }

       

        protected void rptYAPI_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "BIRIM")
            {
                Response.Redirect("BirimleriGoruntule.aspx?BELEDIYE_ID=" + Convert.ToUInt32(e.CommandArgument));
                
            }

            if (e.CommandName == "DETAY")
            {
                Response.Redirect("Belediye_Ekle.aspx?BELEDIYE_GUNCELLE=1&BELEDIYE_ID="+e.CommandArgument);
            }

            if (e.CommandName == "SIL")
            {
                DB a = new DB();
                if (a.BelediyeSil(Convert.ToInt32(e.CommandArgument)) == 1)
                {
                    lblMesaj.ForeColor = Color.Green;
                    lblMesaj.Text = "Silindi.";
                    LOADING();
                }
                else
                {
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
                }

            }
        }

        public void LOADING()
        {
            
            BelediyeCek(); 
        }

        public void BelediyeCek()
        {
            try
            {  
                DB a = new DB();
                SqlDataReader dr = a.BelediyeGetir();
                rptBELEDIYE.DataSource = dr;
                rptBELEDIYE.DataBind();
            }
            catch (Exception ex)
            { 
                
            }
        }

        protected void btnYeniBelediyeEkle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Belediye_Ekle.aspx");
        }


        protected void btnKaydet_Click(object sender, EventArgs e)
        {

        }

        protected void btnBirimEkle_Click(object sender, EventArgs e)
        {

        }

        protected void rptBELEDIYE_Load(object sender, EventArgs e)
        {
           
        }

        protected void rptBELEDIYE_Init(object sender, EventArgs e)
        {
            
        }

        protected void rptBELEDIYE_DataBinding(object sender, EventArgs e)
        {
           
        }

        protected void rptBELEDIYE_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "waitingDialog.show();setTimeout(function () {waitingDialog.hide();}, 5000);", true);
        }

         

        




    }
}