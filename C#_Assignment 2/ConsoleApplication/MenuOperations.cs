using System;
using System.Linq;

namespace SimpleRestaurantSystem
{
    public static class MenuOperations
    {
        public static void ManageMenuList()
        {
            Console.WriteLine("--- RESTAURANT MENU (Using LINQ Select Transformation) ---");

            var formattedMenu = RestaurantData.Menu.Select(item => $"[{item.Id}] {item.Name} ({item.Category}) - Rs. {item.Price}");

            foreach (string line in formattedMenu)
            {
                Console.WriteLine(line);
            }

            Console.Write("\nWould you like to add a new dish to the menu? (y/n): ");
            if (Console.ReadLine().ToLower() == "y")
            {
                MenuItem newItem = new MenuItem();
                newItem.Id = RestaurantData.Menu.Count + 1;

                Console.Write("Enter Dish Name: ");
                newItem.Name = Console.ReadLine();

                Console.Write("Enter Category (Starter/Main Course/Dessert/Beverage): ");
                newItem.Category = Console.ReadLine();

                Console.Write("Enter Price (Rs.): ");
                newItem.Price = Convert.ToDouble(Console.ReadLine());

                RestaurantData.Menu.Add(newItem);
                Console.WriteLine("Dish added successfully to List<MenuItem>!");
            }
        }
    }
}
