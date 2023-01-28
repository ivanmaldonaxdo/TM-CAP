using ApiRestPrueba.Models.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiRestPrueba.Controllers
{
    public class SolicitudController : ApiController
    {
        #region POST
        [HttpPost]
        public IHttpActionResult Post([FromBody] SolicitudRequest model)
        {
            //ONJETO PARA DB
            using (Models.TmCapEntities db = new Models.TmCapEntities())
            {
                //USO DE STORE_RPOCEDURE PARA INSERTAR INFO
                db.sp_insert_solicitud(model.Mensaje, model.Telefono, model.Mail, model.Fecha);
                db.SaveChanges();
                //TRANSACCION
                //using (var dbContextTransaction = db.Database.BeginTransaction())
                //{
                //    try
                //    {
                //        Models.solicitud oSolicitud = new Models.solicitud();
                //        oSolicitud.mensaje = model.Mensaje;
                //        oSolicitud.telefono = model.Telefono;
                //        oSolicitud.mail = model.Mail;
                //        oSolicitud.fecha = model.Fecha;
                //        db.solicitud.Add(oSolicitud);
                //        db.SaveChanges();
                //        dbContextTransaction.Commit();
                //    }
                //    catch (Exception)
                //    {

                //        dbContextTransaction.Rollback();
                //    }
                //}
            }
            return Ok(new { result = true });
        }
        #endregion

        #region GetAllSolicitud
        [HttpGet]
        public IHttpActionResult GetAllSolicitud()
        {
            using (Models.TmCapEntities db = new Models.TmCapEntities())
            {
               /*se crea una lista de tipo solic Request,
                * lo cual llama al procedure SP_select_solicitud
                y a su vez itera con linq cada objeto "x" del sp*/
                IList<SolicitudRequest> solicitudes = db.sp_select_solicitud().Select(
                    x => new SolicitudRequest()
                    {
                        Id_solicitud = x.id_solicitud,
                        Mensaje = x.mensaje,
                        Telefono = x.telefono,
                        Mail = x.mail,
                        Fecha = x.fecha
                    }
                ).ToList<SolicitudRequest>();
                return Ok(solicitudes);
            }
        } 
        #endregion

    }





}
