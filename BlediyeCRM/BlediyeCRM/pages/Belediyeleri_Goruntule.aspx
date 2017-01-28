<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Belediyeleri_Goruntule.aspx.cs" Inherits="BlediyeCRM.pages.Belediyeleri_Goruntule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="row">
        <div class="col-xs-12">
            <div class="card">
                <div class="card-header">
                    <asp:Button ID="btnYeniBelediyeEkle" runat="server" CssClass="btn btn-success" Text="YENİ BELEDİYE EKLE" Visible="True" OnClick="btnYeniBelediyeEkle_Click" />
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
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel">Silmek istediğinize emin misiniz?</h4>
                                                </div>
                                                <div class="modal-body">
                                                    Bu kapıyı silerseniz, kapılara bağlı birimlerde silinecektir.
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>

                                                    <asp:Button ID="btnSIL" CssClass="btn btn-danger" runat="server" CommandName="SIL" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="SİL" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="btnBirimEkle" BackgroundCssClass="modalBackground" CancelControlID="btnHide"></ajaxToolkit:ModalPopupExtender>

                                    <asp:Panel ID="Panel1" runat="server" Style="display: none; width: 100%">

                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>

                                                <div class="row" style="margin-left: 10%; margin-top: 10%">
                                                    <div class="col-md-6">
                                                        <div class="card">
                                                            <div class="card-header">
                                                                Yeni Birim Ekleme Platformu
                                                            </div>
                                                            <div class="card-body">

                                                                <div class="row">

                                                                    <div class="col-md-6">
                                                                        <div class="section-body">

                                                                            <div class="form-group">
                                                                                <label class="col-md-3 control-label"   >BİRİM_ADI</label>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Size="Large" ControlToValidate="txtBirimAdi" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator> 
                                                                                <div class="col-md-9" style="width: 100%">
                                                                                    <asp:TextBox ID="txtBirimAdi" MaxLength="100" CssClass="form-control" placeholder="Birim adı" runat="server"></asp:TextBox>

                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label class="col-md-3 control-label"  >TELEFON </label><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" Font-Size="Large" ControlToValidate="txtTelefon" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>  
                                                                                <div class="col-md-9" style="width: 100%">
                                                                                    <asp:TextBox ID="txtTelefon" TextMode="Number" CssClass="form-control" placeholder="Telefon Numarası" runat="server"></asp:TextBox>
                                                                                     
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label class="col-md-3 control-label"  >DAHİLİ_NO</label><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" Font-Size="Large"
                                                                                        ControlToValidate="txtDahili" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator><br />
                                                                                <div class="col-md-9" style="width: 100%">
                                                                                    <asp:TextBox ID="txtDahili" TextMode="Number" CssClass="form-control" placeholder="Dahili Numarası" runat="server"></asp:TextBox>

                                                                                    
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label class="col-md-3 control-label"  >GSM</label><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" Font-Size="Large"
                                                                                        ControlToValidate="txtGsm" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator><br />
                                                                                <div class="col-md-9" style="width: 100%">
                                                                                    <asp:TextBox ID="txtGsm" TextMode="Number" CssClass="form-control" placeholder="Cep Telefon Numarası" Text="" runat="server"></asp:TextBox>
                                                                                    
                                                                                </div>
                                                                            </div>


                                                                            <div class="form-group">
                                                                                <label class="col-md-3 control-label"  >YETKİLİ_ADI </label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Font-Size="Large" ControlToValidate="txtYetkiliAdi" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator>  <br />
                                                                                <div class="col-md-9" style="width: 100%">
                                                                                    <asp:TextBox ID="txtYetkiliAdi" MaxLength="70" CssClass="form-control" placeholder="Yetikili Adı" runat="server"></asp:TextBox>

                                                                                 
                                                                                </div>
                                                                            </div>


                                                                            <div class="form-group">
                                                                                <label class="col-md-3 control-label"  >GÖREVİ</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" Font-Size="Large" ControlToValidate="txtGorevi" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                                                                <div class="col-md-9" style="width: 100%">
                                                                                    <asp:TextBox ID="txtGorevi" MaxLength="100" CssClass="form-control" placeholder="Partisi" runat="server"></asp:TextBox>

                                                                                   
                                                                                </div>
                                                                            </div>


                                                                            <div class="form-group">
                                                                                <label class="col-md-3 control-label"  >EMAIL </label><asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" Font-Size="Large" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                                                                <div class="col-md-9" style="width: 100%">
                                                                                    <asp:TextBox ID="txtEmail" MaxLength="150" CssClass="form-control" placeholder="Email adresi" runat="server"></asp:TextBox>

                                                                                   
                                                                                </div>
                                                                            </div>


                                                                            <div class="form-group">
                                                                                <label class="col-md-3 control-label" >NOT_AÇIKLAMA </label> <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" Font-Size="Large" ControlToValidate="txtNot" Font-Bold="false" ForeColor="#FF3300"></asp:RequiredFieldValidator><br />
                                                                                <div class="col-md-9" style="width: 100%">
                                                                                    <asp:TextBox ID="txtNot" TextMode="MultiLine" MaxLength="500" CssClass="form-control" placeholder="Not - Açıklama" runat="server"></asp:TextBox>

                                                                                   
                                                                                </div>
                                                                            </div>


                                                                            <div class="form-group">
                                                                                <div class="col-md-9">
                                                                                    <asp:Button ID="btnKaydet" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" />
                                                                                </div>
                                                                                <div class="col-md-9">
                                                                                    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>



                                                <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>

                                                <div class="footer" align="right">
                                                    <asp:Button ID="btnHide" runat="server" CssClass="no" Text="Kapat" />
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnKaydet" />

                                            </Triggers>

                                        </asp:UpdatePanel>

                                    </asp:Panel>

                                    <%--  <asp:Button ID="btnBirimEkle" CssClass="btn btn-success" runat="server" CommandName="BIRIM" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Birim Ekle" OnClick="btnBirimEkle_Click" /> --%>

                                    <asp:Button ID="btnBirimEkle" runat="server" CssClass="btn btn-success" OnClick="btnBirimEkle_Click" CommandName="BIRIM" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Birim Ekle" />

                                    <asp:Button ID="btnDETAY" CssClass="btn btn-primary" runat="server" CommandName="DETAY" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="DETAY" />
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">SİL  </button>
                                </td>
                                <td><%# Eval("IL") %></td>
                                <td><%# Eval("ILCE") %></td>
                                <td><%# Eval("BELEDIYE") %></td>
                                <td><%# Eval("BELEDIYE_TURU") %></td>
                                <td><%# Eval("NUFUS") %></td>
                                <td>0<%# Eval("TELEFON") %></td>
                                <td><%# Eval("NOT_ACIKLAMA") %></td>
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


    <%--<script type="text/javascript" src="../assets/js/vendor.js"></script>
    <script type="text/javascript" src="../assets/js/app.js"></script>--%>
</asp:Content>
