<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ToDoList._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>           
       <section class="gradient-custom">          
          <div class="container py-2 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
              <div class="col col-xl-10">

                <div class="card">                    
                  <div class="card-body p-5">
                    <h3>To-Do List</h3>

                    <form id="addTaskForm" class="d-flex justify-content-center align-items-center mb-4">
                      <div class="form-outline  flex-fill">
                        <input type="text" id="form" class="form-control" />
                        <label class="form-label" for="form">Title task...</label>
                      </div>
                      <div class="form-outline flex-fill mt-2">  
                        <textarea type="text" id="form2" class="form-control" ></textarea>
                        <label class="form-label" for="form2">Description task...</label>
                      </div>
                      <button type="button" id="addTaskButton" class="btn btn-info ms-2">Add New Task</button>
                    </form>

                    <!-- Tabs navs -->
                    <ul class="nav nav-tabs mb-4 pb-2" id="ex1" role="tablist">
                      <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="ex1-tab-1" data-mdb-toggle="tab" href="#ex1-tabs-1" role="tab"
                          aria-controls="ex1-tabs-1" aria-selected="true">All</a>
                      </li>
                      <%--<li class="nav-item" role="presentation">
                        <a class="nav-link" id="ex1-tab-2" data-mdb-toggle="tab" href="#ex1-tabs-2" role="tab"
                          aria-controls="ex1-tabs-2" aria-selected="false">Active</a>
                      </li>--%>
                    </ul>
                    <!-- Tabs navs -->

                    <!-- Tabs content -->
                    <div class="tab-content" id="ex1-content">
                      <div class="tab-pane fade show active" id="ex1-tabs-1" role="tabpanel" aria-labelledby="ex1-tab-1">
                        
                        <ul class="list-group mb-0">
                          <% foreach (var task in tasksGrid_GetData()) { %>
                              <li class="list-group-item border-start-0 border-top-0 border-end-0 border-bottom rounded-0 mb-2">                                  
                                <div class="card">
                                    <div class="card-header d-flex align-items-center justify-content-between no-border-top">
                                        <div class="d-flex align-items-center">
                                            <input data-task-id="<%= task.ID %>" class="form-check-input me-2 task-check" type="checkbox" value="" aria-label="..." <% if (task.Done) { %> checked <% } %> />
                                            <input type="text" class="form-control task-title-edit" data-task-id="<%= task.ID %>" value="<%= task.Title %>" />
                                            <div class="task-title" data-task-id="<%= task.ID %>"><%= task.Title %></div>
                                        </div>
                                        <div>
                                            <a href="#!" class="edit-task" data-task-id="<%= task.ID %>" data-mdb-toggle="tooltip" title="Edit item">
                                                <i class="far fa-edit text-primary"></i>
                                            </a>
                                            <a href="#!" class="delete-task" data-task-id="<%= task.ID %>" data-mdb-toggle="tooltip" title="Remove item">
                                                <i class="far fa-trash-can text-primary"></i>
                                            </a>
                                            <a href="#!" class="confirm-edit" data-task-id="<%= task.ID %>" data-mdb-toggle="tooltip" title="Confirm edit">
                                                <i class="far fa-check-circle text-success"></i>
                                            </a>
                                            <a href="#!" class="cancel-edit" data-task-id="<%= task.ID %>" data-mdb-toggle="tooltip" title="Cancel edit">
                                                <i class="fas fa-times-circle text-danger"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-body" style="max-height: 100px; overflow-y: auto; padding: 10px;">
                                        <div class="d-flex align-items-center">                                                    
                                            <textarea class="form-control task-description-edit hide" data-task-id="<%= task.ID %>"><%= task.Description %></textarea>
                                            <p class="task-description" data-task-id="<%= task.ID %>"><%= task.Description %></p>
                                        </div>                                        
                                    </div>
                                </div>
                            </li>
                          <% } %>
                          <%--<li class="list-group-item d-flex justify-content-between align-items-center border-start-0 border-top-0 border-end-0 border-bottom rounded-0 mb-2"
                            style="background-color: #f4f6f7;">
                              <div class="d-flex align-items-center">
                                <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." checked />
                                Dapibus ac facilisis in
                              </div>
                              <a href="#!" data-mdb-toggle="tooltip" title="Remove item">
                               <i class="fas fa-times text-primary"></i>
                             </a>
                          </li>--%>
                        </ul>
                      </div>

                      <%--<div class="tab-pane fade" id="ex1-tabs-2" role="tabpanel" aria-labelledby="ex1-tab-2">
                        <ul class="list-group mb-0">
                          <li class="list-group-item d-flex align-items-center border-0 mb-2 rounded"
                            style="background-color: #f4f6f7;">
                            <input class="form-check-input me-2" type="checkbox" value="" aria-label="..." />
                            Morbi leo risus
                          </li>
                        </ul>
                      </div>--%>                     
                    <!-- Tabs content -->

                  </div>
                </div>

              </div>
            </div>
          </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>

            $(document).ready(function () {
                $('.confirm-edit').hide();
                $('.cancel-edit').hide();
                $('.task-title-edit').hide();
                $('.task-description-edit').hide();

                $('#addTaskButton').click(function () {
                    var title = $("#form").val();
                    var description = $("#form2").val();
                    
                    var dataToSend = {
                        title: title,
                        description: description
                    };

                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/AddTask",
                        data: JSON.stringify(dataToSend),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            console.log('Tarefa adicionada com sucesso:', response);
                            location.reload();
                        },
                        error: function () {
                            console.log('Erro ao adicionar a tarefa.');
                        }
                    });
                });


                $('.edit-task').click(function (e) {
                    e.preventDefault();

                    var taskId = $(this).data('task-id');

                    $(this).hide();
                    $('.delete-task[data-task-id="' + taskId + '"]').hide();
                    $('.confirm-edit[data-task-id="' + taskId + '"]').show();
                    $('.cancel-edit[data-task-id="' + taskId + '"]').show();

                    $('.task-title[data-task-id="' + taskId + '"]').hide();
                    $('.task-description[data-task-id="' + taskId + '"]').hide();

                    $('.task-title-edit[data-task-id="' + taskId + '"]').show();
                    $('.task-description-edit[data-task-id="' + taskId + '"]').show();
                });

                $('.cancel-edit').click(function (e) {
                    e.preventDefault();

                    var taskId = $(this).data('task-id');

                    $('.edit-task[data-task-id="' + taskId + '"]').show();
                    $('.delete-task[data-task-id="' + taskId + '"]').show();
                    $('.confirm-edit[data-task-id="' + taskId + '"]').hide();
                    $('.cancel-edit[data-task-id="' + taskId + '"]').hide();

                    $('.task-title[data-task-id="' + taskId + '"]').show();
                    $('.task-description[data-task-id="' + taskId + '"]').show();
                    $('.task-title-edit[data-task-id="' + taskId + '"]').hide();
                    $('.task-description-edit[data-task-id="' + taskId + '"]').hide();
                });

                $('.confirm-edit').click(function (e) {
                    e.preventDefault();

                    var taskId = $(this).data('task-id');

                    var dataToSend = {
                        taskId: taskId,
                        title : $('.task-title-edit[data-task-id="' + taskId + '"]').val(),
                        description : $('.task-description-edit[data-task-id="' + taskId + '"]').val()
                    };

                    $.ajax({
                        type: "POST",
                        url: 'Default.aspx/EditTask',
                        data: JSON.stringify(dataToSend),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            location.reload();
                        },
                        error: function () {
                            alert('Erro ao editar a tarefa.');
                        }
                    });
                });

                $('.delete-task').click(function(e) {
                    e.preventDefault();
            
                    var dataToSend = {
                        taskId : $(this).data('task-id')
                    };
            
                    if (confirm('Tem certeza que deseja excluir esta tarefa?')) {
                        $.ajax({
                            type: "POST",
                            url: 'Default.aspx/DeleteTask',
                            data: JSON.stringify(dataToSend),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                location.reload();
                            },
                            error: function () {
                                alert('Erro ao excluir a tarefa.');
                            }
                        });
                    }
                });

                $(".task-check").click(function () {
                    var dataToSend = {
                        taskId: $(this).data('taskId'),
                        isChecked : $(this).prop("checked")
                    };

                    $.ajax({
                        type: "POST",
                        url: 'Default.aspx/CheckTask',
                        data: JSON.stringify(dataToSend),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            location.reload();
                        },
                        error: function () {
                            alert('Erro ao editar a tarefa.');
                        }
                    });

                });
            });
        </script>
        </section>
    </main>

</asp:Content>
