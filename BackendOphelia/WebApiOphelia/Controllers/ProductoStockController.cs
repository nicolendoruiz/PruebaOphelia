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
    public class ProductoStockController : ApiController
    {
        private ModelBD db = new ModelBD();

        // GET: api/ProductoStock
        public IQueryable<ProductoStock> GetProductoStock()
        {
            return db.ProductoStock;
        }

        // GET: api/ProductoStock/5
        [ResponseType(typeof(ProductoStock))]
        public async Task<IHttpActionResult> GetProductoStock(int id)
        {
            ProductoStock productoStock = await db.ProductoStock.FindAsync(id);
            if (productoStock == null)
            {
                return NotFound();
            }

            return Ok(productoStock);
        }

        // PUT: api/ProductoStock/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutProductoStock(int id, ProductoStock productoStock)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != productoStock.ProductoStockId)
            {
                return BadRequest();
            }

            db.Entry(productoStock).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductoStockExists(id))
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

        // POST: api/ProductoStock
        [ResponseType(typeof(ProductoStock))]
        public async Task<IHttpActionResult> PostProductoStock(ProductoStock productoStock)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ProductoStock.Add(productoStock);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = productoStock.ProductoStockId }, productoStock);
        }

        // DELETE: api/ProductoStock/5
        [ResponseType(typeof(ProductoStock))]
        public async Task<IHttpActionResult> DeleteProductoStock(int id)
        {
            ProductoStock productoStock = await db.ProductoStock.FindAsync(id);
            if (productoStock == null)
            {
                return NotFound();
            }

            db.ProductoStock.Remove(productoStock);
            await db.SaveChangesAsync();

            return Ok(productoStock);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductoStockExists(int id)
        {
            return db.ProductoStock.Count(e => e.ProductoStockId == id) > 0;
        }
    }
}