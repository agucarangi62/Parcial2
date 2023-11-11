using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            HttpCookie cookie1 = new HttpCookie("contraseña", TextBox4.Text);
            cookie1.Expires = DateTime.Now.AddMinutes(10);
            Response.Cookies.Add(cookie1);
            
            this.Session["nombreUsuario"] = TextBox2.Text;
            LabelAviso.Text = "Se ha registrado correctamente.";
        }
    }
}