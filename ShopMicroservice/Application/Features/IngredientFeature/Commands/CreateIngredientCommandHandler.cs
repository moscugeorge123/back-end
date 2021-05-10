using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.IngredientFeature.Commands
{
    public class CreateIngredientCommandHandler : IRequestHandler<CreateIngredientCommand, int>
    {
        private readonly IIngredientRepository repository;

        public CreateIngredientCommandHandler(IIngredientRepository repository)
        {
            this.repository = repository;
        }
        public async Task<int> Handle(CreateIngredientCommand request, CancellationToken cancellationToken)
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


            var ingredient = new IngredientsFromShop
            {
                Id = request.Id,
                Name = request.Name,
                Price = request.Price
            };
            await repository.AddAsync(ingredient);



            return ingredient.Id;


        }

       
    }
}
