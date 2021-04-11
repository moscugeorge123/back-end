using Microsoft.EntityFrameworkCore.Migrations;

namespace HotDiggetyDog2.Data.Migrations
{
    public partial class QuantityInJoinTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Quantity",
                table: "IngredientsFromShop");

            migrationBuilder.AddColumn<int>(
                name: "Quantity",
                table: "IngredientFromShopShop",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Quantity",
                table: "IngredientFromShopShop");

            migrationBuilder.AddColumn<int>(
                name: "Quantity",
                table: "IngredientsFromShop",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);
        }
    }
}
