using ApiRestPrueba.Models.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiRestPrueba.Controllers
{
    public class UsuarioController : ApiController
    {
        #region POST
        [HttpPost]
        public IHttpActionResult Post([FromBody] UsuarioRequest user)
        {
            //ONJETO PARA DB
            using (Models.TmCapEntities db = new Models.TmCapEntities())
            {
                //USO DE STORE_RPOCEDURE PARA INSERTAR INFO
                db.sp_insert_usuario(   
                    user.Nombre, 
                    user.Apellidos, 
                    user.Fecha_nac, 
                    user.Email, 
                    user.Clave, 
                    user.Rut, 
                    user.Id_rol,
                    user.Direccion,
                    user.Telefono, 
                    user.Estado
                );
                db.SaveChanges();
            }
            return Ok(new { result = true });
        }
        #endregion

        #region PUT
        [HttpPut]
        public IHttpActionResult Put([FromBody] UsuarioRequest user)
        {
            //ONJETO PARA DB
            using (Models.TmCapEntities db = new Models.TmCapEntities())
            {
                //USO DE STORE_RPOCEDURE PARA INSERTAR INFO
                db.sp_update_usuario(
                    user.Id_usuario,
                    user.Nombre,
                    user.Apellidos,
                    user.Fecha_nac,
                    user.Email,
                    user.Clave,
                    user.Rut,
                    user.Id_rol,
                    user.Direccion,
                    user.Telefono,
                    user.Estado
                );
                db.SaveChanges();
            }
            return Ok(new { result = true });
        }
        #endregion

        #region GetAllUsers
        [HttpGet]
        public IHttpActionResult GetAllUsers()
        {
            using (Models.TmCapEntities db = new Models.TmCapEntities())
            {
                /*se crea una lista de tipo usuario Request,
                 * lo cual llama al procedure SP_select_usuario
                 y a su vez itera con linq cada objeto "x" del sp*/
                IList<UsuarioRequest> users = db.sp_select_usuario().Select(
                    x => new UsuarioRequest()
                    {
                        Id_usuario = x.id_usuario,
                        Nombre = x.nombre,
                        Apellidos = x.apellidos,
                        Fecha_nac = x.fecha_nac,
                        Email = x.email,
                        Clave = x.clave,
                        Rut = x.rut,
                        Id_rol = x.id_rol,
                        Direccion = x.direccion,
                        Telefono = x.telefono,
                        Estado = x.estado 
                     }
                ).ToList<UsuarioRequest>();
                return Ok(users);
            }
        }
        #endregion
    }


}
