using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.ShopFeature.Commands
{
    public class CreateShopCommandHandler : IRequestHandler<CreateShopCommand, int>
    {
        private readonly IShopRepository repository;

        public CreateShopCommandHandler(IShopRepository repository)
        {
            this.repository = repository;
        }


        public async Task<int> Handle(CreateShopCommand request, CancellationToken cancellationToken)
        {
            try
            {


                cancellationToken.ThrowIfCancellationRequested();
                await Task.Delay(1000, cancellationToken);


            }
            catch (Exception ex) when (ex is TaskCanceledException)
            {
                throw new Exception("The user has cancelled the task!");
            }
            var shop = new Shop
            {

                Name = request.Name,
                LocationX = request.LocationX,
                LocationY = request.LocationY
            };
            await repository.AddAsync(shop);
            return shop.Id;
        }
    }
}
