<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Gorusmeleri_Goruntule.aspx.cs" Inherits="BlediyeCRM.pages.Gorusmeleri_Goruntule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div class="row">

        <div style="right: 0; position: absolute; z-index: 10; bottom: 0; margin-right: 30px; margin-bottom: 30px" class=" btn btn-success">
            <i class="fa fa-plus"></i>
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="YENİ GÖRÜŞME EKLE" Visible="True" OnClick="Button1_Click" />
        </div>


        <div class="col-xs-12">
            <div class="card">
                <div class="card-header">
                    <div class="btn btn-primary">
                        <i class="fa fa-mail-reply"></i>
                        <a href="BirimleriGoruntule.aspx?BELEDIYE_ID=<%=Request.QueryString["BELEDIYE_ID"] %>" style="color: white">Geri Dön  </a>

                    </div>
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
                                        <th>GÖRÜŞME KONUSU</th>
                                        <th>HATIRLATMA</th>
                                        <th>SON DURUM</th>
                                        <th>NOTLAR </th>
                                        <th>GORUSME TARIHI </th>
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
                                                    <asp:Button ID="btnSIL" CssClass="btn btn-danger" runat="server" CommandName="SIL" CommandArgument='<%# Eval("GORUSME_ID") %>' Text="Sil" />

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
                                                <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("GORUSME_ID") %>' Text="Düzenle" /></li>
                                            <li>
                                                <button type="button" class="btn btn-default" data-toggle="modal" style="width: 100%" data-target="#myModal">Sil </button>
                                            </li>
                                        </ul>
                                    </div>

                                </td>


                                <td><%# Eval("GORUSME_KONUSU") %></td>
                                <td><%# Eval("HATIRLATMA_TARIHI") %></td>
                                <td><%# Eval("SON_DURUMU") %></td>
                                <td><%# Eval("GORUSME_NOTLARI") %></td>
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

</asp:Content>
