using System;

namespace SimpleRestaurantSystem
{
    class Program
    {
        static void Main(string[] args)
        {
            RestaurantData.SeedMenuData();

            bool exit = false;
            while (!exit)
            {
                Console.WriteLine("\n============================================");
                Console.WriteLine("   WELCOME TO RESTAURANT MANAGEMENT SYSTEM  ");
                Console.WriteLine("============================================");
                Console.WriteLine("1. View & Expand Tables (Array Operations)");
                Console.WriteLine("2. View Full Menu & Add Item (List<T>)");
                Console.WriteLine("3. Place an Order & View Bill (Dictionary & LINQ Sum)");
                Console.WriteLine("4. Filter & Sort Menu (LINQ Query & Method Syntax)");
                Console.WriteLine("5. Menu Analytics & Grouping (LINQ GroupBy, Avg, Count)");
                Console.WriteLine("6. Exit");
                Console.Write("Select an option (1-6): ");

                string choice = Console.ReadLine();
                Console.WriteLine();

                switch (choice)
                {
                    case "1":
                        TableOperations.ManageTablesArray();
                        break;
                    case "2":
                        MenuOperations.ManageMenuList();
                        break;
                    case "3":
                        OrderOperations.ManageOrdersDictionary();
                        break;
                    case "4":
                        LinqOperations.FilterAndSortLINQ();
                        break;
                    case "5":
                        LinqOperations.MenuAnalyticsLINQ();
                        break;
                    case "6":
                        exit = true;
                        Console.WriteLine("Thank you! Exiting system...");
                        break;
                    default:
                        Console.WriteLine("Invalid option. Please try again.");
                        break;
                }
            }
        }
    }
}