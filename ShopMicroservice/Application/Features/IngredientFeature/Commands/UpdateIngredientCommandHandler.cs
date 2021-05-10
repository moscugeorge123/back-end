using Application.Interfaces;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.IngredientFeature.Commands
{
    public class UpdateIngredientCommandHandler : IRequestHandler<UpdateIngredientCommand, int>
    {
        private readonly IIngredientRepository repository;

        public UpdateIngredientCommandHandler(IIngredientRepository repository)
        {

            this.repository = repository;
        }
        public async Task<int> Handle(UpdateIngredientCommand request, CancellationToken cancellationToken)
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
            var ingredient = repository.GetById(request.Id).Result;

            if (ingredient == null)
            {
                throw new ArgumentNullException(nameof(request));
            }

            ingredient.Id = request.Id;
            ingredient.Name = request.Name;
            await repository.UpdateAsync(ingredient);
            return ingredient.Id;
        }
    }
}
