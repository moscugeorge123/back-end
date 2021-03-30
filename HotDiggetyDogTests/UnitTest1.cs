using HotDiggetyDog.Entities;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace HotDiggetyDogTests
{
    [TestClass]
    public class UserControllerTests
    {
        [TestMethod]
        public async Task ExistentEmailTest()
        {
            string apiUrl = "http://localhost:58776/api/users/";
            User user = new User() { Email = "andrei56@gmail.com" };
            var userJSON = new StringContent(JsonConvert.SerializeObject(user), Encoding.UTF8, "application/json");
            var httpclient = new HttpClient();

            var response = await httpclient.PostAsync(apiUrl, userJSON);

            var responseAsString = response.Content.ReadAsStringAsync();
            string expectedResponse = "Email already exists";
            
            Assert.AreEqual(responseAsString.Result, expectedResponse,"The email doesn't exist");

        }
        public void Main(string[] args)
        {
            

        }
    }
}
