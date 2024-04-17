using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto1.View
{
    public partial class Libros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar libros disponibles en el Repeater desde la base de datos
                CargarLibros();
            }
        }

        protected void CargarLibros()
        {
            List<Libro> libros = new List<Libro>();


            // Establecer la cadena de conexión (actualízala con tus propios detalles)
            string connectionString = "Database=[InternationalLibrary]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ISBN, Foto, Cantidad, Titulo, Autor, FechaPublicacion, Precio FROM Book";

                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Libro libro = new Libro
                    {
                        ISBN = Convert.ToInt32(reader["ISBN"]),
                        Foto = reader["Foto"].ToString(),
                        Cantidad = Convert.ToInt32(reader["Cantidad"]),
                        Titulo = reader["Titulo"].ToString(),
                        Autor = reader["Autor"].ToString(),
                        FechaPublicacion = Convert.ToDateTime(reader["FechaPublicacion"]),
                        Precio = Convert.ToDouble(reader["Precio"])
                    };

                    libros.Add(libro);
                }

                reader.Close();
            }

            rptLibros.DataSource = libros;
            rptLibros.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int ISBN = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect("carrito.aspx"); // Redirigir a la página del carrito
        }
    }

    public class Libro
    {
        public int ISBN { get; set; }
        public string Foto { get; set; }
        public int Cantidad { get; set; }
        public string Titulo { get; set; }
        public string Autor { get; set; }
        public DateTime FechaPublicacion { get; set; }
        public double Precio { get; set; }
    }
}