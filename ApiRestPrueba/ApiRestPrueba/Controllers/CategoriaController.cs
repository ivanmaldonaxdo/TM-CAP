using ApiRestPrueba.Models.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiRestPrueba.Controllers
{
    public class CategoriaController : ApiController        
    {
        #region GetAllCateg
        [HttpGet]
        public IHttpActionResult GetAllCateg()
        {
            using (Models.TmCapEntities db = new Models.TmCapEntities())
            {
                /*se crea una lista de tipo categ Request,
                 * lo cual llama al procedure SP_select_categoria
                 y a su vez itera con linq cada objeto "x" del sp*/

                IList<CategoriaRequest> categ = db.sp_select_categoria().Select(
                    x => new CategoriaRequest()
                    {
                        Id_categoria= x.id_categoria,
                        Nombre = x.nombre,
                        Estado = x.estado
                    }
                ).ToList<CategoriaRequest>();
                return Ok(categ);
            }
        }
        #endregion
    }
}
