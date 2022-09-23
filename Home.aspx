<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ContactList.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="./assets/global.css" rel="stylesheet" />
    <title>Contact List</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="root">
            <header>
                <div class="brand-logo">
                    <img src="assets/contacts-icon.png" class="contact-img" alt="contact icon" />
                    <h1 class="game-title">MyContacts</h1>
                </div>

                <nav>
                    <ul>
                        <li>
                            <asp:Button cssClass="active" Text="Home" runat="server" />
                        </li>
                        <li>
                            <asp:Button ID="playBtn" Text="Play" runat="server" />
                        </li>
                        <li>
                            <a target="_blank" href="https://github.com/henriquepinheiro12">
                                <asp:Button Text="About us" runat="server" /> 
                            </a>
                        </li>
                        <li>
                            <asp:Button Text="Sign in" runat="server" />
                        </li>
                    </ul>
                </nav>
            </header>

            <main>

                <div class="register-container">
                    <h2 class="section-header">Cadastro</h2>
                    
                    <div class="input-section">
                        <span>Nome:</span>
                        <asp:TextBox CssClass="name-input" ID="nameInput" runat="server"></asp:TextBox>
                    </div>

                    <div class="input-section">
                        <span>Data de aniversário:</span>
                        <br />
                        <asp:Calendar CssClass="calendar" ID="birthDayCalendar" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />                      
                        </asp:Calendar>
                    </div>
                    <asp:Button ID="registerBtn" OnClick="RegisterContact" CssClass="register-btn" Text="Cadastrar" runat="server" />

                </div>
                
                <div class="contact-list-container">

                    <div class="all-contacts-container">
                        <h2 class="section-header">Todos os contatos</h2>
                        <asp:Repeater ID="AllContactsRepeater" runat="server">
                            <ItemTemplate>
                                <div class="contact-container">
                                    <h3 class="contact-name">
                                        <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                    </h3>

                                    <ul>
                                        <li>
                                            <span>
                                                Data de aniversário:
                                                <span><%# DataBinder.Eval(Container.DataItem, "NextBirthDayString") %></span>
                                            </span>
                                        </li>
                                        <li>
                                            <span>
                                                Fará <%# DataBinder.Eval(Container.DataItem, "NextAge") %> ano(s) em 
                                                <%# DataBinder.Eval(Container.DataItem, "DaysLeftToBirthday") %> dias
                                            </span>
                                        </li>  
                                    </ul>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Button ID="allContactsUpdateBTn" CssClass="register-btn" Text="Atualizar" runat="server" />
                    </div>

                    <div class="closest-birthdays">
                        <h2 class="section-header">Aniversários próximos</h2>
                        <asp:Repeater ID="ClosestBirthdaysRepeater" runat="server">
                            <ItemTemplate>
                                <div class="contact-container">
                                    <h3 class="contact-name">
                                        <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                    </h3>
                                    <ul>
                                        <li>
                                            <span class="alt-li">
                                                Fará <%# DataBinder.Eval(Container.DataItem, "NextAge") %> ano(s) em 
                                                <%# DataBinder.Eval(Container.DataItem, "DaysLeftToBirthday") %> dias
                                            </span>
                                        </li>  
                                    </ul>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Button ID="Button1" CssClass="register-btn" Text="Atualizar" runat="server" />
                    </div>
                </div>
            </main>

            <footer>
                <h2>
                    <a target="_blank" href="https://github.com/henriquepinheiro12">
                        @HenriquePinheiro
                    </a>
                </h2>

                <ul class="icons">
                    <li>
                        <img src="assets/facebook-icon.svg" alt="facebook icon" />
                    </li>
                    <li>
                        <img src="assets/instagram-icon.svg" alt="instagram icon" />
                    </li>
                    <li>
                        <img src="assets/twitter-icon.svg" alt="twitter icon" />
                    </li>
                    <li>
                        <img src="assets/tiktok-icon.svg" alt="tiktok icon" />
                    </li>
                </ul>
            </footer>
        </div>
    </form>
</body>
</html>
