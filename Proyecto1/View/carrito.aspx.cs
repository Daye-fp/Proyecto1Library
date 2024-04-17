using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto1.View
{
    public partial class carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarCarrito(); // Método para mostrar los libros en el carrito al cargar la página
            }
        }
        private void MostrarCarrito()
        {
            // Obtener los libros seleccionados del Session (o crear una lista vacía si es la primera vez)
            List<Libro> librosSeleccionados = Session["carrito"] as List<Libro> ?? new List<Libro>();

           

            // Agregar cada libro al ListView en la página
            foreach (var libro in librosSeleccionados)
            {
                // Crear un nuevo ListItem con el nombre y precio del libro
                var listItem = new ListItem($"{libro.Titulo} - ${libro.Precio:F2}", libro.Id.ToString());

              
            }
        }
    }
   
}