using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpleSystem
{
    class DataAccessor
    {
        public static List<Clients> GetAllClients()
        {
            using (var context = new DataModelContainer() )
            {
                List<Clients> clients = new List<Clients>();
                return context.Set<Clients>().ToList();               
            }
        }

        public static bool InsertClient(string name)
        {
            using (var context = new DataModelContainer())
            {
                try
                {
                    Clients client = new Clients { Name = name };
                    context.Clients.Add(client);
                    context.SaveChanges();
                }
                catch
                {
                    return false;
                }
                return true;
            }              
        }

        public static bool DeleteClient(int id)
        {
            using (var context = new DataModelContainer())
            {
                try
                {
                    var clientToRemove = new Clients { ClientId = id };
                    context.Clients.Attach(clientToRemove);
                    context.Clients.Remove(clientToRemove);
                    context.SaveChanges();
                }
                catch
                {
                    return false;
                }
                return true;
            }
        }
    }
}
