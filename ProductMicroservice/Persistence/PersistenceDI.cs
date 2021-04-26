﻿using Application.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Persistence.Context;

namespace Persistence
{
    public static class PersistenceDI
    {
        public static void AddPersistence(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<ProductContext>(options => options.UseSqlite(configuration.GetConnectionString("HotDiggetyDog")));

            services.AddScoped<IApplicationContext>(provider => provider.GetService<ProductContext>());
        }
    }
}
