using System;
using System.Data.Entity;

public class PrimeMartEntities : DbContext
{
    public PrimeMartEntities() : base("name=PrimeMartEntities") { }

    public DbSet<Category> Categories { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<Order> Orders { get; set; }
}

public class Category
{
    public int Category_id { get; set; }
    public string Category_name { get; set; }
    public string Description { get; set; }
}

public class Product
{
    public int Product_id { get; set; }
    public int Category_id { get; set; }
    public string Product_Name { get; set; }
    public decimal Price { get; set; }
    public int Stock { get; set; }
    public string Description { get; set; }
    public string ImagePath { get; set; }
}

public class Order
{
    public int Order_id { get; set; }
    public string Username { get; set; }
    public DateTime OrderDate { get; set; }
    public string Status { get; set; }
    public decimal TotalAmount { get; set; }
}
