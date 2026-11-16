using System;
using System.Linq;

namespace SimpleRestaurantSystem
{
    public static class LinqOperations
    {
        public static void FilterAndSortLINQ()
        {
            Console.WriteLine("--- BUDGET ITEMS UNDER Rs. 200 (LINQ Query Syntax - Where) ---");
            var budgetItems = from item in RestaurantData.Menu
                              where item.Price < 200
                              select item;

            foreach (var item in budgetItems)
            {
                Console.WriteLine($"{item.Name} - Rs. {item.Price}");
            }

            Console.WriteLine("\n--- MENU SORTED BY PRICE (LINQ Method Syntax - OrderBy) ---");
            var sortedItems = RestaurantData.Menu.OrderBy(item => item.Price);

            foreach (var item in sortedItems)
            {
                Console.WriteLine($"{item.Name} ({item.Category}) - Rs. {item.Price}");
            }
        }

        public static void MenuAnalyticsLINQ()
        {
            Console.WriteLine("--- MENU SUMMARY & ANALYTICS (LINQ Aggregations) ---");

            int totalDishes = RestaurantData.Menu.Count();
            double averagePrice = RestaurantData.Menu.Average(item => item.Price);
            double totalMenuValue = RestaurantData.Menu.Sum(item => item.Price);

            Console.WriteLine($"Total Dishes Available (Count): {totalDishes}");
            Console.WriteLine($"Average Dish Price (Average): Rs. {Math.Round(averagePrice, 2)}");
            Console.WriteLine($"Sum of All Dish Prices (Sum): Rs. {totalMenuValue}");

            Console.WriteLine("\n--- DISHES GROUPED BY CATEGORY (LINQ GroupBy) ---");
            var groupedMenu = from item in RestaurantData.Menu
                              group item by item.Category into categoryGroup
                              select categoryGroup;

            foreach (var group in groupedMenu)
            {
                Console.WriteLine($"\nCategory: {group.Key} (Total Items: {group.Count()})");
                foreach (var dish in group)
                {
                    Console.WriteLine($"  - {dish.Name} (Rs. {dish.Price})");
                }
            }
        }
    }
}
