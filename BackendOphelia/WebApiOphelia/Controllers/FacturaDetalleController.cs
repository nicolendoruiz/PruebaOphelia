using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using WebApiOphelia.Models;

namespace WebApiOphelia.Controllers
{
    public class FacturaDetalleController : ApiController
    {
        private ModelBD db = new ModelBD();

        // GET: api/FacturaDetalle
        public IQueryable<FacturaDetalle> GetFacturaDetalle()
        {
            return db.FacturaDetalle;
        }

        // GET: api/FacturaDetalle/5
        [ResponseType(typeof(FacturaDetalle))]
        public async Task<IHttpActionResult> GetFacturaDetalle(int id)
        {
            FacturaDetalle facturaDetalle = await db.FacturaDetalle.FindAsync(id);
            if (facturaDetalle == null)
            {
                return NotFound();
            }

            return Ok(facturaDetalle);
        }

        // PUT: api/FacturaDetalle/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutFacturaDetalle(int id, FacturaDetalle facturaDetalle)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != facturaDetalle.FacturaDetalleId)
            {
                return BadRequest();
            }

            db.Entry(facturaDetalle).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FacturaDetalleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/FacturaDetalle
        [ResponseType(typeof(FacturaDetalle))]
        public async Task<IHttpActionResult> PostFacturaDetalle(FacturaDetalle facturaDetalle)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.FacturaDetalle.Add(facturaDetalle);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = facturaDetalle.FacturaDetalleId }, facturaDetalle);
        }

        // DELETE: api/FacturaDetalle/5
        [ResponseType(typeof(FacturaDetalle))]
        public async Task<IHttpActionResult> DeleteFacturaDetalle(int id)
        {
            FacturaDetalle facturaDetalle = await db.FacturaDetalle.FindAsync(id);
            if (facturaDetalle == null)
            {
                return NotFound();
            }

            db.FacturaDetalle.Remove(facturaDetalle);
            await db.SaveChangesAsync();

            return Ok(facturaDetalle);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FacturaDetalleExists(int id)
        {
            return db.FacturaDetalle.Count(e => e.FacturaDetalleId == id) > 0;
        }
    }
}