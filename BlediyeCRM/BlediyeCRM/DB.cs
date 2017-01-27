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

                cmd = new SqlCommand("select * from KULLANICILAR WHERE KADI='"+kadi+"' and SIFRE='"+sifre+"'", con);

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
   
         
    
    
    
    
    
    
    
    
    
    
    
    }
}