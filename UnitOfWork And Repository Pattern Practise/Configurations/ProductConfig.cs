using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnitOfWork_And_Repository_Pattern_Practise.Models;

namespace UnitOfWork_And_Repository_Pattern_Practise.Configurations;

public class ProductConfig : IEntityTypeConfiguration<Product>
{
    public void Configure(EntityTypeBuilder<Product> builder)
    {
        builder.Property(e => e.CategoryId).HasColumnName("CategoryID");
        builder.Property(e => e.Name).HasMaxLength(40);
        builder.Property(e => e.Price).HasColumnType("money");
      
        builder.HasOne(d => d.Category).WithMany(p => p.Products)
            .HasForeignKey(d => d.CategoryId)
            .HasConstraintName("FK_Products_CategoryId");
    }
}
