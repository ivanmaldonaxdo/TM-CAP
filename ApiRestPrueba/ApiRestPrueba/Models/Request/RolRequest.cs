using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiRestPrueba.Models.Request
{
    public class RolRequest
    {
        public int Id_rol { get; set; }
        public string Nombre_rol { get; set; }
        public bool Estado { get; set; }
    }
}