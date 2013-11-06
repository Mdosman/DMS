using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DonationManagement.Model;

namespace DonationManagement.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            using (DonationManagementContext db = new DonationManagementContext())
            {
                System.Console.WriteLine(db.Donors.First().FirstName);
                System.Console.ReadKey();
            }
        }
    }
}
