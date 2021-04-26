using Application.Interfaces;
using Persistance.Context;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Persistance.Repository.v1
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class, new()
    {
        private readonly ShopContext shopContext;
        public Repository(ShopContext shopContext)
        {
            this.shopContext = shopContext;
        }
        public async Task<TEntity> AddAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(AddAsync)} entity must not be null");

            }
            try
            {
                await shopContext.AddAsync(entity);
                await shopContext.SaveChangesAsync();
                return entity;
            }
            catch (Exception ex)
            {
                throw new Exception($"{nameof(entity)} could not be  saved:{ex.Message}");

            }
        }

        public async Task<TEntity> DeleteAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(DeleteAsync)} entity must not be null");

            }
            try
            {
                shopContext.Remove(entity);
                await shopContext.SaveChangesAsync();
                return entity;
            }
            catch (Exception ex)
            {
                throw new Exception($"{nameof(entity)} could not be null deleted:{ex.Message}");

            }
        }

        public IEnumerable<TEntity> GetAll()
        {
            try
            {
                return shopContext.Set<TEntity>();
            }
            catch (Exception ex)
            {
                throw new Exception($"Couldn't retrieve entities: {ex.Message}");
            }
        }

        public async Task<TEntity> GetById(int id)
        {
            if (id == 0)
            {
                throw new ArgumentException($"{nameof(GetById)} id must not be empty");

            }
            try
            {
                return await shopContext.FindAsync<TEntity>(id);
            }
            catch (Exception ex)
            {
                throw new Exception($"Couldn't retrieve entities: {ex.Message}");
            }

        }

        public async Task<TEntity> UpdateAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException($"{nameof(UpdateAsync)} entity must not be null");

            }
            try
            {
                shopContext.Update(entity);
                await shopContext.SaveChangesAsync();
                return entity;
            }
            catch (Exception ex)
            {
                throw new Exception($"{nameof(entity)} could not be update:{ex.Message}");

            }
        }
    }
}
