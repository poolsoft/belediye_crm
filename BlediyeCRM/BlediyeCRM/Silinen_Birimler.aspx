<%@ Page Title="" Language="C#" MasterPageFile="~/MASTER.Master" AutoEventWireup="true" CodeBehind="Silinen_Birimler.aspx.cs" Inherits="BlediyeCRM.Silinen_Birimler" %>
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
                    Silinen Birim Kayıtları
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                </div>

                <div class="card-body no-padding">
                    <asp:Repeater ID="rptBELEDIYE" runat="server" OnItemCommand="rptBELEDIYE_ItemCommand"
                         Visible="true"   >
                        <HeaderTemplate>
                            <table class="datatable table table-striped primary" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>BIRIM_ADI</th> 
                                        <th>YETKILI_ADI</th> 
                                        <th>MAIL</th> 
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
                                                <asp:Button ID="btnSIL" CssClass="btn btn-default" runat="server" Width="100%" CommandName="SIL" CommandArgument='<%# Eval("BIRIM_ID") %>' Text="Sil" />
                                            </li>
                                        </ul>
                                    </div>

                                </td>
                                <td><%# Eval("BIRIM_ADI") %></td> 
                                <td><%# Eval("YETKILI_ADI") %></td> 
                                <td><%# Eval("MAIL") %></td> 
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
