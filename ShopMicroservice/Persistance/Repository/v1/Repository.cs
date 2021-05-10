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
                throw new ArgumentNullException(nameof(entity));

            }
            try
            {
                await shopContext.AddAsync(entity);
                await shopContext.SaveChangesAsync();
                return entity;
            }
            catch (Exception ex)
            {
                throw new ArgumentException(ex.Message,nameof(entity));

            }
        }

        public async Task<TEntity> DeleteAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException(nameof(entity));

            }
            try
            {
                shopContext.Remove(entity);
                await shopContext.SaveChangesAsync();
                return entity;
            }
            catch (Exception ex)
            {
                throw new ArgumentException(ex.Message,nameof(entity));

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
                throw new CannotUnloadAppDomainException($"Couldn't retrieve entities: {ex.Message}");
            }
        }

        public async Task<TEntity> GetById(int id)
        {
            if (id == 0)
            {
                throw new ArgumentException("id is 0",nameof(id));

            }
            try
            {
                return await shopContext.FindAsync<TEntity>(id);
            }
            catch (Exception ex)
            {
                throw new CannotUnloadAppDomainException($"Couldn't retrieve entities: {ex.Message}");
            }

        }

        public async Task<TEntity> UpdateAsync(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException(nameof(entity));

            }
            try
            {
                shopContext.Update(entity);
                await shopContext.SaveChangesAsync();
                return entity;
            }
            catch (Exception ex)
            {
                throw new ArgumentException(ex.Message,nameof(entity));

            }
        }
    }
}
