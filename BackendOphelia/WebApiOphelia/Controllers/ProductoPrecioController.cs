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
    public class ProductoPrecioController : ApiController
    {
        private ModelBD db = new ModelBD();

        // GET: api/ProductoPrecio
        public IQueryable<ProductoPrecio> GetProductoPrecio()
        {
            return db.ProductoPrecio;
        }

        // GET: api/ProductoPrecio/5
        [ResponseType(typeof(ProductoPrecio))]
        public async Task<IHttpActionResult> GetProductoPrecio(int id)
        {
            ProductoPrecio productoPrecio = await db.ProductoPrecio.FindAsync(id);
            if (productoPrecio == null)
            {
                return NotFound();
            }

            return Ok(productoPrecio);
        }

        // PUT: api/ProductoPrecio/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutProductoPrecio(int id, ProductoPrecio productoPrecio)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != productoPrecio.ProductoPrecioId)
            {
                return BadRequest();
            }

            db.Entry(productoPrecio).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductoPrecioExists(id))
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

        // POST: api/ProductoPrecio
        [ResponseType(typeof(ProductoPrecio))]
        public async Task<IHttpActionResult> PostProductoPrecio(ProductoPrecio productoPrecio)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ProductoPrecio.Add(productoPrecio);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = productoPrecio.ProductoPrecioId }, productoPrecio);
        }

        // DELETE: api/ProductoPrecio/5
        [ResponseType(typeof(ProductoPrecio))]
        public async Task<IHttpActionResult> DeleteProductoPrecio(int id)
        {
            ProductoPrecio productoPrecio = await db.ProductoPrecio.FindAsync(id);
            if (productoPrecio == null)
            {
                return NotFound();
            }

            db.ProductoPrecio.Remove(productoPrecio);
            await db.SaveChangesAsync();

            return Ok(productoPrecio);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductoPrecioExists(int id)
        {
            return db.ProductoPrecio.Count(e => e.ProductoPrecioId == id) > 0;
        }
    }
}