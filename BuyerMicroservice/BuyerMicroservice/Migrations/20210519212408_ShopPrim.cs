using Microsoft.EntityFrameworkCore.Migrations;

namespace BuyerMicroservice.Migrations
{
    public partial class ShopPrim : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "IngredientsFromShop",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Price = table.Column<double>(type: "REAL", nullable: false),
                    Name = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IngredientsFromShop", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Shops",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    LocationX = table.Column<double>(type: "REAL", nullable: false),
                    LocationY = table.Column<double>(type: "REAL", nullable: false),
                    Name = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Shops", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "IngredientFromShopShop",
                columns: table => new
                {
                    IngredientsId = table.Column<int>(type: "INTEGER", nullable: false),
                    ShopsId = table.Column<int>(type: "INTEGER", nullable: false),
                    Quantity = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_IngredientFromShopShop", x => new { x.IngredientsId, x.ShopsId });
                    table.ForeignKey(
                        name: "FK_IngredientFromShopShop_IngredientsFromShop_IngredientsId",
                        column: x => x.IngredientsId,
                        principalTable: "IngredientsFromShop",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_IngredientFromShopShop_Shops_ShopsId",
                        column: x => x.ShopsId,
                        principalTable: "Shops",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_IngredientFromShopShop_ShopsId",
                table: "IngredientFromShopShop",
                column: "ShopsId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "IngredientFromShopShop");

            migrationBuilder.DropTable(
                name: "IngredientsFromShop");

            migrationBuilder.DropTable(
                name: "Shops");
        }
    }
}
