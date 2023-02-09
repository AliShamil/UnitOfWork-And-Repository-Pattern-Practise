using System;
using System.Collections.Generic;

namespace UnitOfWork_And_Repository_Pattern_Practise.Models;

public partial class Product
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int? CategoryId { get; set; }

    public decimal? Price { get; set; }

    public short? Quantity { get; set; }

    public double? Rating { get; set; }

    public virtual Category? Category { get; set; }

    public virtual ICollection<Rating> Ratings { get; } = new List<Rating>();
}
