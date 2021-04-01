﻿using Domain.Common;
using System;

namespace HotDiggetyDog.Entities
{
    public class Product : BaseEntity
    {
        public string Name { get; set; }

        public float Price { get; set; }

    }
}
