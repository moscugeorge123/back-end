using Application.Interfaces;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.ShopFeature.Commands
{
    public class UpdateShopCommandHandler
    {
        private readonly IShopRepository repository;

        public UpdateShopCommandHandler(IShopRepository repository)
        {
            this.repository = repository;
        }
        public async Task<int> Handle(UpdateShopCommand request, CancellationToken cancellationToken)
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
            var shop = repository.GetById(request.Id).Result;

            if (shop == null)
            {
                throw new Exception("Product doesn't exist!");
            }

            shop.Id = request.Id;
            shop.Name = request.Name;
            await repository.UpdateAsync(shop);
            return shop.Id;
        }
    }
}
