using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiRestPrueba.Models.Request
{
    public class CategoriaRequest
    {
        public int Id_categoria { get; set; }
        public string Nombre { get; set; }
        public bool Estado { get; set; }
    }
}