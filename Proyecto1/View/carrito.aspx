<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carrito.aspx.cs" Inherits="Proyecto1.View.carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Carrito de compras </title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"/>
  
</head>
    
    <body>
          <form id="form1" runat="server">
           <div class="container mt-4">
            <h2>Carrito de Compras</h2>
            <ul id="listaCarrito" runat="server" class="list-group">
                <!-- Aquí se mostrarán los libros seleccionados -->
            </ul>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <!--  mostrar y manipular libros en el carrito -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const listaCarrito = document.getElementById("listaCarrito");

                // Obtener lista de libros seleccionados del localStorage
                const librosEnCarrito = JSON.parse(localStorage.getItem("carrito")) || [];

                // Mostrar libros en el carrito
                librosEnCarrito.forEach(function (libro, index) {
                    const nuevoItem = document.createElement("li");
                    nuevoItem.className = "list-group-item";
                    nuevoItem.textContent = `${libro.Nombre} - $${libro.Precio.toFixed(2)}`;

                    // Agregar botón de eliminar junto al libro
                    const botonEliminar = document.createElement("button");
                    botonEliminar.className = "btn btn-danger btn-sm ms-2";
                    botonEliminar.textContent = "Eliminar";
                    botonEliminar.onclick = function () {
                        // Eliminar el libro del carrito (también del localStorage)
                        librosEnCarrito.splice(index, 1);
                        localStorage.setItem("carrito", JSON.stringify(librosEnCarrito));

                        // Actualizar la visualización del carrito
                        listaCarrito.removeChild(nuevoItem);
                    };

                    nuevoItem.appendChild(botonEliminar);
                    listaCarrito.appendChild(nuevoItem);
                });
            });
        </script>
    </form>
           
</body>
</html>
