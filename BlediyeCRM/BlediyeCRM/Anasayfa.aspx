<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="BlediyeCRM.Anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div class="btn-floating" id="help-actions">
        <div class="btn-bg"></div>
        <button type="button" class="btn btn-default btn-toggle" data-toggle="toggle" data-target="#help-actions">
            <i class="icon fa fa-plus"></i>
            <span class="help-text">Shortcut</span>
        </button>
        <div class="toggle-content">
            <ul class="actions">
                <li><a href="Belediyeleri_Goruntule.aspx">Belediyeleri Görüntüle</a></li>
                <li><a href="Belediye_Ekle.aspx">Belediye Ekle</a></li> 
            </ul>
        </div>
    </div>

   
    <div class="row">
        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
            <a class="card card-banner card-green-light">
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
            <a class="card card-banner card-blue-light">
                <div class="card-body">
                    <i class="icon fa fa-thumbs-o-up fa-4x"></i>
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
            <a class="card card-banner card-yellow-light">
                <div class="card-body">
                    <i class="icon fa fa-user-plus fa-4x"></i>
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
                    <div class="card-title">  </div>
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
                                <th>İşin Adı</th>
                                <th class="right">Miktarı</th>
                                <th>Durumu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Numaraj</td>
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
                            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">Numaraj</a>
                        </li>
                        <li role="tab2">
                            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">Yazılım</a>
                        </li>
                        <li role="tab3">
                            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">Tabela</a>
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
                                <ul class="chart-label">
                                    <li class="ct-label ct-series-a">Devam Eden</li>
                                    <li class="ct-label ct-series-b">Planlanan</li> 
                                </ul>
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
                     
                </div>
            </div>
        </div>
    </div>



</asp:Content>
