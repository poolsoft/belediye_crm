using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
               
            }
             
        }

        protected void rptYAPI_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "BIRIM")
            {
                
            }

            if (e.CommandName == "DETAY")
            {
                Response.Redirect("Belediye_Ekle.aspx?BELEDIYE_GUNCELLE=1&BELEDIYE_ID="+e.CommandArgument);
            }

            if (e.CommandName == "SIL")
            {

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

        




    }
}