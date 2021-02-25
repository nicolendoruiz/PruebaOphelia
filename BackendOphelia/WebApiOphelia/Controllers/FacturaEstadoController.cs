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
    public class FacturaEstadoController : ApiController
    {
        private ModelBD db = new ModelBD();

        // GET: api/FacturaEstado
        public IQueryable<FacturaEstado> GetFacturaEstado()
        {
            return db.FacturaEstado;
        }

        // GET: api/FacturaEstado/5
        [ResponseType(typeof(FacturaEstado))]
        public async Task<IHttpActionResult> GetFacturaEstado(int id)
        {
            FacturaEstado facturaEstado = await db.FacturaEstado.FindAsync(id);
            if (facturaEstado == null)
            {
                return NotFound();
            }

            return Ok(facturaEstado);
        }

        // PUT: api/FacturaEstado/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutFacturaEstado(int id, FacturaEstado facturaEstado)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != facturaEstado.FacturaEstadoId)
            {
                return BadRequest();
            }

            db.Entry(facturaEstado).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FacturaEstadoExists(id))
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

        // POST: api/FacturaEstado
        [ResponseType(typeof(FacturaEstado))]
        public async Task<IHttpActionResult> PostFacturaEstado(FacturaEstado facturaEstado)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.FacturaEstado.Add(facturaEstado);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = facturaEstado.FacturaEstadoId }, facturaEstado);
        }

        // DELETE: api/FacturaEstado/5
        [ResponseType(typeof(FacturaEstado))]
        public async Task<IHttpActionResult> DeleteFacturaEstado(int id)
        {
            FacturaEstado facturaEstado = await db.FacturaEstado.FindAsync(id);
            if (facturaEstado == null)
            {
                return NotFound();
            }

            db.FacturaEstado.Remove(facturaEstado);
            await db.SaveChangesAsync();

            return Ok(facturaEstado);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FacturaEstadoExists(int id)
        {
            return db.FacturaEstado.Count(e => e.FacturaEstadoId == id) > 0;
        }
    }
}