<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libros.aspx.cs" Inherits="Proyecto1.View.Libros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Libros Disponibles</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"/>
</head>


<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2>Libros Disponibles</h2>
            <div>
                <asp:Repeater ID="rptLibros" runat="server">
                    <ItemTemplate>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Titulo") %></h5>
                                <p class="card-text"><%# string.Format("${0:0.00}", Eval("Precio")) %></p>
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar al Carrito" CssClass="btn btn-primary"
                                    CommandArgument='<%# Eval("ISBN") %>' OnClick="btnAgregar_Click" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
   

</body>
</html>
