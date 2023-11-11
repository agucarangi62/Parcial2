using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Timers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2
{
    public partial class GestionDeArchivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGrilla();
            }
            
        }

        public void cargarGrilla()
        {
            if (Session["nombreUsuario"] != null)
            {
                string nombreUsuario = Session["nombreUsuario"].ToString();
                string path = $"{Server.MapPath(".")}/{nombreUsuario}";
                if (Directory.Exists(path))
                {
                    string[] files = Directory.GetFiles(path);
                    List<Archivo> fileList = new List<Archivo>();
                    foreach (string file in files)
                    {
                        var fileNew = new Archivo(Path.GetFileName(file), file);
                        fileList.Add(fileNew);
                    }
                    GridView1.DataSource = fileList;
                    GridView1.DataBind();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] != null)
            {
                string nombreUsuario = Session["nombreUsuario"].ToString();
                string path = $"{Server.MapPath(".")}/{nombreUsuario}";

                if (Directory.Exists(path))
                {
                    foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                    {
                        if (File.Exists($"{path}/{archivo.FileName}"))
                        {
                            Label1.Text = "El archivo " + archivo.FileName + " ya existe.";
                        }
                        else
                        {
                            FileUpload1.SaveAs($"{path}/{archivo.FileName}");
                            Label1.Text = "Se ha cargado correctamente.";
                        }
                    }
                    cargarGrilla();
                }
                else
                {
                    Directory.CreateDirectory(path);
                    foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                    {
                        if (File.Exists($"{path}/{archivo.FileName}"))
                        {
                            Label1.Text = "El archivo " + archivo.FileName + " ya existe.";
                        }
                        else
                        {
                            FileUpload1.SaveAs($"{path}/{archivo.FileName}");
                            Label1.Text = "Se ha cargado correctamente.";
                        }
                    }
                    cargarGrilla();
                }
            } else
            {
                Label1.Text = "Debe registrarse para cargar un archivo.";
            }
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Descargar")
            {
                GridViewRow registro = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}