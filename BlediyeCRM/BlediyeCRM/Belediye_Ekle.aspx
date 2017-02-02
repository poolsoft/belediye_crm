<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Belediye_Ekle.aspx.cs" Inherits="BlediyeCRM.pages.Belediye_Ekle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="row">

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="btn btn-primary">
                        
                        <a href="Belediyeleri_Goruntule.aspx" style="color: white"><i class="fa fa-mail-reply"></i>Geri Dön  </a>
                    </div>
                </div>
                <div class="card-header">
                    Belediye İşlemleri
                </div>
                <div class="card-body">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="section-body">

                                        <div class="form-group">
                                            <label class="col-md-3 control-label">İL</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtIl"   MaxLength="15" CssClass="form-control" placeholder="İl" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*** İl yazmalısınız" ControlToValidate="txtIl" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-md-3 control-label">BELEDİYE ADI</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtBelediye"   MaxLength="150" CssClass="form-control" placeholder="Belediye Adı" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*** Belediye adı yazmalısınız" ControlToValidate="txtBelediye" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-md-3 control-label">NÜFUS SAYISI</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtNufusSayisi"   CssClass="form-control" TextMode="Number" placeholder=" Nüfus Sayısı" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*** Nüfus yazmalısınız." ControlToValidate="txtNufusSayisi" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-md-3 control-label">BELEDİYE BAŞKAN_ADI</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtBelediyeBaskaniAdi"   CssClass="form-control" placeholder="Belediye Başkanı Adı" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*** Belediye başkan adını yazmalısınız." ControlToValidate="txtBelediyeBaskaniAdi" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>



                                        <div class="form-group">
                                            <label class="col-md-3 control-label">TELEFON</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtTelefon"   TextMode="Number" CssClass="form-control" placeholder="Telefon Numarası" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*** 
                                    Telefon  yazmalısınız"
                                                    ControlToValidate="txtTelefon" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-md-3 control-label">NOT AÇIKLAMA</label>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="txtNot"   TextMode="MultiLine" CssClass="form-control" placeholder="Not - Açıklama" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*** Not  yazmalısınız" ControlToValidate="txtNot" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                    </div>
                                </div>



                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">İLÇE</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtIlce" Enabled="false" MaxLength="100" CssClass="form-control" placeholder="İlçe" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*** İlçe yazmalısınız" ControlToValidate="txtIlce" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="col-md-3 control-label">BELEDİYE TÜRÜ</label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="DDBElediyeTuru"   CssClass="form-control" runat="server" AutoPostBack="false" OnSelectedIndexChanged="DDBElediyeTuru_SelectedIndexChanged"></asp:DropDownList>
                                            <br />
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-md-3 control-label">PARTİSİ</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtPartisi" Enabled="false" MaxLength="8" CssClass="form-control" placeholder="Partisi" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*** Parti adını yazmalısınız..." ControlToValidate="txtPartisi" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>




                                    <div class="form-group">
                                        <label class="col-md-3 control-label">BELEDİYE ADRESİ</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtBelediyeAdresi"   TextMode="MultiLine" MaxLength="200" CssClass="form-control" placeholder="Belediye Adresi" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*** Belediye adresi yazmalısınız" ControlToValidate="txtBelediyeAdresi" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                     

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">LİSANS DURUMU</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtLisans" CssClass="form-control"   placeholder="Lisans Durumu" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*** CBS Yazılım  yazmalısınız" ControlToValidate="txtTelefon" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>


                                      <div class="form-group">
                                        <label class="col-md-3 control-label">CBS YAZILIMI</label>
                                        <div class="col-md-9">
                                            <div>
                                                <div>
                                                    <asp:RadioButton ID="rdVAR" GroupName="a" runat="server" Text="VAR" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp; 
                                                <asp:RadioButton ID="rdYOK" GroupName="a" runat="server" Text="YOK" />
                                                    <br />
                                                    <br />
                                                </div>

                                            </div>
                                        </div>
                                    </div>



                                      <div class="form-group">
                                        <label class="col-md-3 control-label">NUMARATAJ(ABS)</label>
                                        <div class="col-md-9">
                                            <div>
                                                <div>
                                                    <asp:RadioButton ID="rdNumaratajVAR" GroupName="b" runat="server" Text="VAR" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp; 
                                                <asp:RadioButton ID="rdNumaratajYOK" GroupName="b" runat="server" Text="YOK" />
                                                    <br />
                                                    <br />
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                      <div class="form-group">
                                        <label class="col-md-3 control-label">NUMARATAJ_TABELASI</label>
                                        <div class="col-md-9">
                                            <div>
                                                <div>
                                                    <asp:RadioButton ID="rdTabelaVAR" GroupName="c" runat="server" Text="VAR" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp; 
                                                <asp:RadioButton ID="rdTabelaYOK" GroupName="c" runat="server" Text="YOK" />
                                                    <br />
                                                    <br />
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                </div>

                                <div class="form-group has-success">
                                    <div class="col-md-9">
                                        <asp:Button ID="btnDuzenle" runat="server" Text="Düzenle" CssClass="btn btn-primary" OnClick="btnDuzenle_Click"/>
                                        <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Visible="false" OnClick="Button2_Click" Text="Kaydet" />
                                         <asp:Button ID="btnIptal" CssClass="btn btn-primary" runat="server" Visible="false" OnClick="btnIptal_Click" Text="İptal" />
                                        <br />
                                    </div>
                                </div>


                            </div>


                            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="Panel1" TargetControlID="lblMesaj" BackgroundCssClass="modalBackground" CancelControlID="btnHide">
                            </ajaxToolkit:ModalPopupExtender>

                            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none; width: 200px">
                                <div class="header">
                                    Bilgi
                                </div>
                                <div class="body">
                                    <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="footer" align="right">
                                    <asp:Button ID="btnHide" runat="server" CssClass="no" Text="Kapat" />
                                </div>
                            </asp:Panel>

                        </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Button2" />
                        </Triggers>

                    </asp:UpdatePanel>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
