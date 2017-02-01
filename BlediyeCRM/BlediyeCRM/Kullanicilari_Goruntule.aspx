<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Kullanicilari_Goruntule.aspx.cs" Inherits="BlediyeCRM.pages.Kullanicilari_Goruntule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     

    <div class="row">

        <div class="col-xs-12">
            <div class="card">

                <div class="card-header">

                    <asp:Button ID="btnYeniKullanici" runat="server" CssClass="btn btn-success" Text="YENİ KULLANICI EKLE" Visible="True" OnClick="btnYeniKullanici_Click" />

                </div>

                <div class="card-header">
                    Kullanıcılar 
                     
                </div>
                <div class="card-header" style="right: 0; position: absolute; z-index: 10; bottom: 0">
                    &nbsp;&nbsp;
                    <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
                </div>
                <div class="card-body no-padding">
                    <asp:Repeater ID="rptBIRIMLER" runat="server" OnItemCommand="rptBIRIMLER_ItemCommand" Visible="true">
                        <HeaderTemplate>
                            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>AD SOYAD</th>
                                        <th>KULLANICI ADI</th>
                                        <th>YETKİ</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>

                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="myModalLabel">Silmek istediğinize emin misiniz?</h4>
                                                </div>
                                                <div class="modal-body">

                                                    <asp:Label ID="lblMesaja" runat="server" Text="Bu belediyeyi silerseniz, belediyeye bağlı birimler ve görüşmelerde silinecektir."></asp:Label>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                                    <asp:Button ID="btnSIL" CssClass="btn btn-danger" runat="server" CommandName="SIL" CommandArgument='<%# Eval("KULLANICI_ID") %>' Text="Sil" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="dropdown">
                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                            Menu
                                         <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">

                                            <li>
                                                <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("KULLANICI_ID") %>' Text="Düzenle" /></li>
                                            <li>
                                                <button type="button" class="btn btn-default" data-toggle="modal" style="width: 100%" data-target="#myModal">Sil </button>
                                            </li>
                                        </ul>
                                    </div>

                                </td>


                                <td><%# Eval("ADSOYAD") %></td>
                                <td><%# Eval("KADI") %></td>
                                <td>KULLANICI</td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>      
                        </FooterTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
