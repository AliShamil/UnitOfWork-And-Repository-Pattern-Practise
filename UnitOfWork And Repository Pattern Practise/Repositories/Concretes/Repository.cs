using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnitOfWork_And_Repository_Pattern_Practise.Repositories.Contexts;
using UnitOfWork_And_Repository_Pattern_Practise.Repositories.Interfaces;

namespace UnitOfWork_And_Repository_Pattern_Practise.Repositories.Concretes;

public class Repository<T> : IRepository<T> where T : class
{
    private readonly OnlineShopContext _dbContext;
    private DbSet<T> _dbSet => _dbContext.Set<T>();
    public IQueryable<T> Entities => _dbSet;
    public Repository(OnlineShopContext dbContext)
    {
        _dbContext = dbContext;
    }
    public void Remove(T entity)
    {
        _dbSet.Remove(entity);
    }
    public void Add(T entity)
    {
        _dbSet.Add(entity);
    }
}