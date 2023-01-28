using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiRestPrueba.Models.Request
{
    public class UsuarioRequest
    {
        public int Id_usuario { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public System.DateTime Fecha_nac { get; set; }
        public string Email { get; set; }
        public string Clave { get; set; }
        public string Rut { get; set; }
        public int Id_rol { get; set; }
        public string Direccion { get; set; }
        public int Telefono { get; set; }
        public string Estado { get; set; }
    }
}