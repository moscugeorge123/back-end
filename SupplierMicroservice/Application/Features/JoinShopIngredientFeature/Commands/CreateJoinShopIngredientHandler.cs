using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.JoinShopIngredientFeature.Commands
{
    public class CreateJoinShopIngredientHandler:IRequestHandler<CreateJoinShopIngredient,bool>
    {
        private readonly IApplicationContext context;

        public CreateJoinShopIngredientHandler(IApplicationContext context)
        {
            this.context = context;
        }
        public async Task<bool> Handle(CreateJoinShopIngredient request,CancellationToken cancellationToken)
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
            bool alreadyExists = context.JoinIngredientShop.Any(s => s.IngredientsId == request.IngrdientId && s.ShopsId == request.ShopId);
            if (alreadyExists)
                return false;
            var relation = new IngredientFromShopShop
            {
                IngredientsId = request.IngrdientId,
                ShopsId = request.ShopId,
                Quantity = request.Quantity
                
            };
            await context.JoinIngredientShop.AddAsync(relation,cancellationToken);
            await context.SaveChangesAsync();
            return true;


        }
    }
}
