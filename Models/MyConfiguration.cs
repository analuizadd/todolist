using System.Data.Entity;
using MySql.Data.EntityFramework;

namespace ToDoList.Models
{
    public class MyConfiguration : DbConfiguration
    {
        public MyConfiguration()
        {
            SetDefaultConnectionFactory(new MySqlConnectionFactory());
            SetExecutionStrategy("MySql.Data.MySqlClient", () => new MySqlExecutionStrategy());
        }
    }
}