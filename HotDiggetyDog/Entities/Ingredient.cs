using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public abstract class Ingredient
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public float Price { get; set; }
    }
}
