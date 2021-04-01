using Application;
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
            services.AddDbContext<ApplicationContext>(options =>options.UseSqlServer(configuration.GetConnectionString("HotDiggetyDog"),b=>b.MigrationsAssembly(typeof(ApplicationContext).Assembly.FullName)));
            services.AddScoped<IApplicationContext>(provider => provider.GetService<ApplicationContext>());
        }
    }
}
