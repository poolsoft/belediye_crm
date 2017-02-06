<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" UICulture="tr" Culture="tr-TR" AutoEventWireup="true" CodeBehind="Gorusme_Ekle.aspx.cs" Inherits="BlediyeCRM.pages.Gorusme_Ekle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="btn btn-primary">

                        <a href="Gorusmeleri_Goruntule.aspx?BELEDIYE_ID=<%=(Request.QueryString["BELEDIYE_ID"]) %>&BIRIM_ID=<%=Convert.ToInt32(Request.QueryString["BIRIM_ID"]) %>" style="color: white"><i class="fa fa-mail-reply"></i>Geri Dön  </a>
                    </div>
                </div>

                <div class="card-header">
                    Görüşme İşlemleri
                </div>

                <div class="card-body">

                    <div class="row">

                        <div class="col-md-6">
                            <div class="section-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">GÖRÜŞME KONUSU</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtGorusme" MaxLength="100" CssClass="form-control" placeholder="Görüşme Konusu" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*** Görüsme Konusu yazmalısınız" ControlToValidate="txtGorusme" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">SON DURUM</label>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddSonDurum" CssClass="form-control" runat="server">
                                            <asp:ListItem>Son Durum Seciniz</asp:ListItem>
                                            <asp:ListItem>OLDU/OLACAK</asp:ListItem>
                                            <asp:ListItem>COK YAKIN</asp:ListItem>
                                            <asp:ListItem>OLACAK</asp:ListItem>
                                            <asp:ListItem>OLMA IHTIMALI YUKSEK</asp:ListItem>
                                            <asp:ListItem>OLABILIR</asp:ListItem>
                                            <asp:ListItem>OLMA IHTIMALI VAR</asp:ListItem>
                                            <asp:ListItem>DUSUNULUYOR</asp:ListItem>
                                            <asp:ListItem>DUSUNULECEK</asp:ListItem>
                                            <asp:ListItem>OLMADI</asp:ListItem>
                                        </asp:DropDownList>
                         <%-- <asp:TextBox ID="txtSonDurum" MaxLength="150" CssClass="form-control" placeholder="Son durumu yazmalısınız" runat="server"></asp:TextBox>--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*** Son durum yazmalısınız" ControlToValidate="ddSonDurum" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">DOSYA EKLE</label>
                                    <div class="col-md-9">
                                        <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                                        <asp:LinkButton ID="dosya" runat="server"  Visible="false" OnClick="dosya_Click">DOSYA indir</asp:LinkButton><br />
                                    </div>
                                </div>



                                <div class="form-group" runat="server" id="gorusmeYapan" visible="false">
                                    <label class="col-md-3 control-label">GÖRÜŞMEYİ YAPAN KİŞİ</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtGORUSMEYI_YAPAN_KISI" Enabled="false" MaxLength="80" CssClass="form-control" placeholder="Son durumu yazmalısınız" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group" runat="server" id="gorusmeTarihi" visible="false">
                                    <label class="col-md-3 control-label">GÖRÜŞMENİN TARİHİ</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtTARIH" Enabled="false" MaxLength="50" CssClass="form-control" placeholder="Son durumu yazmalısınız" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-6">

                            <div class="form-group">
                                <label class="col-md-3 control-label">HATIRLATMA TARİHİ</label>
                                <div class="col-md-9">
                                    <asp:ScriptManager ID="ScriptManager2" runat="server" EnableScriptGlobalization="true"></asp:ScriptManager>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="imgPopup" runat="server" TargetControlID="txtHatirlatmaTarihi"
                                        Format="dd/MM/yyyy" />
                                    <div style="right: 0; width: 5%; z-index: 10; margin-right: 30px; margin-top: 5px; position: absolute">
                                        <asp:ImageButton ID="imgPopup" ImageUrl="~/assets/images/calendar.png" ImageAlign="Bottom" runat="server" Width="30px" />
                                    </div>
                                    <asp:TextBox ID="txtHatirlatmaTarihi" MaxLength="100" CssClass="form-control" placeholder="Hatırlatma tarihi" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*** Hatırlatma tarihi yazmalısınız" ControlToValidate="txtHatirlatmaTarihi" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">GÖRÜŞME NOTLARI</label>
                                <div class="col-md-9">

                                    <asp:TextBox ID="txtGorusmeNotlari" TextMode="MultiLine" MaxLength="1500" Height="150px" CssClass="form-control" placeholder="Görüşme notları" runat="server"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*** Görüşme notları yazmalısınız" ControlToValidate="txtGorusmeNotlari" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>

                        <div class="form-group has-success">
                            <div class="col-md-9">
                                <asp:Button ID="btnDuzenle" runat="server" Text="Düzenle" CssClass="btn btn-primary" Visible="false" OnClick="btnDuzenle_Click" />
                                <asp:Button ID="btnKaydet" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" />
                                <asp:Button ID="btnIptal" runat="server" Text="İptal" CssClass="btn btn-primary" OnClick="btnIptal_Click" />
                                <br />
                                <br />
                                <asp:Label ID="lblMesaj" runat="server" Text="" Visible="false"></asp:Label>
                            </div>
                        </div>


                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="Panel1" TargetControlID="Label1" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>


                        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none; width: 300px">
                            <div class="header">
                                Bilgi
                            </div>
                            <div class="body">
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="footer" align="right">
                                <asp:Button ID="btnHide" runat="server" CssClass="no" Text="Kapat" />
                            </div>
                        </asp:Panel>



                    </div>
                </div>
            </div>
        </div>

    </div>



</asp:Content>
