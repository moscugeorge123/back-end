using AutoMapper;
using HotDiggetyDog.Data;
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using HotDiggetyDog.Helpers;
using HotDiggetyDog.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace HotDiggetyDog
{
    public class Startup
    {
        private readonly IConfiguration configuration;
        public Startup(IConfiguration configuration)
        {
            this.configuration = configuration;
            
        }

        

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<DataContext>(options => { options.UseSqlite(configuration.GetConnectionString("HotDiggetyDog")); });
            services.AddControllers();
            services.Configure<AppSettings>(configuration.GetSection("AppSettings"));

            // configure DI for application services
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<ICharacterSkillService, CharacterSkillService>();
            //add Swagger
            // Register the Swagger generator, defining 1 or more Swagger documents
            services.AddSwaggerGen();
            
            services.AddAutoMapper(typeof(Startup));
     

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
            // specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
            });

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

        }
    }
}
