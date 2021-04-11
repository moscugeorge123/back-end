﻿// <auto-generated />
using System;
using HotDiggetyDog.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace HotDiggetyDog2.Data.Migrations
{
    [DbContext(typeof(DataContext))]
    [Migration("20210410194039_QuantityInJoinTable")]
    partial class QuantityInJoinTable
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.0-preview.1.21102.2");

            modelBuilder.Entity("HotDiggetyDog.Entities.IngredientFromProductProduct", b =>
                {
                    b.Property<int>("IngredientsId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("ProductsId")
                        .HasColumnType("INTEGER");

                    b.HasKey("IngredientsId", "ProductsId");

                    b.HasIndex(new[] { "ProductsId" }, "IX_IngredientFromProductProduct_ProductsId");

                    b.ToTable("IngredientFromProductProduct");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.IngredientFromShopShop", b =>
                {
                    b.Property<int>("IngredientsId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("ShopsId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("Quantity")
                        .HasColumnType("INTEGER");

                    b.HasKey("IngredientsId", "ShopsId");

                    b.HasIndex(new[] { "ShopsId" }, "IX_IngredientFromShopShop_ShopsId");

                    b.ToTable("IngredientFromShopShop");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.IngredientsFromProduct", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("IngredientsFromProduct");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.IngredientsFromShop", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<double>("Price")
                        .HasColumnType("REAL");

                    b.HasKey("Id");

                    b.ToTable("IngredientsFromShop");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.Product", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Description")
                        .HasColumnType("TEXT");

                    b.Property<double>("Discount")
                        .HasColumnType("REAL");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<double>("Price")
                        .HasColumnType("REAL");

                    b.HasKey("Id");

                    b.ToTable("Products");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.Shop", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<double>("LocationX")
                        .HasColumnType("REAL");

                    b.Property<double>("LocationY")
                        .HasColumnType("REAL");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Shops");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.User", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Email")
                        .HasColumnType("TEXT");

                    b.Property<string>("Password")
                        .HasColumnType("TEXT");

                    b.Property<string>("Username")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.IngredientFromProductProduct", b =>
                {
                    b.HasOne("HotDiggetyDog.Entities.IngredientsFromProduct", "Ingredients")
                        .WithMany("IngredientFromProductProducts")
                        .HasForeignKey("IngredientsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("HotDiggetyDog.Entities.Product", "Products")
                        .WithMany("IngredientFromProductProducts")
                        .HasForeignKey("ProductsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Ingredients");

                    b.Navigation("Products");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.IngredientFromShopShop", b =>
                {
                    b.HasOne("HotDiggetyDog.Entities.IngredientsFromShop", "Ingredients")
                        .WithMany("IngredientFromShopShops")
                        .HasForeignKey("IngredientsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("HotDiggetyDog.Entities.Shop", "Shops")
                        .WithMany("IngredientFromShopShops")
                        .HasForeignKey("ShopsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Ingredients");

                    b.Navigation("Shops");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.IngredientsFromProduct", b =>
                {
                    b.Navigation("IngredientFromProductProducts");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.IngredientsFromShop", b =>
                {
                    b.Navigation("IngredientFromShopShops");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.Product", b =>
                {
                    b.Navigation("IngredientFromProductProducts");
                });

            modelBuilder.Entity("HotDiggetyDog.Entities.Shop", b =>
                {
                    b.Navigation("IngredientFromShopShops");
                });
#pragma warning restore 612, 618
        }
    }
}
