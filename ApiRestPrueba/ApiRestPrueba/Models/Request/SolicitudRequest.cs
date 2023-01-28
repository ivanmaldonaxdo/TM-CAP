using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiRestPrueba.Models.Request
{
    public class SolicitudRequest
    {
        public int Id_solicitud { get; set; }
        public string Mensaje { get; set; }
        public int Telefono { get; set; }
        public string Mail { get; set; }
        public System.DateTime Fecha { get; set; }
    }
}