<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Bilgilerimi_Guncelle.aspx.cs" Inherits="BlediyeCRM.pages.Bilgilerimi_Guncelle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <br />


    <div class="row">

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    Bilgilerimi Güncelle
                </div>
                <div class="card-body">
                    <div class="row">

                        <div class="col-md-6">
                            <div class="section-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Ad Soyad</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtAdsoyad" MaxLength="80" CssClass="form-control" placeholder="Ad soyad" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*** Ad Soyad yazmalısınız" ControlToValidate="txtAdsoyad" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">KADI</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtKadi" MaxLength="20" CssClass="form-control" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*** Kullanıcı adı  yazmalısınız" ControlToValidate="txtKadi" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>




                            </div>
                        </div>




                        <div class="form-group has-success">
                            <div class="col-md-9">
                                <br />
                                <asp:Button ID="btnGuncelle" CssClass="btn btn-success" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click" />

                                <asp:Label ID="lblMesaj" runat="server" Text="" Visible="false"></asp:Label>
                            </div>
                        </div>


                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="Panel1" TargetControlID="Label1" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>


                        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none; width: 300px">
                            <div class="header">
                                Bilgi
                            </div>
                            <div class="body">
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="footer" align="right">
                                <span id="btnHide" class="no"><a href="../Default.aspx">Çıkış Yap</a> </span>
                            </div>
                        </asp:Panel>



                    </div>
                </div>
            </div>
        </div>



    </div>

</asp:Content>
