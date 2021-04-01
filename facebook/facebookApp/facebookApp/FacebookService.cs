﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace facebookApp
{
    public class FacebookService
    {
        private readonly IFacebookClient _facebookClient;
        public FacebookService(IFacebookClient facebookClient)
        {
            _facebookClient = facebookClient;
        }
        public async Task<Account> GetAccountAsync(string accessToken)
        {
            var result=await _facebookClient.GetAsync<dynamic>(accessToken, "me", "fields=id,name,email,first_name,last_name,age_range,birthday,gender,locale"); 
            if(result==null)
            {
                return new Account();
            }
            var account = new Account
            {
                Id = result.id,
                Email = result.email,
                Name = result.name,
                UserName = result.userName,
                FirstName = result.first_name,
                LastName = result.last_name,
                Locale = result.locale
            };
            return account;

        }
        public async Task PostOnWallAsync(string accessToken, string message)
        => await _facebookClient.PostAsync(accessToken, "me/feed", new { message });
    }

}
