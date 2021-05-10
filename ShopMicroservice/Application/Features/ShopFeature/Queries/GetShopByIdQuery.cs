using Domain.Dtos;
using MediatR;

namespace Application.Features.ShopFeature.Queries
{
    public class GetShopByIdQuery:IRequest<GetShopDto>
    {
        public int Id { get; set; }
    }
}
