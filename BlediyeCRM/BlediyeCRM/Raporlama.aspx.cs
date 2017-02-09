using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlediyeCRM
{
    public partial class Raporlama : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // ModalPopupExtender1.Show();

            }
        }

        protected void btnRaporla_Click(object sender, EventArgs e)
        {

        }

        protected void btnRaporOlusturGorusme_Click(object sender, EventArgs e)
        {
            DB a=new DB();
            SqlDataReader dr;
             

            if (cbsVar.Checked == true && numVar.Checked == false && numYok.Checked == false &)
                dr = a.BirimleriRaporla(1,-1,-1);
            else if(cbsYok.Checked==true)
                dr = a.BirimleriRaporla(0, -1, -1);




        }

        protected void rdBirim_CheckedChanged(object sender, EventArgs e)
        {
            listozellikler.Items.Clear();

            listozellikler.Items.Add("CBS Yazılım");
            listozellikler.Items.Add("Numarataj(ABS)");
            listozellikler.Items.Add("Numarataj Tabelası");
        }

        protected void rdGorusme_CheckedChanged(object sender, EventArgs e)
        {
            cbsyazilimi.Visible = false;
            numarataj.Visible = false;
            tabela.Visible = false;

            listozellikler.Items.Clear(); 
            listozellikler.Items.Add("Belediye Seçerek");
            listozellikler.Items.Add("Tarih Aralığında");
            listozellikler.Items.Add("Kişi Seçerek");
        }

        protected void listozellikler_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listozellikler.SelectedItem.ToString() == "CBS Yazılım")
            {
                cbsyazilimi.Visible = true;
            }

            if (listozellikler.SelectedItem.ToString() == "Numarataj(ABS)")
            {
                numarataj.Visible = true;
            }

            if (listozellikler.SelectedItem.ToString() == "Numarataj Tabelası")
            {
                tabela.Visible = true;
            }

            listozellikler.Items.RemoveAt(listozellikler.SelectedIndex);

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            cbsyazilimi.Visible = false;
            listozellikler.Items.Add("CBS Yazılım");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            numarataj.Visible = false;
            listozellikler.Items.Add("Numarataj(ABS)");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            tabela.Visible = false;
            listozellikler.Items.Add("Numarataj Tabelası");
        }

        protected void rptBIRIMLER_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rptBIRIMLER_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }








    }
}