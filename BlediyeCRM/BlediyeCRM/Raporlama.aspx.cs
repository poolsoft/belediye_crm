using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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
               
                cbsYok.Checked = false; numYok.Checked = false; tabYok.Checked= false;
                cbsVar.Checked = false; numVar.Checked = false; tabVar.Checked = false;

            }
        }

        protected void btnRaporla_Click(object sender, EventArgs e)
        {

        }

        protected void btnRaporOlusturGorusme_Click(object sender, EventArgs e)
        {
            DB a = new DB();

            if (rdBirim.Checked == true)
            { 
                int tab = 0, num = 0, cbs = 0;

               
                SqlDataReader dr = null;

                if (cbsyazilimi.Visible == true)
                {
                    if (cbsYok.Checked == true || cbsVar.Checked == true)
                    {
                        cbs = 1;
                    }
                }


                if (numarataj.Visible == true)
                {
                    if (numVar.Checked == true || numYok.Checked == true)
                    {
                        num = 1;
                    }
                }


                if (tabela.Visible == true)
                {
                    if (tabVar.Checked == true || tabYok.Checked == true)
                    {
                        tab = 1;
                    }
                }


                if (cbs == 1 && num == 0 && tab == 0)
                {
                    if (cbsVar.Checked == true)
                        dr = a.BirimleriRaporla(1, -1, -1);
                    if (cbsYok.Checked == true)
                        dr = a.BirimleriRaporla(0, -1, -1);

                }
                else if (num == 1 && cbs == 0 && tab == 0)
                {
                    if (numVar.Checked == true)
                        dr = a.BirimleriRaporla(-1, 1, -1);
                    if (numYok.Checked == true)
                        dr = a.BirimleriRaporla(-1, 0, -1);

                }
                else if (tab == 1 && cbs == 0 && num == 0)
                {
                    if (tabVar.Checked == true)
                        dr = a.BirimleriRaporla(-1, -1, 1);
                    if (tabYok.Checked == true)
                        dr = a.BirimleriRaporla(-1, -1, 0);
                }

                else if (cbs == 1 && num == 1 && tab == 0)
                {
                    if (cbsVar.Checked == true && numVar.Checked == true)
                        dr = a.BirimleriRaporla(1, 1, -1);
                    if (cbsVar.Checked == true && numYok.Checked == true)
                        dr = a.BirimleriRaporla(1, 0, -1);
                    if (cbsYok.Checked == true && numVar.Checked == true)
                        dr = a.BirimleriRaporla(0, 1, -1);
                    if (cbsYok.Checked == true && numYok.Checked == true)
                        dr = a.BirimleriRaporla(0, 0, -1);

                }
                else if (cbs == 1 && tab == 1 && num == 0)
                {
                    if (cbsVar.Checked == true && tabVar.Checked == true)
                        dr = a.BirimleriRaporla(1, -1, 1);
                    if (cbsVar.Checked == true && tabYok.Checked == true)
                        dr = a.BirimleriRaporla(1, -1, 0);
                    if (cbsYok.Checked == true && tabYok.Checked == true)
                        dr = a.BirimleriRaporla(0, -1, 0);
                    if (cbsVar.Checked == true && tabVar.Checked == true)
                        dr = a.BirimleriRaporla(1, -1, 1);
                }
                else if (num == 1 && tab == 1 && cbs == 0)
                {
                    if (numVar.Checked == true && tabVar.Checked == true)
                        dr = a.BirimleriRaporla(-1, 1, 1);
                    if (numVar.Checked == true && tabYok.Checked == true)
                        dr = a.BirimleriRaporla(-1, 1, 0);
                    if (numYok.Checked == true && tabVar.Checked == true)
                        dr = a.BirimleriRaporla(-1, 0, 1);
                    if (numYok.Checked == true && tabYok.Checked == true)
                        dr = a.BirimleriRaporla(-1, 0, 0);
                }
                else if (num == 1 && tab == 1 && cbs == 1)
                {
                    if (cbsVar.Checked == true && numVar.Checked == true && tabVar.Checked == true)
                        dr = a.BirimleriRaporla(1, 1, 1);
                    if (cbsVar.Checked == true && numVar.Checked == true && tabYok.Checked == true)
                        dr = a.BirimleriRaporla(1, 1, 0);
                    if (cbsVar.Checked == true && numYok.Checked == true && tabYok.Checked == true)
                        dr = a.BirimleriRaporla(1, 0, 0);
                    if (cbsYok.Checked == true && numVar.Checked == true && tabVar.Checked == true)
                        dr = a.BirimleriRaporla(0, 1, 1);
                    if (cbsYok.Checked == true && numVar.Checked == true && tabYok.Checked == true)
                        dr = a.BirimleriRaporla(0, 1, 0);
                    if (cbsYok.Checked == true && numYok.Checked == true && tabYok.Checked == true)
                        dr = a.BirimleriRaporla(0, 0, 0);
                    if (cbsVar.Checked == true && numYok.Checked == true && tabVar.Checked == true)
                        dr = a.BirimleriRaporla(1, 0, 1);
                    if (cbsYok.Checked == true && numYok.Checked == true && tabVar.Checked == true)
                        dr = a.BirimleriRaporla(0, 0, 1);

                }

                rptBIRIMLERRapor.DataSource = dr;
                rptBIRIMLERRapor.DataBind();
            }
             

          
        }

        protected void rdBirim_CheckedChanged(object sender, EventArgs e)
        {
            btnRaporOlusturGorusme.Visible = true;
            btnPrint.Visible = true;
            btnGorusme.Visible = false;
            btnPrintGorusme.Visible = false;

            rptBIRIMLERRapor.DataSource = null;
            rptBIRIMLERRapor.DataBind();
            tarihAraligi.Visible = false;

            listozellikler.Items.Clear();

            listozellikler.Items.Add("CBS Yazılım");
            listozellikler.Items.Add("Numarataj(ABS)");
            listozellikler.Items.Add("Numarataj Tabelası");
        }

        protected void rdGorusme_CheckedChanged(object sender, EventArgs e)
        {
            btnGorusme.Visible = true;
            btnPrintGorusme.Visible = true;
            btnRaporOlusturGorusme.Visible = false;
            btnPrint.Visible = false;

            rptBIRIMLERRapor.DataSource = null;
            rptBIRIMLERRapor.DataBind();

            cbsyazilimi.Visible = false;
            numarataj.Visible = false;
            tabela.Visible = false;

            listozellikler.Items.Clear(); 
            listozellikler.Items.Add("Tarih Aralığında"); 
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

            if (listozellikler.SelectedItem.ToString() == "Tarih Aralığında")
            {
                tarihAraligi.Visible = true;
                ilCek();
                KULLANICICek();
            }

            listozellikler.Items.RemoveAt(listozellikler.SelectedIndex);

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            cbsyazilimi.Visible = false;
            cbsVar.Checked = false;
            cbsYok.Checked = false;
            listozellikler.Items.Add("CBS Yazılım");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            numarataj.Visible = false;
            numVar.Checked = false;
            numYok.Checked = false;
            listozellikler.Items.Add("Numarataj(ABS)");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            tabela.Visible = false;
            tabVar.Checked = false;
            tabYok.Checked = false;
            listozellikler.Items.Add("Numarataj Tabelası");
        }
         
        protected void rptBIRIMLERRapor_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SIL")
            { 
                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Evet")
                {

                    DB a = new DB();

                    try
                    {
                        SqlDataReader dr = a.BirimGetir(Convert.ToInt32(e.CommandArgument));
                        dr.Read();
                        if (dr.HasRows)
                        {
                            SqlConnection con = null;
                            SqlCommand cmd = null;
                            con = new SqlConnection((a.ConnectionBelediye()));
                            cmd = new SqlCommand("INSERT INTO [dbo].[SILINEN_BIRIMLER] ([BIRIM_ADI],[YETKILI_ADI],[MAIL], " +
                                               "  [KULLANICI_ADI],[SILME_TARIHI] )  VALUES(@BIRIM_ADI,@YETKILI_ADI,@MAIL ,@KULLANICI_ADI,@SILME_TARIHI )", con);

                            cmd.Parameters.AddWithValue("@BIRIM_ADI", "" + dr["BIRIM_ADI"]);
                            cmd.Parameters.AddWithValue("@YETKILI_ADI", "" + dr["YETKILI_ADI"]);
                            cmd.Parameters.AddWithValue("@MAIL", "" + dr["MAIL"]);
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


                    if (a.BirimSil(Convert.ToInt32(e.CommandArgument), 0) == 1)
                    {
                        lblMesaj.ForeColor = Color.Green;
                        lblMesaj.Text = "Silindi.";
                        rptBIRIMLERRapor.DataBind();
                    }
                    else
                    {
                        lblMesaj.ForeColor = Color.Red;
                        lblMesaj.Text = "İnternet bağlantınızı kontrol ediniz.";
                    }

                }
                else
                {

                }




            }
        }

        protected void rptBIRIMLERRapor_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            int tab = 0, num = 0, cbs = 0;

            DB a = new DB();
            SqlDataReader dr = null;

            if (cbsyazilimi.Visible == true)
            {
                if (cbsYok.Checked == true || cbsVar.Checked == true)
                {
                    cbs = 1;
                }
            }


            if (numarataj.Visible == true)
            {
                if (numVar.Checked == true || numYok.Checked == true)
                {
                    num = 1;
                }
            }


            if (tabela.Visible == true)
            {
                if (tabVar.Checked == true || tabYok.Checked == true)
                {
                    tab = 1;
                }
            }


            if (cbs == 1 && num == 0 && tab == 0)
            {
                if (cbsVar.Checked == true)
                    dr = a.BirimleriRaporla(1, -1, -1);
                if (cbsYok.Checked == true)
                    dr = a.BirimleriRaporla(0, -1, -1);

            }
            else if (num == 1 && cbs == 0 && tab == 0)
            {
                if (numVar.Checked == true)
                    dr = a.BirimleriRaporla(-1, 1, -1);
                if (numYok.Checked == true)
                    dr = a.BirimleriRaporla(-1, 0, -1);

            }
            else if (tab == 1 && cbs == 0 && num == 0)
            {
                if (tabVar.Checked == true)
                    dr = a.BirimleriRaporla(-1, -1, 1);
                if (tabYok.Checked == true)
                    dr = a.BirimleriRaporla(-1, -1, 0);
            }

            else if (cbs == 1 && num == 1 && tab == 0)
            {
                if (cbsVar.Checked == true && numVar.Checked == true)
                    dr = a.BirimleriRaporla(1, 1, -1);
                if (cbsVar.Checked == true && numYok.Checked == true)
                    dr = a.BirimleriRaporla(1, 0, -1);
                if (cbsYok.Checked == true && numVar.Checked == true)
                    dr = a.BirimleriRaporla(0, 1, -1);
                if (cbsYok.Checked == true && numYok.Checked == true)
                    dr = a.BirimleriRaporla(0, 0, -1);

            }
            else if (cbs == 1 && tab == 1 && num == 0)
            {
                if (cbsVar.Checked == true && tabVar.Checked == true)
                    dr = a.BirimleriRaporla(1, -1, 1);
                if (cbsVar.Checked == true && tabYok.Checked == true)
                    dr = a.BirimleriRaporla(1, -1, 0);
                if (cbsYok.Checked == true && tabYok.Checked == true)
                    dr = a.BirimleriRaporla(0, -1, 0);
                if (cbsVar.Checked == true && tabVar.Checked == true)
                    dr = a.BirimleriRaporla(1, -1, 1);
            }
            else if (num == 1 && tab == 1 && cbs == 0)
            {
                if (numVar.Checked == true && tabVar.Checked == true)
                    dr = a.BirimleriRaporla(-1, 1, 1);
                if (numVar.Checked == true && tabYok.Checked == true)
                    dr = a.BirimleriRaporla(-1, 1, 0);
                if (numYok.Checked == true && tabVar.Checked == true)
                    dr = a.BirimleriRaporla(-1, 0, 1);
                if (numYok.Checked == true && tabYok.Checked == true)
                    dr = a.BirimleriRaporla(-1, 0, 0);
            }
            else if (num == 1 && tab == 1 && cbs == 1)
            {
                if (cbsVar.Checked == true && numVar.Checked == true && tabVar.Checked == true)
                    dr = a.BirimleriRaporla(1, 1, 1);
                if (cbsVar.Checked == true && numVar.Checked == true && tabYok.Checked == true)
                    dr = a.BirimleriRaporla(1, 1, 0);
                if (cbsVar.Checked == true && numYok.Checked == true && tabYok.Checked == true)
                    dr = a.BirimleriRaporla(1, 0, 0);
                if (cbsYok.Checked == true && numVar.Checked == true && tabVar.Checked == true)
                    dr = a.BirimleriRaporla(0, 1, 1);
                if (cbsYok.Checked == true && numVar.Checked == true && tabYok.Checked == true)
                    dr = a.BirimleriRaporla(0, 1, 0);
                if (cbsYok.Checked == true && numYok.Checked == true && tabYok.Checked == true)
                    dr = a.BirimleriRaporla(0, 0, 0);
                if (cbsVar.Checked == true && numYok.Checked == true && tabVar.Checked == true)
                    dr = a.BirimleriRaporla(1, 0, 1);
                if (cbsYok.Checked == true && numYok.Checked == true && tabVar.Checked == true)
                    dr = a.BirimleriRaporla(0, 0, 1);

            }

            Repeater1.DataSource = dr;
            Repeater1.DataBind();

            ModalPopupExtender1.Show();
        }

        protected void ddIl_DataBound(object sender, EventArgs e)
        {

        }

        protected void ddIl_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void ilCek()
        {
            ddIl.Items.Add("IL_SECINIZ");
            DB a = new DB();
            SqlDataReader dr = a.IlGetir();
            while (dr.Read())
            {
                ddIl.Items.Add("" + dr["IL"]);
            }
        }


        public void KULLANICICek()
        {
            DDADSOYAD.Items.Add("KULLANICI_SEC");
            DB a = new DB();
            SqlDataReader dr = a.KullaniciGetir();
            while (dr.Read())
            {
                DDADSOYAD.Items.Add("" + dr["ADSOYAD"]);
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            tarihAraligi.Visible = false;
            txtTARIH.Text = "";
            bitisTarihi.Text = "";
            listozellikler.Items.Add("Tarih Aralığında");
        }

        protected void DDADSOYAD_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DDADSOYAD_DataBound(object sender, EventArgs e)
        {

        }

        protected void btnGorusme_Click(object sender, EventArgs e)
        {

            if (rdGorusme.Checked == true)
            {
                SqlDataReader dr1 = null;

                if (txtTARIH.Text.Trim() == "" && bitisTarihi.Text.Trim() == "")
                {
                    lblMesaj.Visible = true;
                    lblMesaj.ForeColor = Color.Red;
                    lblMesaj.Text = "Tarih aralığından en az birini seçmelisiniz.";
                }
                else
                {
                    if (ddIl.SelectedIndex == 0 && DDADSOYAD.SelectedIndex == 0)
                    {

                    }
                    else if (ddIl.SelectedIndex == 0 && DDADSOYAD.SelectedIndex != 0)
                    {

                    }
                    else if (ddIl.SelectedIndex != 0 && DDADSOYAD.SelectedIndex == 0)
                    {

                    }
                }
            }


        }

        protected void btnPrintGorusme_Click(object sender, EventArgs e)
        {
             
        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }







    }
}