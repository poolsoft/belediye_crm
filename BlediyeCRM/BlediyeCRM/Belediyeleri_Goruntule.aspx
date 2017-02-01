<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Belediyeleri_Goruntule.aspx.cs" Inherits="BlediyeCRM.pages.Belediyeleri_Goruntule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div class="btn-floating" id="help-actions" style="right:42%; left:42%">
    <div class="btn btn-primary" >
        <i class="fa fa-plus"></i>
        <asp:Button ID="btnYeniBelediyeEkle" runat="server" CssClass="btn btn-primary" Text="YENİ BELEDİYE EKLE" Visible="True" OnClick="btnYeniBelediyeEkle_Click" />
    </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="card">

                <div class="card-header">
                    <br />
                    <asp:Label ID="lblMesaj" runat="server" Text="asd"></asp:Label>
                </div>
                <div class="card-body no-padding">
                    <asp:Repeater ID="rptBELEDIYE" runat="server" OnItemCommand="rptYAPI_ItemCommand" Visible="true">
                        <HeaderTemplate>
                            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>IL</th>
                                        <th>ILCE</th>
                                        <th>BELEDIYE </th>
                                        <th>BELEDIYE_TURU</th>
                                        <th>NUFUS</th>
                                        <th>TELEFON</th>
                                        <th>NOT_ACIKLAMA</th>
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
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel">Silmek istediğinize emin misiniz?</h4>
                                                </div>
                                                <div class="modal-body">

                                                    <asp:Label ID="lblMesaja" runat="server" Text="Bu belediyeyi silerseniz, belediyeye bağlı birimler ve görüşmelerde silinecektir."></asp:Label>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>

                                                    <asp:Button ID="btnSIL" CssClass="btn btn-danger" runat="server" CommandName="SIL" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Sil" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <%--  <asp:Button ID="btnBirimEkle" CssClass="btn btn-success" runat="server" CommandName="BIRIM" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Birim Ekle" OnClick="btnBirimEkle_Click" /> --%>

                                    <div class="dropdown">
                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                            Menu
                                         <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <asp:Button ID="btnBirimEkle" runat="server" CssClass="btn btn-default" OnClick="btnBirimEkle_Click" Width="100%" CommandName="BIRIM" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Birimler" /></li>
                                            <li>
                                                <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Düzenle" /></li>
                                            <li>
                                                <button type="button" class="btn btn-default" data-toggle="modal" style="width: 100%" data-target="#myModal">Sil  </button>
                                            </li>
                                        </ul>
                                    </div>

                                </td>
                                <td><%# Eval("IL") %></td>
                                <td><%# Eval("ILCE") %></td>
                                <td><%# Eval("BELEDIYE") %></td>
                                <td><%# Eval("BELEDIYE_TURU") %></td>
                                <td><%# Eval("NUFUS") %></td>
                                <td>0<%# Eval("TELEFON") %></td>
                                <td><%# Eval("NOT_ACIKLAMA") %></td>
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


    <%--<script type="text/javascript" src="../assets/js/vendor.js"></script>
    <script type="text/javascript" src="../assets/js/app.js"></script>--%>
</asp:Content>
