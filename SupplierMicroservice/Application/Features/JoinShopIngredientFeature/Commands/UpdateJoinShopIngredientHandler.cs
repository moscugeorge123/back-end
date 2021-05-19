using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.JoinShopIngredientFeature.Commands
{
    public class UpdateJoinShopIngredientHandler:IRequestHandler<UpdateJoinShopIngredient,IngredientFromShopShop>
    {
        private readonly IApplicationContext context;

        public UpdateJoinShopIngredientHandler(IApplicationContext context)
        {
            this.context = context;
        }
        public async Task<IngredientFromShopShop>  Handle(UpdateJoinShopIngredient request,CancellationToken cancellationToken)
        {
            try
            {


                cancellationToken.ThrowIfCancellationRequested();
                await Task.Delay(1000, cancellationToken);


            }
            catch (Exception ex) when (ex is TaskCanceledException)
            {
                throw new TaskCanceledException("The user has cancelled the task!");
            }
            var relation = context.JoinIngredientShop.Where(s => s.IngredientsId == request.IngrdientId && s.ShopsId == request.ShopId).FirstOrDefault();
            if (relation==null)
            {
                throw new Exception("Relation does not exist");
            }

            /*var relation = new IngredientFromShopShop
            {
                IngredientsId = request.IngrdientId,
                ShopsId = request.ShopId,
                Quantity = request.Quantity
                
<<<<<<< HEAD:SupplierMicroservice/Application/Features/JoinShopIngredientFeature/Commands/CreateJoinShopIngredientHandler.cs
            };
            await context.JoinIngredientShop.AddAsync(relation,cancellationToken);
=======
            };*/
            relation.Quantity = request.Quantity;
            context.JoinIngredientShop.Update(relation);

            await context.SaveChangesAsync();
            return relation;


        }

        
    }
}
