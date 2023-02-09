using Microsoft.EntityFrameworkCore;
using UnitOfWork_And_Repository_Pattern_Practise.Models;
using UnitOfWork_And_Repository_Pattern_Practise.Repositories.Concretes;
using UnitOfWork_And_Repository_Pattern_Practise.Repositories.Contexts;

namespace UnitOfWork_And_Repository_Pattern_Practise;


public class Program
{
    static void Main()
    {
        var dbContext = new OnlineShopContext();
        var unitOfWork = new UnitOfWork(dbContext);

        // Selecting some entities
        //var products = unitOfWork.ProductRepository.Entities
        //    .Where(n => n.Id == 1).ToList();


        //foreach (var item in products)
        //{
        //    Console.WriteLine(item.Rating);
        //}



        //// Create
        //var newCategory = new Category() { Name = "NewCateg" };
        //unitOfWork.CategoryRepository.Add(newCategory);
        //unitOfWork.Commit(); // Save changes to database

        //// Update
        //var editCategory = unitOfWork.CategoryRepository.Entities
        //    .First(n => n.Name == "BabatCategory");

        //editCategory.Name = "NewCateg";
        //unitOfWork.Commit(); // Save changes to database

        //// Delete
        //var deleteCategory = unitOfWork.CategoryRepository.Entities
        //     .First(n => n.Name == "NewCateg");
        //unitOfWork.CategoryRepository.Remove(deleteCategory);
        //unitOfWork.Commit(); // Save changes to database

        ////When Delete Wrongly
        //var deleteCategory = unitOfWork.CategoryRepository.Entities
        //     .First(n => n.Name == "NewCateg");
        //unitOfWork.CategoryRepository.Remove(deleteCategory);
        //// Ops i don't want to do this
        //unitOfWork.RejectChanges(); // Reject all changes

        Console.ReadKey();
    }
}