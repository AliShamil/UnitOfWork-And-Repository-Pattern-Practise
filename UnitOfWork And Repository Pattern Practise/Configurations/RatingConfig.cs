using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnitOfWork_And_Repository_Pattern_Practise.Models;

namespace UnitOfWork_And_Repository_Pattern_Practise.Configurations;

public class RatingConfig : IEntityTypeConfiguration<Rating>
{
    public void Configure(EntityTypeBuilder<Rating> builder)
    {
        builder.HasOne(d => d.Product).WithMany(p => p.Ratings)
    .HasForeignKey(d => d.ProductId)
    .OnDelete(DeleteBehavior.ClientSetNull)
    .HasConstraintName("FK_Ratings_ProductId");
    }
}
