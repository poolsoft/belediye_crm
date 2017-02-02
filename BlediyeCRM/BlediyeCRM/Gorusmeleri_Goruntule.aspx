<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Gorusmeleri_Goruntule.aspx.cs" Inherits="BlediyeCRM.pages.Gorusmeleri_Goruntule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <script src="assets/js/Loading.js"></script>


     <div class="row">
        <div class="col-xs-12">
            <div class="card">
                <div class="card-header">
                   <div class="btn btn-primary">
                       
                        <a href="BirimleriGoruntule.aspx?BELEDIYE_ID=<%=Request.QueryString["BELEDIYE_ID"] %>" style="color: white"> <i class="fa fa-mail-reply"></i>Geri Dön  </a> 
                    </div>
                     &nbsp;&nbsp; <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="YENİ GÖRÜŞME EKLE" Visible="True" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>



     

    <div class="row">
        <div class="col-xs-12">
            <div class="card">
                
                <div class="card-header"  >
                     <br /> <br />
                    <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
                </div>
                <div class="card-body no-padding">
                    <asp:Repeater ID="rptBIRIMLER" runat="server" OnItemCommand="rptBIRIMLER_ItemCommand" Visible="true" OnItemDataBound="rptBIRIMLER_ItemDataBound">
                        <HeaderTemplate>
                            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>GÖRÜŞME_KONUSU</th>
                                        <th>HATIRLATMA</th>
                                        <th>SON_DURUM</th> 
                                        <th>GORUSME TARIHI </th>
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
                                                 <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server"  Width="100%" CommandName="SIL" CommandArgument='<%# Eval("GORUSME_ID") %>' Text="Sil" />
                                                 
                                            </li>
                                        </ul>
                                    </div>

                                </td>


                                <td><%# Eval("GORUSME_KONUSU") %></td>
                                <td><%# Eval("HATIRLATMA_TARIHI") %></td>
                                <td><%# Eval("SON_DURUMU") %></td> 
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
