<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Raporlama.aspx.cs" Inherits="BlediyeCRM.Raporlama" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Raporlama İşlemleri
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-body">

                                <div class="form-group" id="RaporlamaIstenilenBolum" runat="server" visible="true">
                                    <label class="col-md-3 control-label">Raporlama İstenilen Bölümler</label>
                                    <div class="col-md-9">
                                        <asp:RadioButton ID="rdBirim" runat="server" AutoPostBack="true" Text="Birimleri Filtreleme" GroupName="a" OnCheckedChanged="rdBirim_CheckedChanged" />
                                        &nbsp;
                                        <asp:RadioButton ID="rdGorusme" runat="server" AutoPostBack="true" Text="Görüşme Filtreleme" GroupName="a" OnCheckedChanged="rdGorusme_CheckedChanged" />
                                        <br />
                                        <hr />
                                    </div>
                                </div>

                                <div class="form-group" id="filtreleme" runat="server" visible="true">
                                    <label class="col-md-3 control-label">Filtrelenecek Özellikler</label>
                                    <div class="col-md-9">
                                        <asp:ListBox ID="listozellikler" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="listozellikler_SelectedIndexChanged"></asp:ListBox>
                                        <hr />
                                    </div>
                                </div>

                                <div class="form-group" runat="server" id="cbsyazilimi" visible="false">
                                    <label class="col-md-3 control-label">CBS YAZILIMI</label>
                                    <div class="col-md-9">
                                        <asp:RadioButton ID="cbsVar" GroupName="a" runat="server" Text="VAR" />
                                        &nbsp;<asp:RadioButton ID="cbsYok" GroupName="a" runat="server" Text="YOK" />
                                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Red" OnClick="LinkButton1_Click">X iptal</asp:LinkButton>
                                    </div>
                                </div>

                                <div class="form-group" runat="server" id="numarataj" visible="false">
                                    <label class="col-md-3 control-label">NUMARATAJ(ABS)</label>
                                    <div class="col-md-9">
                                        <asp:RadioButton ID="numVar" GroupName="b" runat="server" Text="VAR" />
                                        &nbsp;<asp:RadioButton ID="numYok" GroupName="b" runat="server" Text="YOK" />
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Red" OnClick="LinkButton2_Click">X iptal</asp:LinkButton>
                                    </div>
                                </div>

                                <div class="form-group" runat="server" id="tabela" visible="false">
                                    <label class="col-md-3 control-label">NUMARATAJ TABELASI</label>
                                    <div class="col-md-9">
                                        <asp:RadioButton ID="tabVar" GroupName="c" runat="server" Text="VAR" />
                                        &nbsp;<asp:RadioButton ID="tabYok" GroupName="c" runat="server" Text="YOK" />
                                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" ForeColor="Red" OnClick="LinkButton3_Click">X iptal</asp:LinkButton>
                                    </div>
                                </div>


                                <div class="form-group" runat="server" id="tarihAraligi" visible="false">
                                    <label class="col-md-3 control-label">Tarih Seçiniz</label>
                                    <div class="col-md-9">
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" PopupButtonID="ImageButton1" runat="server" TargetControlID="txtTARIH"
                                            Format="yyyy/MM/dd" />
                                        <div style="right: 0; width: 5%; z-index: 10; margin-right: 30px; margin-top: 5px; position: absolute">
                                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/assets/images/calendar.png" ImageAlign="Bottom" runat="server" Width="30px" />
                                        </div>
                                        <asp:TextBox ID="txtTARIH" MaxLength="100" Enabled="false" CssClass="form-control" placeholder="Başlangıç tarihi" runat="server"></asp:TextBox>

                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" PopupButtonID="ImageButton2" runat="server" TargetControlID="bitisTarihi"
                                            Format="yyyy/MM/dd" />
                                        <div style="right: 0; width: 5%; z-index: 10; margin-right: 30px; margin-top: 5px; position: absolute">
                                            <asp:ImageButton ID="ImageButton2" ImageUrl="~/assets/images/calendar.png" ImageAlign="Bottom" runat="server" Width="30px" />
                                        </div>
                                        <asp:TextBox ID="bitisTarihi" MaxLength="100" CssClass="form-control" Enabled="false" placeholder="Bitiş tarihi" runat="server"></asp:TextBox>

                                        <asp:DropDownList ID="ddIl" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddIl_SelectedIndexChanged" OnDataBound="ddIl_DataBound" BackColor="White"></asp:DropDownList>
                                        <br />
                                        <asp:DropDownList ID="DDADSOYAD" runat="server" CssClass="form-control" OnSelectedIndexChanged="DDADSOYAD_SelectedIndexChanged" OnDataBound="DDADSOYAD_DataBound" BackColor="White"></asp:DropDownList>

                                        &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" ForeColor="Red" OnClick="LinkButton4_Click">X iptal</asp:LinkButton>
                                    </div>
                                </div>

                                <hr />
                                <div class="form-group has-success">
                                    <div class="col-md-9">

                                        <asp:Button ID="btnGorusme" runat="server" Visible="false" Text="Rapor Oluştur" OnClick="btnGorusme_Click" CssClass="btn btn-primary" />
                                        <asp:Button ID="btnPrintGorusme" runat="server" CssClass="btn btn-warning" Visible="false" Text="Yazdır" OnClick="btnPrintGorusme_Click" />


                                        <asp:Button ID="btnRaporOlusturGorusme" runat="server" Visible="false" Text="Rapor Oluştur" OnClick="btnRaporOlusturGorusme_Click" CssClass="btn btn-primary" />
                                        <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-warning" Visible="false" Text="Yazdır" OnClick="btnPrint_Click" />
                                        <br />
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="" Visible="true"></asp:Label>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
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





    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div class="row" id="print" runat="server">
        <div class="col-xs-12">
            <div class="card">
                <div class="card-header">
                    <br />
                    <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
                </div>
                <div class="card-body no-padding">
                    <asp:Repeater ID="rptBIRIMLERRapor" runat="server" OnItemCommand="rptBIRIMLERRapor_ItemCommand" Visible="true" OnItemDataBound="rptBIRIMLERRapor_ItemDataBound">
                        <HeaderTemplate>
                            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>IL</th>
                                        <th>ILCE</th>
                                        <th>BİRİM_ADI</th>
                                        <th>YETKİLİ_ADI</th>
                                        <th>GÖREVİ</th>
                                        <th>KAYIT_ZAMANI</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="dropdown" id="menu" runat="server">
                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                            Menu
                                         <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Birimi Görüntüle" /></li>
                                            <li>
                                                <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server" Width="100%" CommandName="SIL" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Sil" OnClientClick="Confirm()" />
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                                <td><%# Eval("IL") %></td>
                                <td><%# Eval("ILCE") %></td>
                                <td>
                                    <asp:Label ID="lblBELEDIYE_ID" runat="server" Text='<%# Eval("BELEDIYE_ID") %>' Visible="false"></asp:Label><%# Eval("BIRIM_ADI") %> 
                                </td>

                                <td><%# Eval("YETKILI_ADI") %></td>
                                <td><%# Eval("GOREVI") %></td>
                                <td><%# Eval("KAYIT_ZAMANI") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>      
                        </FooterTemplate>
                    </asp:Repeater>


                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="Panel1" TargetControlID="Label2" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>


                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none; width: 300px">
                        <div class="header">
                            Bilgi
                        </div>
                        <div class="body">
                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="footer" align="right">
                            <asp:Button ID="Button1" runat="server" CssClass="no" Text="Kapat" />
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">

        function PrintRepeater() {

            var repeater = document.getElementById('<%=Panel1.ClientID %>');

            var printWindow = window.open('', '', 'height=800,width=1024');

            printWindow.document.write('<html><head><title>İçerik</title>');

            printWindow.document.write('</head><body >');

            printWindow.document.write(repeater.innerHTML);
            printWindow.document.write('</body></html>');

            printWindow.document.close();

            setTimeout(function () {

                printWindow.print();

            }, 500);

            return false;

        }

    </script>

    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="Label1" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>


    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none; width: 80%; height: 50%">
        <div class="header">
            İçerik
        </div>
        <div class="body">
            <asp:Repeater ID="Repeater1" runat="server" Visible="true">
                <HeaderTemplate>
                    <table style="font-size: 12px; border: 1px solid; text-align: center; width: 100%;">
                        <thead style="border: 1px; text-align: center;">
                            <tr style="border: 1px; text-align: center">
                                <th>IL</th>
                                <th>ILCE</th>
                                <th>BİRİM_ADI</th>
                                <th>YETKİLİ_ADI</th>
                                <th>GÖREVİ</th>
                                <th>KAYIT_ZAMANI</th>
                            </tr>
                        </thead>
                        <tbody style="border: 1px; text-align: center">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr style="border: 1px">
                        <td style="border: 1px"><%# Eval("IL") %></td>
                        <td style="border: 1px"><%# Eval("ILCE") %></td>
                        <td style="border: 1px">
                            <asp:Label ID="lblBELEDIYE_ID" runat="server" Text='<%# Eval("BELEDIYE_ID") %>' Visible="false"></asp:Label><%# Eval("BIRIM_ADI") %> 
                        </td>
                        <td style="border: 1px"><%# Eval("YETKILI_ADI") %></td>
                        <td style="border: 1px"><%# Eval("GOREVI") %></td>
                        <td style="border: 1px"><%# Eval("KAYIT_ZAMANI") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                            </table>      
                </FooterTemplate>
            </asp:Repeater>


            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <div class="footer" align="right">
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Yazdır" OnClientClick="return PrintRepeater();" />
            <asp:Button ID="btnHide" runat="server" CssClass="btn btn-danger" Text="Kapat" />
        </div>
    </asp:Panel>













    <div class="row" id="GORUSMEPANEL" runat="server">
        <div class="col-xs-12">
            <div class="card">
                <div class="card-header">
                    <br />
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                </div>
                <div class="card-body no-padding">
                    <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand" Visible="true" OnItemDataBound="Repeater2_ItemDataBound">
                        <HeaderTemplate>
                            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>IL</th>
                                        <th>ILCE</th>
                                        <th>GÖRÜŞME KONUSU</th>
                                        <th>SON DURUM</th>
                                        <th>KULLANICI_ADI</th>
                                        <th>KAYIT_ZAMANI</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="dropdown" id="menu" runat="server">
                                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                            Menu
                                         <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server" Width="100%" CommandName="SIL" CommandArgument='<%# Eval("GORUSME_ID") %>' Text="Sil" OnClientClick="Confirm()" />
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                                <td><%# Eval("IL") %></td>
                                <td><%# Eval("ILCE") %></td>
                                <td><%# Eval("GORUSME_KONUSU") %>  </td>
                                <td><%# Eval("SON_DURUMU") %>  </td>
                                <td><%# Eval("KULLANICI_ADI") %></td>
                                <td><%# Eval("KAYIT_ZAMANI") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>      
                        </FooterTemplate>
                    </asp:Repeater>


                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="Panel3" TargetControlID="Label5" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>


                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none; width: 300px">
                        <div class="header">
                            Bilgi
                        </div>
                        <div class="body">
                            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="footer" align="right">
                            <asp:Button ID="Button3" runat="server" CssClass="no" Text="Kapat" />
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">

        function PrintRepeater1() {

            var repeater = document.getElementById('<%=Panel4.ClientID %>');

            var printWindow = window.open('', '', 'height=800,width=1024');

            printWindow.document.write('<html><head><title>İçerik</title>');

            printWindow.document.write('</head><body >');

            printWindow.document.write(repeater.innerHTML);
            printWindow.document.write('</body></html>');

            printWindow.document.close();

            setTimeout(function () {

                printWindow.print();

            }, 500);

            return false;

        }

    </script>

    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender4" runat="server" PopupControlID="Panel4" TargetControlID="Label6" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>


    <asp:Panel ID="Panel4" runat="server" CssClass="modalPopup" Style="display: none; width: 80%; height: 50%">
        <div class="header">
            İçerik
        </div>
        <div class="body">
            <asp:Repeater ID="Repeater3" runat="server" Visible="true">
                <HeaderTemplate>
                    <table style="font-size: 12px; border: 1px solid; text-align: center; width: 100%;">
                        <thead style="border: 1px; text-align: center;">
                            <tr style="border: 1px; text-align: center">
                                <th></th>
                                <th>IL</th>
                                <th>ILCE</th>
                                <th>GÖRÜŞME KONUSU</th>
                                <th>SON DURUM</th>
                                <th>KULLANICI_ADI</th>
                                <th>KAYIT_ZAMANI</th>
                            </tr>
                        </thead>
                        <tbody style="border: 1px; text-align: center">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr style="border: 1px">
                        <td style="border: 1px"><%# Eval("IL") %></td>
                        <td style="border: 1px"><%# Eval("ILCE") %></td>
                        <td style="border: 1px"><%# Eval("GORUSME_KONUSU") %></td>
                        <td style="border: 1px"><%# Eval("SON_DURUMU") %></td>
                        <td style="border: 1px"><%# Eval("KULLANICI_ADI") %></td>
                        <td style="border: 1px"><%# Eval("KAYIT_ZAMANI") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                            </table>      
                </FooterTemplate>
            </asp:Repeater>


            <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
        </div>
        <div class="footer" align="right">
            <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" Text="Yazdır" OnClientClick="return PrintRepeater1();" />
            <asp:Button ID="Button5" runat="server" CssClass="btn btn-danger" Text="Kapat" />
        </div>
    </asp:Panel>



</asp:Content>
