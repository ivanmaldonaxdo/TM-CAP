using ApiRestPrueba.Models.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiRestPrueba.Controllers
{
    public class RolController : ApiController
    {

        #region GetAllRol
        [HttpGet]
        public IHttpActionResult GetAllRol()
        {
            using (Models.TmCapEntities db = new Models.TmCapEntities())
            {
                /*se crea una lista de tipo rol Request,
                 * lo cual llama al procedure SP_select_rol
                 y a su vez itera con linq cada objeto "x" del sp*/
                IList<RolRequest> roles = db.sp_select_rol().Select(
                    x => new RolRequest()
                    {
                        Id_rol = x.id_rol,
                        Nombre_rol = x.nombre_rol,
                        Estado = x.estado
                    }
                ).ToList<RolRequest>();
                return Ok(roles);
            }
        }
        #endregion


    }
}
