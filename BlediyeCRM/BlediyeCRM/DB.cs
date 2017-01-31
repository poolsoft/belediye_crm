using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BlediyeCRM
{
    public class DB
    {
        //bağlantı
        public string ConnectionBelediye()
        {
            string conString = ConfigurationManager.ConnectionStrings["ConnectionBelediye"].ConnectionString;
            return conString;
        }

        //KullaniciGirisi
        public SqlDataReader KullaniciGirisi(string kadi, string sifre)
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());

                cmd = new SqlCommand("select * from KULLANICILAR WHERE KADI='" + kadi + "' and SIFRE='" + sifre + "'", con);

                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();

            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //Belediye Türü Getir
        public SqlDataReader BelediyeTuruGetir()
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                cmd = new SqlCommand("select * from BELDIYE_TURU  ", con);
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //Belediye  Getir
        public SqlDataReader BelediyeGetir()
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                cmd = new SqlCommand("select * from BELEDIYE order by KAYIT_ZAMANI desc ", con);
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //BelediyeID  Getir
        public SqlDataReader BelediyeGetirID(int BELEDIYE_ID)
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                cmd = new SqlCommand("select * from BELEDIYE where BELEDIYE_ID=" + BELEDIYE_ID, con);
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //Belediye Sil
        public int BelediyeSil(int BELEDIYE_ID)
        {
            int sonuc = -1;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());


                if (GorusmeSil(0, 0, BELEDIYE_ID) == 0)
                {
                    if (BirimSil(0, BELEDIYE_ID) == 0)
                    {
                        cmd = new SqlCommand("delete from BELEDIYE where BELEDIYE_ID=" + BELEDIYE_ID, con);
                        con.Open();
                        sonuc = cmd.ExecuteNonQuery();
                        con.Close();

                        return sonuc;
                    }
                    else
                        return sonuc;
                }
                else
                    return sonuc;

            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //Görüşme Sil
        public int GorusmeSil(int GORUSME_ID, int BIRIM_ID, int BELEDIYE_ID)
        {
            int sonuc = -1;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;

                con = new SqlConnection(ConnectionBelediye());
                if (BIRIM_ID == 0 & BELEDIYE_ID == 0)
                    cmd = new SqlCommand("delete from GORUSMELER where  GORUSME_ID=" + GORUSME_ID, con);
                else if (GORUSME_ID == 0 & BIRIM_ID == 0)
                    cmd = new SqlCommand("delete from GORUSMELER where  BELEDIYE_ID=" + BELEDIYE_ID, con);
                else if (GORUSME_ID == 0 & BELEDIYE_ID == 0)
                    cmd = new SqlCommand("delete from GORUSMELER where  BIRIM_ID=" + BIRIM_ID, con);
                con.Open();
                sonuc = cmd.ExecuteNonQuery();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //Birim Sil
        public int BirimSil(int BIRIM_ID, int BELEDIYE_ID)
        {
            int sonuc = -1;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                if (BELEDIYE_ID == 0)
                    cmd = new SqlCommand("delete from BIRIMLER where  BIRIM_ID=" + BIRIM_ID, con);
                else
                    cmd = new SqlCommand("delete from BIRIMLER where  BELEDIYE_ID=" + BELEDIYE_ID, con);
                con.Open();
                sonuc = cmd.ExecuteNonQuery();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //Birimleri  Getir
        public SqlDataReader BirimleriGetir(int BELEDIYE_ID)
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                cmd = new SqlCommand("select * from BIRIMLER where BELEDIYE_ID=" + BELEDIYE_ID + " order by KAYIT_ZAMANI desc ", con);
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //Görüşmeleri  Getir
        public SqlDataReader GorusmeleriGetir(int BIRIM_ID)
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                cmd = new SqlCommand("select * from GORUSMELER where BIRIM_ID=" + BIRIM_ID + " order by KAYIT_ZAMANI desc ", con);
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }


        //Kullanıcları  Getir
        public SqlDataReader KullanicilariGetir(int KULLANICI_ID)
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                if (KULLANICI_ID == 0)
                    cmd = new SqlCommand("select * from KULLANICILAR where   YETKI=2 OR YETKI=0   order by KULLANICI_ID desc ", con);
                else
                    cmd = new SqlCommand("select * from KULLANICILAR  where KULLANICI_ID= " + KULLANICI_ID+" and YETKI=1 and YETKI=0", con);
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //Birimleri  Getir
        public SqlDataReader BirimGetir(int BIRIM_ID)
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                cmd = new SqlCommand("select * from BIRIMLER where BIRIM_ID=" + BIRIM_ID, con);
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }

        //GÖRÜŞME  Getir
        public SqlDataReader GorusmeGetir(int GORUSME_ID)
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                cmd = new SqlCommand("select * from GORUSMELER where GORUSME_ID=" + GORUSME_ID, con);
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }


        //Kullanıcı Sil
        public int KullanicieSil(int KULLANICI_ID)
        {
            int sonuc = -1;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                 
                cmd = new SqlCommand("delete from KULLANICILAR where KULLANICI_ID=" + KULLANICI_ID, con);
                con.Open();
                sonuc = cmd.ExecuteNonQuery();
                con.Close();

                return sonuc;


            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }


        //Kullanıcı Sil
        public int SifreGuncelleme(int KULLANICI_ID, string sifre)
        {
            int sonuc = -1;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                cmd = new SqlCommand("select SIFRE,KULLANICI_ID from KULLANICILAR where KULLANICI_ID=" + KULLANICI_ID + " and SIFRE='" + sifre+"'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                { 
                    sonuc =0;

                }
                con.Close();


                return sonuc;


            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }


        //Kullanıcı  Getir
        public SqlDataReader KullaniciGetir(int KULLANICI_ID)
        {
            SqlDataReader sonuc = null;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
             
                    cmd = new SqlCommand("select * from KULLANICILAR where KULLANICI_ID="+KULLANICI_ID, con);
                
                con.Open();
                sonuc = cmd.ExecuteReader();
                return sonuc;
                con.Close();
            }
            catch (Exception exception)
            {
                return sonuc;
                Console.Write("'{0}' ", String.IsNullOrEmpty("hata") ? "<>" : "hata olustu");
            }
        }


    }
}