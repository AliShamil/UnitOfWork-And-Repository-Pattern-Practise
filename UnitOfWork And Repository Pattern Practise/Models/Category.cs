using System;
using System.Collections.Generic;

namespace UnitOfWork_And_Repository_Pattern_Practise.Models;

public partial class Category
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Product> Products { get; } = new List<Product>();
}
