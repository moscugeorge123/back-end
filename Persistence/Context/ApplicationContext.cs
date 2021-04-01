using Application;
using HotDiggetyDog.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Context
{
    class ApplicationContext : DbContext, IApplicationContext
    {
        public DbSet<Product> Products { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
        public DbSet<User> Users { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public Task<Guid> SaveChanges()
        {
            throw new NotImplementedException();
        }
    }
}
