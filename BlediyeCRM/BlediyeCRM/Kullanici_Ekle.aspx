<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Kullanici_Ekle.aspx.cs" Inherits="BlediyeCRM.pages.Kullanici_Ekle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />


    <div class="row">

        <div class="col-md-12">
            <div class="card">

                <div class="card-header">
                    Yeni Kullanıcı Ekleme 
                </div>
                <div class="card-body">
                    <div class="row">

                        <div class="col-md-6">
                            <div class="section-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Ad Soyad</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtAdSoyad" MaxLength="80" CssClass="form-control" placeholder="Ad Soyad" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*** Ad Soyad yazmalısınız" ControlToValidate="txtAdSoyad" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Kullanıcı Adı</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtKadi" MaxLength="20" CssClass="form-control" placeholder="Kullanıcı adı  " runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*** Kullanıcı adı  yazmalısınız" ControlToValidate="txtKadi" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 control-label">Şifre</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtsifre" MaxLength="10" CssClass="form-control" placeholder="Şifre " runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*** Şifre yazmalısınız" ControlToValidate="txtsifre" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                  <div class="form-group">
                                    <label class="col-md-3 control-label">Yetki</label>
                                    <div class="col-md-9">
                                       
                                        
                                         <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                             <asp:ListItem>Yetki Seçiniz</asp:ListItem>
                                             <asp:ListItem>Admin</asp:ListItem>
                                             <asp:ListItem>Kullanıcı</asp:ListItem>
                                         </asp:DropDownList>
                                        
                                    </div>
                                </div>


                            </div>
                        </div>




                        <div class="form-group has-success">
                            <div class="col-md-9">
                                <br />
                                <asp:Button ID="btnKaydet" CssClass="btn btn-success" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" />
                                
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
                                <asp:Button ID="btnHide" runat="server" CssClass="no" Text="Kapat" />
                            </div>
                        </asp:Panel>



                    </div>
                </div>
            </div>
        </div>



    </div>

</asp:Content>
