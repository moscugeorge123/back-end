using System;
using System.Threading.Tasks;

namespace facebookApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("dsadsa");
            var accessToken = "EAAQM6NoB0t0BAHFs8Qng7x36NMFZBiZCuJ82dJKtymcmMWTMFFiD4qdIdfHDVUcRvmbVosZByBVMZCgSR7ZAL7fbdIBz1iOS68iPPbwjZC0nFvEGGbOqZCHQZCuRt16zJhFJp5UNE9lqlXB3Tu34XMurh8TjPLtsTx7jVsTrwTvRVKGZCSEdu8ZAB6Nk6nUbXIDugZD";
            var facebookClient = new FacebookClient();
            var facebookService = new FacebookService(facebookClient);
            var getAccountTask = facebookService.GetAccountAsync(accessToken);

            Task.WaitAll(getAccountTask);
            var account = getAccountTask.Result;
            
            Console.WriteLine($"{account.Id} {account.Name}");

            var postOnWallTask = facebookService.PostOnWallAsync(accessToken, "I'm back , guys! ");
            Task.WaitAll(postOnWallTask);
        }
    }
}
