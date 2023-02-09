using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnitOfWork_And_Repository_Pattern_Practise.Models;
using UnitOfWork_And_Repository_Pattern_Practise.Repositories.Contexts;
using UnitOfWork_And_Repository_Pattern_Practise.Repositories.Interfaces;

namespace UnitOfWork_And_Repository_Pattern_Practise.Repositories.Concretes;

public class UnitOfWork : IUnitOfWork
{
    private readonly OnlineShopContext _dbContext;

    #region Repositories
    
    public IRepository<Category> CategoryRepository =>
       new Repository<Category>(_dbContext);

    public IRepository<Product> ProductRepository =>
new Repository<Product>(_dbContext);
    
    public IRepository<Rating> RatingRepository =>
new Repository<Rating>(_dbContext);


    #endregion

    public UnitOfWork(OnlineShopContext dbContext)
    {
        _dbContext = dbContext;
    }
    
    public void Commit()
    {
        _dbContext.SaveChanges();
    }
    
    public void Dispose()
    {
        _dbContext.Dispose();
    }
    
    public void RejectChanges()
    {
        foreach (var entry in _dbContext.ChangeTracker.Entries()
              .Where(e => e.State != EntityState.Unchanged))
        {
            switch (entry.State)
            {
                case EntityState.Added:
                    entry.State = EntityState.Detached;
                    break;
                case EntityState.Modified:
                case EntityState.Deleted:
                    entry.Reload();
                    break;
            }
        }
    }

}
