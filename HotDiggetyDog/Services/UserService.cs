using HotDiggetyDog.Data;
using HotDiggetyDog.Entities;
using HotDiggetyDog.Helpers;
using HotDiggetyDog.Models;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace HotDiggetyDog.Services
{
    public interface IUserService
    {
        AuthenticateResponse Authenticate(AuthenticateRequest model);
        User GetById(Guid id);
    }
    public class UserService:IUserService
    {
        private readonly DataContext _dataContext;
        private readonly AppSettings _appSettings;
        public UserService(DataContext dataContext, IOptions<AppSettings> appSettings)
        {
            _dataContext = dataContext;
            _appSettings = appSettings.Value;
        }
        public AuthenticateResponse Authenticate(AuthenticateRequest model)
        {
            var user = _dataContext.Users.Where(s => s.Username == model.Username  ).FirstOrDefault();

            

            
            if (user == null || !BCrypt.Net.BCrypt.Verify(model.Password,user.Password )) return null;

          
            var token = generateJwtToken(user);

            return new AuthenticateResponse(user, token);
        }
        private string generateJwtToken(User user)
        {
           
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[] { new Claim("id", user.Id.ToString()) }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
        public User GetById(Guid id)
        {
            return _dataContext.Users.Find(id);
        }


    }
}
