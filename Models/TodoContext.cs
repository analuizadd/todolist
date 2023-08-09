using Google.Protobuf.WellKnownTypes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;

namespace ToDoList.Models
{
    [DbConfigurationType("ToDoList.Models.MyConfiguration, ToDoList")]
    public class TodoContext : DbContext
    {
        public DbSet<Task> Tasks { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<List> Lists { get; set; }
        public TodoContext() : base("WebAppCon") { }
    }

    public class Task
    {
        [Key]
        public int ID { get; set; }

        public int list_id { get; set; }
        public int user_id { get; set; }

        [Required, StringLength(60)]
        public string Title { get; set; }

        [Required, StringLength(255)]
        public string Description { get; set; }
        public Boolean Done { get; set; }

        public DateTime Created_At { get; set; }
        public DateTime Updated_At { get; set; }

        [ForeignKey("list_id")]
        public virtual List List { get; set; }

        [ForeignKey("user_id")]
        public virtual User User { get; set; }

    }

    public class User
    {
        [Key]
        public int ID { get; set; }
        [Required, StringLength(255)]
        public string Name { get; set; }
        [Required, StringLength(255)]
        public string Nick { get; set; }
        public DateTime Created_At { get; set; }
        public DateTime Updated_At { get; set; }

        public virtual List<Task> Tasks { get; set; }
    }

    public class List
    {
        [Key]
        public int ID { get; set; }
        [Required, StringLength(255)]
        public string Name { get; set; }

        public virtual List<Task> Tasks { get; set; }
    }
  
}