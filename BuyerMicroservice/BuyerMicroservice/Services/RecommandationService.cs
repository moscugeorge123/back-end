using BuyerMicroservice.Context;
using BuyerMicroservice.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BuyerMicroservice.Services
{
    public class RecommandationService 
    {
        private readonly DataContext context;


        public RecommandationService(DataContext context)
        {

            this.context = context;
        }
      

        public List<int> Recommendation(Guid Id)
        {
            List<int> listOfProductsIds = new List<int>();
            var histories = context.SalesHistories.Where(history => history.UserId == Id).ToList();
            if (histories.Count == 0)
                histories = context.SalesHistories.ToList();
            foreach (var history in histories)
            {
                listOfProductsIds.Add(history.ProductId);
            }
            Dictionary<int, int> frequenciesId = new Dictionary<int, int>();
            foreach (var idProduct in listOfProductsIds)
            {
                var ingredients = context.IngredientFromProductProducts.Where(j => j.ProductsId == idProduct).Select(i => i.IngredientsId).ToList();
                foreach (var ingredient in ingredients)
                {
                    int frequence = frequenciesId.GetValueOrDefault(ingredient);
                    if (frequence == 0)
                        frequenciesId.Add(ingredient, 1);
                    else
                        frequenciesId[ingredient]++;
                }

            }
            var myList = frequenciesId.ToList();

            myList.Sort((pair1, pair2) => pair2.Value.CompareTo(pair1.Value));
            HashSet<int> productsRecommendedListIds = new HashSet<int>();
            for (int i = 0; i < 3 && i<myList.Count; i++)
            {
                var productsToRecommend = context.IngredientFromProductProducts
                                            .Where(j => j.IngredientsId == myList[i].Key).Select(j => j.ProductsId).ToList();
                foreach (var productId in productsToRecommend)
                {
                    productsRecommendedListIds.Add(productId);
                }

            }
            if(productsRecommendedListIds.Count>10)
            {
                return productsRecommendedListIds.ToList().GetRange(0, 10).ToList();
            }
            else
            {
                return productsRecommendedListIds.ToList();
            }
           /* List<Product> productsToRecommendList = new List<Product>();
           foreach (var productId in productsRecommendedListIds)
            {
                var product = context.Products.Find(productId);
                productsToRecommendList.Add(product);
            }
            if(productsToRecommendList.Count>10)
            {
                return productsToRecommendList.GetRange(0,10).ToList();
            }
            else
            {
                return productsToRecommendList;
            }*/
        }


    }
}
