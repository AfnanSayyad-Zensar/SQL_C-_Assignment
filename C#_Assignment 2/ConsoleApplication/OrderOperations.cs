using System;
using System.Linq;

namespace SimpleRestaurantSystem
{
    public static class OrderOperations
    {
        public static void ManageOrdersDictionary()
        {
            Console.Write("Enter the ID of the dish you want to order: ");
            int id = Convert.ToInt32(Console.ReadLine());

            MenuItem selectedItem = RestaurantData.Menu.FirstOrDefault(m => m.Id == id);

            if (selectedItem != null)
            {
                Console.Write($"Enter quantity for {selectedItem.Name}: ");
                int qty = Convert.ToInt32(Console.ReadLine());

                if (RestaurantData.CurrentOrder.ContainsKey(selectedItem.Name))
                {
                    RestaurantData.CurrentOrder[selectedItem.Name] += qty;
                }
                else
                {
                    RestaurantData.CurrentOrder.Add(selectedItem.Name, qty);
                }

                Console.WriteLine("Added to order!");
            }
            else
            {
                Console.WriteLine("Item ID not found.");
            }

            Console.WriteLine("\n--- CURRENT ORDER BILL ---");
            foreach (var order in RestaurantData.CurrentOrder)
            {
                Console.WriteLine($"{order.Key} x {order.Value}");
            }

            double totalBill = RestaurantData.CurrentOrder.Sum(order =>
            {
                double itemPrice = RestaurantData.Menu.First(m => m.Name == order.Key).Price;
                return itemPrice * order.Value;
            });

            Console.WriteLine($"Total Bill Amount (using LINQ Sum): Rs. {totalBill}");
        }
    }
}
