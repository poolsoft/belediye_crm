﻿using System;
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


                if (GorusmeSil(0, 0, BELEDIYE_ID) != 0)
                {
                    if (BirimSil(0, BELEDIYE_ID) != 0)
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
            int sonuc = 0;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;

                con = new SqlConnection(ConnectionBelediye());
                if (BIRIM_ID == 0 & BELEDIYE_ID == 0)
                    cmd = new SqlCommand("delete from GORUSME where  GORUSME_ID=" + GORUSME_ID, con);
                else if (GORUSME_ID == 0 & BIRIM_ID == 0)
                    cmd = new SqlCommand("delete from GORUSME where  BELEDIYE_ID=" + BELEDIYE_ID, con);
                else if (GORUSME_ID == 0 & BELEDIYE_ID == 0)
                    cmd = new SqlCommand("delete from GORUSME where  BIRIM_ID=" + BIRIM_ID, con);
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

        //Birim Sİl Sil
        public int BirimSil(int BIRIM_ID, int BELEDIYE_ID)
        {
            int sonuc = 0;
            try
            {
                SqlConnection con = null;
                SqlCommand cmd = null;
                con = new SqlConnection(ConnectionBelediye());
                if (BELEDIYE_ID == 0)
                    cmd = new SqlCommand("delete from BIRIM where  BIRIM_ID=" + BIRIM_ID, con);
                else
                    cmd = new SqlCommand("delete from BIRIM where  BELEDIYE_ID=" + BELEDIYE_ID, con);
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
                cmd = new SqlCommand("select * from BIRIMLER where BELEDIYE_ID="+BELEDIYE_ID+" order by KAYIT_ZAMANI desc ", con);
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