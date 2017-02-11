<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="BlediyeCRM.Anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <div class="row">
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
            <a class="card card-banner card-green-light" href="Belediyeleri_Goruntule.aspx">
                <div class="card-body">
                    <i class="icon fa fa-building fa-4x"></i>
                    <div class="content">
                        <div class="title">Belediye Sayısı</div>
                        <div class="value">
                            <span class="sign"></span>
                            <asp:Label ID="lblBelAdet" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
            <a class="card card-banner card-blue-light" href="BirimleriGoruntule.aspx">
                <div class="card-body">
                    <i class="icon fa fa-building-o fa-4x"></i>
                    <div class="content">
                        <div class="title">Birim Sayısı</div>
                        <div class="value">
                            <span class="sign"></span>
                            <asp:Label ID="lblBirimAdet" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
            <a class="card card-banner card-yellow-light" href="Gorusmeleri_Goruntule.aspx">
                <div class="card-body">
                    <i class="icon fa fa-phone fa-4x"></i>
                    <div class="content">
                        <div class="title">Görüşme Sayısı</div>
                        <div class="value">
                            <span class="sign"></span>
                            <asp:Label ID="lblGorusme" runat="server" Text="Label"></asp:Label>

                        </div>
                    </div>
                </div>
            </a>

        </div>
    </div>

    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card card-mini">
                <div class="card-header">
                    <div class="card-title">İŞİN DURUMU </div>
                    <ul class="card-action">
                        <li>
                            <a href="/">
                                <i class="fa fa-refresh"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="card-body no-padding table-responsive">
                    <table class="table card-table">
                        <thead>
                            <tr>
                                <th>İŞİn Adı</th>
                                <th class="right">Mİktarı</th>
                                <th>Durumu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Numarataj</td>
                                <td class="right">-</td>
                                <td><span class="badge badge-warning badge-icon"><i class="fa fa-clock-o" aria-hidden="true"></i><span>Bekliyor</span></span></td>
                            </tr>
                            <tr>
                                <td>Yazılım</td>
                                <td class="right">-</td>
                                <td><span class="badge badge-success badge-icon"><i class="fa fa-check" aria-hidden="true"></i><span>Tamamlandı</span></span></td>
                            </tr>
                            <tr>
                                <td>Tabela</td>
                                <td class="right">-</td>
                                <td><span class="badge badge-info badge-icon"><i class="fa fa-credit-card" aria-hidden="true"></i><span>3. Hakediş</span></span></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card card-tab card-mini">
                <div class="card-header">
                    <ul class="nav nav-tabs tab-stats">
                        <li role="tab1" class="active">
                            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">3 Gün</a>
                        </li>
                        <li role="tab2">
                            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">7 Gün</a>
                        </li>
                        <li role="tab3">
                            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">15 Gün</a>
                        </li>
                        <li role="tab4">
                            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">30 Gün</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body tab-content">
                    <div role="tabpanel" class="tab-pane active" id="tab1">
                        <div class="row">
                            <div class="col-sm-8">
                                <%-- <div class="chart ct-chart-browser ct-perfect-fourth"></div>--%>
                            </div>
                            <div class="col-sm-4">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <br />
                                                <br />
                                                <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
                                            </div>
                                            <div class="card-body no-padding">
                                                <asp:Repeater ID="rptUcGun" runat="server" OnItemCommand="rptUcGun_ItemCommand" Visible="true" OnItemDataBound="rptUcGun_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                                            <thead>
                                                                <tr>
                                                                    <th></th>
                                                                    <th>GÖRÜŞME_KONUSU</th>
                                                                    <th>SON_DURUM</th>
                                                                    <th>GÖRÜŞMEYİ_YAPAN_KİŞİ</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <div class="dropdown">
                                                                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                                                        Menu
                                         <span class="caret"></span>
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li>
                                                                            <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("GORUSME_ID") %>' Text="Görüşmeyi Görüntüle" /></li>
                                                                        <li>
                                                                            <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server" Width="100%" CommandName="SIL" CommandArgument='<%# Eval("GORUSME_ID") %>' Text="Sil" OnClientClick="Confirm()" />

                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </td>

                                                            <td><%# Eval("GORUSME_KONUSU") %></td>
                                                            <td><%# Eval("SON_DURUMU") %></td>
                                                            <td><%# Eval("KULLANICI_ADI") %></td>
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
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="tab2">
                        <div class="row">
                            <div class="col-sm-8">
                                <%-- <div class="chart ct-chart-os ct-perfect-fourth"></div>--%>
                            </div>
                            <div class="col-sm-4">
                                <ul class="chart-label">
                                    <li class="ct-label ct-series-a">Devam Eden</li>
                                    <li class="ct-label ct-series-b">Planlanan</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="tab3">
                        <div class="row">
                            <div class="col-sm-8">
                                <%--  <div class="chart ct-chart-os ct-perfect-fourth"></div>--%>
                            </div>
                            <div class="col-sm-4">
                                <ul class="chart-label">
                                    <li class="ct-label ct-series-a">Devam Eden</li>
                                    <li class="ct-label ct-series-b">Planlanan</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div role="tabpanel" class="tab-pane" id="tab4">
                        <div class="row">
                            <div class="col-sm-8">
                                <%--  <div class="chart ct-chart-os ct-perfect-fourth"></div>--%>
                            </div>
                            <div class="col-sm-4">
                                <ul class="chart-label">
                                    <li class="ct-label ct-series-a">Devam Eden</li>
                                    <li class="ct-label ct-series-b">Planlanan</li>
                                </ul>
                            </div>
                        </div>
                    </div>




                </div>
            </div>
        </div>
    </div>






</asp:Content>
