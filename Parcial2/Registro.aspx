<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Parcial2.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Registro:</h1>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Email: "></asp:Label><asp:TextBox ID="TextBox1" runat="server" TextMode="Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Ingrese un Email." ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Ingrese un Email valido." ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="None"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Username: "></asp:Label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Ingrese un Username" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Edad: "></asp:Label><asp:TextBox ID="TextBox3" runat="server" TextMode="Number"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Ingrese una edad." ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Debe ser mayor de 15 y menor de 100 años" ForeColor="Red" MaximumValue="100" MinimumValue="16" Type="Integer" Display="None"></asp:RangeValidator>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Password: "></asp:Label><asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese una contraseña." ForeColor="Red" ControlToValidate="TextBox4" Display="None"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Reingrese la Password: "></asp:Label><asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Reingrese la contraseña." ForeColor="Red" ControlToValidate="TextBox5" Display="None"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="Las contraseñas no coinciden" ForeColor="Red" Display="None"></asp:CompareValidator>
    <br />
    <asp:Label ID="LabelAviso" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click" />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <br />
</asp:Content>
