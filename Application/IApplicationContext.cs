using HotDiggetyDog.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Application
{
    public interface IApplicationContext
    {
        DbSet<Product> Products { get; set; }
        DbSet<User>Users { get; set; }
        Task<Guid> SaveChanges();
    }
}
