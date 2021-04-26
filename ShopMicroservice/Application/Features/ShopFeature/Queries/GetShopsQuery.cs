using Domain.Dtos;
using MediatR;
using System.Collections.Generic;

namespace Application.Features.ShopFeature.Queries
{
    public class GetShopsQuery:IRequest<IEnumerable<GetShopDto>>
    {
    }
}
