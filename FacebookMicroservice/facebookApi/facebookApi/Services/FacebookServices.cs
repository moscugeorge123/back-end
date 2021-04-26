using Facebook;
using facebookApi.Model;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace facebookApi.Services
{
    public class FacebookServices : IFacebookServices
    {
        private readonly AppSettings _appSettings;

        public FacebookServices(IOptions<AppSettings> appSettings)
        {
            _appSettings = appSettings.Value;
        }
        public void postImage(string path, string message)
        {
            var fb = new FacebookClient(_appSettings.Secret);


            using (var file = new FacebookMediaStream
            {
                ContentType = "image/jpeg",
                FileName = Path.GetFileName(path)
            }.SetValue(File.OpenRead(path)))
            {
                dynamic result = fb.Post("me/photos",
                new { message = message, file });
            }
        }
    }
}
