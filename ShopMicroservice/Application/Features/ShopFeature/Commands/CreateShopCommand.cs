using MediatR;

namespace Application.Features.ShopFeature.Commands
{
    public class CreateShopCommand:IRequest<int>
    {
        public double LocationX { get; set; }
        public double LocationY { get; set; }
        public string Name { get; set; }
    }
}
