using Facebook;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace facebookApi.Services
{
    public class FacebookAccessToken
    {
        public string accessToken()
        {

            var fb = new FacebookClient();
            dynamic result = fb.Get("oauth/access_token", new
            {
                client_id = "1140094136341213",
                client_secret = "f3ccb98dc558350d9dc80914ac413655",
                grant_type = "client_credentials"
            });
            fb.AccessToken = result.access_token;
            return fb.AccessToken;
        }
    }
}
