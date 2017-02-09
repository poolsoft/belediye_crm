<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Raporlama.aspx.cs" Inherits="BlediyeCRM.Raporlama" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    Raporlama İşlemleri
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="section-body">

                                <div class="form-group" id="RaporlamaIstenilenBolum" runat="server" visible="true">
                                    <label class="col-md-3 control-label">Raporlama İstenilen Bölümler</label>
                                    <div class="col-md-9">
                                        <asp:RadioButton ID="rdBirim" runat="server" AutoPostBack="true" Text="Birimleri Filtreleme" GroupName="a" OnCheckedChanged="rdBirim_CheckedChanged" />
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

                                <div class="form-group has-success">
                                    <div class="col-md-9">
                                        <asp:Button ID="btnRaporOlusturGorusme" runat="server" Text="Rapor Oluştur" OnClick="btnRaporOlusturGorusme_Click" CssClass="btn btn-primary" />
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





    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="Panel1" TargetControlID="Label1" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none; width: 80%; height: 80%; margin-left: 5%">


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
                                                    <asp:Button ID="btnDETAY" CssClass="btn btn-default" runat="server" Width="100%" CommandName="DETAY" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Birimi Görüntüle" /></li>
                                                <li>
                                                    <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server" Width="100%" CommandName="SIL" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Sil" OnClientClick="Confirm()" />
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


                        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
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



        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        <div class="footer" align="right">
            <asp:Button ID="btnHide" runat="server" CssClass="no" Text="Kapat" />
        </div>
    </asp:Panel>

</asp:Content>
