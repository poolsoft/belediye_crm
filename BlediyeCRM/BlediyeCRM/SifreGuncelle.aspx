<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="SifreGuncelle.aspx.cs" Inherits="BlediyeCRM.pages.SifreGuncelle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />


    <div class="row">

        <div class="col-md-12">
            <div class="card"> 
                <div class="card-header">
                   Şifre Güncelle
                </div>
                <div class="card-body">
                    <div class="row">

                        <div class="col-md-6">
                            <div class="section-body">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Eski Şifre</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtsifreeski" MaxLength="80" TextMode="Password" CssClass="form-control" placeholder="Eski Şifre" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*** Eski şifreyi  yazmalısınız" ControlToValidate="txtsifreeski" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Yeni Şifre</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtsifreyeni" MaxLength="20" TextMode="Password" CssClass="form-control" placeholder="Yeni Şifre" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*** Şifre yazmalısınız" ControlToValidate="txtsifreyeni" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 control-label">Yeni Şifre(Tekrar)</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtsifretekrar" MaxLength="10" CssClass="form-control" TextMode="Password" placeholder="Yeni Şifre Tekrar " runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*** Şifre (Tekrar) yazmalısınız" ControlToValidate="txtsifretekrar" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                 
                            </div>
                        </div>




                        <div class="form-group has-success">
                            <div class="col-md-9">
                                <br />
                                <asp:Button ID="btnGuncelle" CssClass="btn btn-success" runat="server" Text="Güncelle" OnClick="btnGuncelle_Click1" />
                               
                                <asp:Label ID="lblMesaj" runat="server" Text="" Visible="false"></asp:Label>
                            </div>
                        </div>


                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="Label1" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>
                      
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
