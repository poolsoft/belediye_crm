<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Silinen_Belediyeler.aspx.cs" Inherits="BlediyeCRM.Silinen_Belediyeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="assets/js/Loading.js"></script>

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
                    Silinen Belediye Kayıtları
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                </div>

                <div class="card-body no-padding">
                    <asp:Repeater ID="rptBELEDIYE" runat="server" OnItemCommand="rptBELEDIYE_ItemCommand" Visible="true" OnDataBinding="rptBELEDIYE_DataBinding" OnInit="rptBELEDIYE_Init" OnLoad="rptBELEDIYE_Load" OnItemDataBound="rptBELEDIYE_ItemDataBound">
                        <HeaderTemplate>
                            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>BELEDIYE_ADI</th>
                                        <th>BASKANIN_ADI</th>
                                        <th>SİLEN_KULLANICI </th>
                                        <th>SİLİNME_TARİHİ</th>
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
                                                <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server" Width="100%" CommandName="SIL" CommandArgument='<%# Eval("BELEDIYE_ID") %>' Text="Sil" OnClientClick = "Confirm()" />
                                            </li>
                                        </ul>
                                    </div>

                                </td>
                                <td><%# Eval("BELEDIYE_ADI") %></td>
                                <td><%# Eval("BELEDIYE_BASKANI_ADI") %></td>
                                <td><%# Eval("KULLANICI_ADI") %></td>
                                <td><%# Eval("SILME_TARIHI") %></td>
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
