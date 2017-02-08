<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Belediyeleri_Goruntule.aspx.cs" Inherits="BlediyeCRM.pages.Belediyeleri_Goruntule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="assets/js/Loading.js"></script>




   

    <asp:Panel ID="pnl" runat="server" Visible="true" CssClass="row">
         
         <div class="row">
        <div class="col-xs-12">
            <div class="card">
                <div class="card-header" runat="server" id="geri">
                    <div class="btn btn-primary">
                        <a href="IlSecimi.aspx" style="color: white">
                            <i class="fa fa-mail-reply"></i>
                            Geri Dön 
                        </a>
                    </div>
                    &nbsp;&nbsp;
                   <asp:Button ID="btnYeniBelediyeEkle" runat="server" CssClass="btn btn-success" Text="YENİ BELEDİYE EKLE" Visible="True" OnClick="btnYeniBelediyeEkle_Click" />
                </div>
            </div>
        </div>
    </div>


        <script type="text/javascript">
            function Confirm() {
                var confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                if (confirm("Silmek istediğinize eminmisiniz?")) {
                    confirm_value.value = "Evet";
                } else {
                    confirm_value.value = "Hayır";
                }
                document.forms[0].appendChild(confirm_value);
            }
        </script>

        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
                        <br />
                        <br />
                        <asp:Label ID="lblMesaj" runat="server" Text="asd"></asp:Label>
                    </div>
                    <div class="card-body no-padding">
                        <asp:Repeater ID="rptBELEDIYE" runat="server" OnItemCommand="rptYAPI_ItemCommand" Visible="true" OnDataBinding="rptBELEDIYE_DataBinding" OnInit="rptBELEDIYE_Init" OnLoad="rptBELEDIYE_Load" OnItemDataBound="rptBELEDIYE_ItemDataBound">
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
                                            <th>PARTİSİ</th>
                                            <th>TELEFON</th>
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
                                                    <asp:Button ID="btnBirimEkle" runat="server" CssClass="btn btn-default" OnClick="btnBirimEkle_Click" Width="100%" CommandName="BIRIM" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Birimler" /></li>
                                                <li>
                                                    <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Belediyeyi Görüntüle" /></li>
                                                <li>
                                                    <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server" Width="100%" CommandName="SIL" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Sil" OnClientClick="Confirm()" />
                                                </li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td><%# Eval("IL") %></td>
                                    <td><%# Eval("ILCE") %></td>
                                    <td><%# Eval("BELEDIYE") %></td>
                                    <td><%# Eval("BELEDIYE_TURU") %></td>
                                    <td><%# Eval("NUFUS") %></td>
                                    <td><%# Eval("PARTISI") %></td>
                                    <td>0<%# Eval("TELEFON") %></td>
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


    </asp:Panel>

</asp:Content>
