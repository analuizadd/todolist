using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ToDoList.Models;
using System.Linq;
using System.Threading.Tasks;

namespace ToDoList
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Models.Task> tasksGrid_GetData()
        {
            try
            {
                TodoContext db = new TodoContext();
                var query = db.Tasks.OrderBy(t => t.Done);
                return query;
            }
            catch (Exception ex) 
            { 
                return null; 
            }
            
        }

        [System.Web.Services.WebMethod]
        public static dynamic AddTask(string title, string description)
        {
            try
            {
                using (var dbContext = new TodoContext())
                {
                    var taskExist = dbContext.Tasks.FirstOrDefault(t => t.Title == title);
                    if(taskExist == null)
                    {
                        Models.Task newTask = new Models.Task
                        {
                            Title = title,
                            Description = description,
                            list_id = 1,
                            user_id = 1,
                        };

                        dbContext.Tasks.Add(newTask);
                        dbContext.SaveChanges();

                        return true;
                    }
                    return "This task title already exists!";                    
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        [System.Web.Services.WebMethod]
        public static bool DeleteTask(int taskId)
        {
            try
            {
                using (var dbContext = new TodoContext())
                {
                    var taskToDelete = dbContext.Tasks.FirstOrDefault(t => t.ID == taskId);

                    if (taskToDelete != null)
                    {
                        dbContext.Tasks.Remove(taskToDelete);
                        dbContext.SaveChanges();
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        [System.Web.Services.WebMethod]
        public static dynamic EditTask(int taskId, string title, string description)
        {
            try
            {
                using (var dbContext = new TodoContext())
                {
                    var taskExist = dbContext.Tasks.FirstOrDefault(t => t.Title == title);
                    if (taskExist == null)
                    {
                        var taskToEdit = dbContext.Tasks.FirstOrDefault(t => t.ID == taskId);

                        if (taskToEdit != null)
                        {
                            taskToEdit.Title = title;
                            taskToEdit.Description = description;
                            dbContext.SaveChanges();

                            return true;
                        }
                        return false;
                    } else {
                        return "This task title already exists!";
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        [System.Web.Services.WebMethod]
        public static bool CheckTask(int taskId, bool isChecked)
        {
            try
            {
                using (var dbContext = new TodoContext())
                {
                    var taskToEdit = dbContext.Tasks.FirstOrDefault(t => t.ID == taskId);

                    if (taskToEdit != null)
                    {
                        taskToEdit.Done = isChecked;
                        dbContext.SaveChanges();
                        return true;
                    }
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }
    }
}