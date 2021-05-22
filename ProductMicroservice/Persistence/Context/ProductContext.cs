﻿using Application.Interfaces;
using Domain;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.IO;
using System.Threading.Tasks;

namespace Persistence.Context
{
    public partial  class ProductContext : DbContext, IApplicationContext
    {

        
        public ProductContext(DbContextOptions<ProductContext> options) : base(options)
        {
        }

       

        public async Task<int> SaveChangesAsync()
        {
            return await base.SaveChangesAsync();
        }
        public virtual DbSet<IngredientFromProductProduct> IngredientFromProductProducts { get; set; }
   
        public virtual DbSet<IngredientsFromProduct> Ingredients { get; set; }
        
        public virtual DbSet<Product> Products { get; set; }
       
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlite("Data Source=..\\..\\BuyerMicroservice\\BuyerMicroservice\\hotdogapp.db");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<IngredientFromProductProduct>(entity =>
            {
                entity.HasKey(e => new { e.IngredientsId, e.ProductsId });

                entity.ToTable("IngredientFromProductProducts");

                entity.HasIndex(e => e.ProductsId, "IX_IngredientFromProductProduct_ProductsId");

                entity.HasOne(d => d.Ingredients)
                    .WithMany(p => p.IngredientFromProductProducts)
                    .HasForeignKey(d => d.IngredientsId);

                entity.HasOne(d => d.Products)
                    .WithMany(p => p.IngredientFromProductProducts)
                    .HasForeignKey(d => d.ProductsId);
            });

        

            modelBuilder.Entity<IngredientsFromProduct>(entity =>
            {
                entity.ToTable("Ingredients");
            });

        
            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

    }
}
