﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="BirimleriGoruntule.aspx.cs" Inherits="BlediyeCRM.pages.BirimleriGoruntule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div class="row">
        <div class="col-xs-12">
            <div class="card">
                <div class="card-header">
                    <asp:Button ID="btnYeniBelediyeEkle" runat="server" CssClass="btn btn-success" Text="YENİ BELEDİYE EKLE" Visible="True" OnClick="btnYeniBelediyeEkle_Click" />
                    <br />
                    <br />
                    <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
                </div>
                <div class="card-body no-padding">
                    <asp:Repeater ID="rptBIRIMLER" runat="server" OnItemCommand="rptBIRIMLER_ItemCommand" Visible="true">
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
                                        <th>KAYIT_ZAMANI</th>
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
                                                    <asp:Button ID="btnSIL" CssClass="btn btn-danger" runat="server" CommandName="SIL" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Sil" />

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
                                                <asp:Button ID="btnGorusmeEkle" runat="server" CssClass="btn btn-default" OnClick="btnGorusmeEkle_Click" Width="100%" CommandName="BIRIM" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Birim Ekle" /></li>
                                            <li>
                                                <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="DETAY" /></li>
                                            <li>
                                                <button type="button" class="btn btn-default" data-toggle="modal" style="width: 100%" data-target="#myModal">SİL  </button>
                                            </li>
                                        </ul>
                                    </div>

                                </td>
                                <td><asp:Label ID="BELEDIYE_ID" Visible="false" runat="server" Text="<%# Eval("BELEDIYE_ID") %>"></asp:Label><%# Eval("BIRIM_ADI") %></td>
                                <td><%# Eval("YETKILI_ADI") %></td>
                                <td><%# Eval("GOREVI") %></td>
                                <td><%# Eval("TELEFON") %></td>
                                <td><%# Eval("GSM") %></td>
                                <td>0<%# Eval("MAIL") %></td> 
                                <td><%# Eval("KAYIT_ZAMANI") %></td>
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
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


</asp:Content>