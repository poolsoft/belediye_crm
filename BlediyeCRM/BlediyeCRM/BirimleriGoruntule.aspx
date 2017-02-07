<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="BirimleriGoruntule.aspx.cs" Inherits="BlediyeCRM.pages.BirimleriGoruntule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                <div class="card-header" runat="server" id="geri">
                    <div class="btn btn-primary">
                        <a href="Belediyeleri_Goruntule.aspx" style="color: white"><i class="fa fa-mail-reply"></i>Geri Dön  </a>
                    </div>
                    &nbsp;&nbsp;
                    <asp:Button ID="btnYeniBirimEkle" runat="server" CssClass="btn btn-success" Text="YENİ BİRİM EKLE" Visible="True" OnClick="btnYeniBirimEkle_Click" />
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
                    <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
                </div>
                <div class="card-body no-padding">
                    <asp:Repeater ID="rptBIRIMLER" runat="server" OnItemCommand="rptBIRIMLER_ItemCommand" Visible="true" OnItemDataBound="rptBIRIMLER_ItemDataBound">
                        <HeaderTemplate>
                            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>BİRİM_ADI</th>
                                        <th>YETKİLİ_ADI</th>
                                        <th>GÖREVİ</th>
                                        <th>TELEFON </th>
                                        <th>GSM</th>
                                        <th>MAIL</th>
                                        <th>KAYIT_ZAMANI</th>
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
                                                <asp:Button ID="btnGorusmeEkle" runat="server" CssClass="btn btn-default" OnClick="btnGorusmeEkle_Click" Width="100%" CommandName="GORUSME" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Görüşmeler" /></li>
                                            <li>
                                                <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Birimi Görüntüle" /></li>
                                            <li>
                                                <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server" Width="100%" CommandName="SIL" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Sil" OnClientClick = "Confirm()" /> 
                                            </li>
                                        </ul>
                                    </div> 
                                </td>
                                <td> 
                                    <asp:Label ID="lblBELEDIYE_ID" runat="server" Text='<%# Eval("BELEDIYE_ID") %>' Visible="false"></asp:Label><%# Eval("BIRIM_ADI") %> 
                                </td>
                                <td><%# Eval("YETKILI_ADI") %></td>
                                <td><%# Eval("GOREVI") %></td>
                                <td>0<%# Eval("TELEFON") %></td>
                                <td>0<%# Eval("GSM") %></td>
                                <td><%# Eval("MAIL") %></td>
                                <td><%# Eval("KAYIT_ZAMANI") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>      
                        </FooterTemplate>
                    </asp:Repeater>


                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="Label2" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>


                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none; width: 300px">
                        <div class="header">
                            Bilgi
                        </div>
                        <div class="body">
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="footer" align="right">
                            <asp:Button ID="btnHide" runat="server" CssClass="no" Text="Kapat" />
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>
    </div>

    <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>


    

</asp:Content>
