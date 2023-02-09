using System;
using System.Collections.Generic;

namespace UnitOfWork_And_Repository_Pattern_Practise.Models;

public partial class Rating
{
    public int Id { get; set; }

    public int ProductId { get; set; }

    public double Rate { get; set; }

    public virtual Product Product { get; set; } = null!;
}
