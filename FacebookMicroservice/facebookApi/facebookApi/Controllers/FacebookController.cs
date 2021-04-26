using facebookApi.Model;
using facebookApi.Services;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace facebookApi.Controllers
{
    [ApiController]
    [Route("facebook")]
    public class facebookController
    {
        private readonly IFacebookServices _facebookService;
        public facebookController(IFacebookServices facebookServices)        {
            _facebookService = facebookServices;
        }
        public void  postImage(Request request)
        {
            System.Console.WriteLine("dasdas");
            System.Console.WriteLine(request.Path);
            System.Console.WriteLine("dsaas");
            _facebookService.postImage(request.Path, request.Message);
            


        }
    }
}
