using System.Collections.Generic;

namespace SimpleRestaurantSystem
{
    public static class RestaurantData
    {
        public static string[] Tables = { "Table 1: Available", "Table 2: Occupied", "Table 3: Available" };

        public static List<MenuItem> Menu = new List<MenuItem>();

        public static Dictionary<string, int> CurrentOrder = new Dictionary<string, int>();

        public static void SeedMenuData()
        {
            if (Menu.Count > 0)
            {
                return;
            }

            Menu.Add(new MenuItem { Id = 1, Name = "Paneer Tikka", Category = "Starter", Price = 220 });
            Menu.Add(new MenuItem { Id = 2, Name = "Veg Manchurian", Category = "Starter", Price = 180 });
            Menu.Add(new MenuItem { Id = 3, Name = "Butter Chicken", Category = "Main Course", Price = 350 });
            Menu.Add(new MenuItem { Id = 4, Name = "Dal Tadka", Category = "Main Course", Price = 190 });
            Menu.Add(new MenuItem { Id = 5, Name = "Butter Naan", Category = "Bread", Price = 50 });
            Menu.Add(new MenuItem { Id = 6, Name = "Gulab Jamun", Category = "Dessert", Price = 90 });
            Menu.Add(new MenuItem { Id = 7, Name = "Masala Chai", Category = "Beverage", Price = 40 });
        }
    }
}
