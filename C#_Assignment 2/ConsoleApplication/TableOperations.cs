using System;

namespace SimpleRestaurantSystem
{
    public static class TableOperations
    {
        public static void ManageTablesArray()
        {
            Console.WriteLine("--- CURRENT TABLES (Standard Array) ---");
            foreach (string table in RestaurantData.Tables)
            {
                Console.WriteLine(table);
            }

            Console.Write("\nDo you want to add a new table by resizing the array? (y/n): ");
            if (Console.ReadLine().ToLower() == "y")
            {
                Array.Resize(ref RestaurantData.Tables, RestaurantData.Tables.Length + 1);
                RestaurantData.Tables[RestaurantData.Tables.Length - 1] = $"Table {RestaurantData.Tables.Length}: Available";
                Console.WriteLine($"Success! Table {RestaurantData.Tables.Length} added.");

                string[] backupTables = new string[RestaurantData.Tables.Length];
                Array.Copy(RestaurantData.Tables, backupTables, RestaurantData.Tables.Length);
                Console.WriteLine($"(Backup array created with {backupTables.Length} tables using Array.Copy)");
            }
        }
    }
}
