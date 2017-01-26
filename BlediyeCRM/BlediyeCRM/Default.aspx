<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BlediyeCRM.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Belediye CRM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" type="text/css" href="assets/css/vendor.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/flat-admin.css" />

    <link rel="stylesheet" type="text/css" href="assets/css/theme/blue-sky.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/theme/blue.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/theme/red.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/theme/yellow.css" />

</head>

<body >
     
    <form id="form1" runat="server">


        <div class="app app-default" >

            <div class="app-container app-login">
                <div class="flex-center">
                    <div class="app-header"></div>
                    <div class="app-body">
                        <div class="loader-container text-center">
                           
                             <div class="icon">
                                <div class="sk-folding-cube">
                                    <div class="sk-cube1 sk-cube"></div>
                                    <div class="sk-cube2 sk-cube"></div>
                                    <div class="sk-cube4 sk-cube"></div>
                                    <div class="sk-cube3 sk-cube"></div>
                                </div>
                            </div>

                            <div class="title">Logging in...</div>

                        </div>
 

                        

                         <div class="app-block">
                            <div class="app-form">
                                <div class="form-header">
                                    <div class="app-brand"><span class="highlight">Belediye</span> CRM</div>
                                </div>

                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1">
                                        <i class="fa fa-user" aria-hidden="true"></i></span>
                                    <asp:TextBox ID="txtKadi" CssClass="form-control" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
                                </div>


                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon2">
                                        <i class="fa fa-key" aria-hidden="true"></i></span>
                                    <asp:TextBox ID="txtSifre" CssClass="form-control" TextMode="Password" placeholder="Şifre" runat="server"></asp:TextBox> 
                                </div>


                                <div class="text-left">
                                    <asp:Button ID="txtGiris" CssClass="btn btn-success btn-submit" runat="server" Text="Giriş Yap" OnClick="txtGiris_Click" /> 
                                </div>

                                  <div class="text-left"> 
                                      <asp:Label ID="lblMesaj" runat="server" Text=""></asp:Label>
                                </div>

                            </div>

                        </div>



                    </div>
                    <div class="app-footer">
                    </div>
                </div>
            </div>

        </div>


    </form>

    <script type="text/javascript" src="assets/js/vendor.js"></script>
    <script type="text/javascript" src="assets/js/app.js"></script>

</body> 
</html>