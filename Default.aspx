<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ToDoList._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <script src="/Scripts/CustomScript/default.js"></script>
    </head>
    <main>           
       <section class="gradient-custom">          
          <div class="container py-2 h-100">
            <div class="card">   
                <div class="card-header">
                    <h3>To-Do List</h3>
                </div>  
                <div class="card-body pt-0">
                    <form id="addTaskForm" class="row g-4">
                        <div class="col-md-12">
                            <div class="form-outline">
                                <input type="text" id="form" class="form-control" data-mdb-showcounter="true" maxlength="60"/>
                                <label class="form-label" for="form">Title</label>
                                <div class="form-helper"></div>
                                <div class="invalid-feedback">Insert title before submitting.</div>
                            </div>
                        </div>
                        <div class="col-md-12 mt-4 pb-4">
                            <div class="form-outline">  
                                <textarea type="text" id="form2" class="form-control customSize"  data-mdb-showcounter="true" maxlength="255"></textarea>
                                <label class="form-label" for="form2">Description</label>
                                <div class="form-helper"></div>
                                <div class="invalid-feedback">Insert description before submitting.</div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <a id="addTaskButton" class="btn btn-dark">
                                Add New Task  <i class="fas fa-plus"></i>
                            </a>
                        </div>
                    </form>

                    <!-- Tabs navs -->
                    <ul class="nav nav-tabs mt-2 mb-1 pb-2" id="ex1" role="tablist">
                        <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="ex1-tab-1" data-mdb-toggle="tab" href="#ex1-tabs-1" role="tab"
                            aria-controls="ex1-tabs-1" aria-selected="true">All</a>
                        </li>
                    </ul>
                    <!-- Tabs navs -->

                    <!-- Tabs content -->
                    <div class="tab-content" id="ex1-content">
                        <div class="tab-pane scroll fade show active" id="ex1-tabs-1" role="tabpanel" aria-labelledby="ex1-tab-1">
                        
                         <ul class="list-group">
                        <% foreach (var task in tasksGrid_GetData()) { %>
                            <li class="list-group-item border-start-0 border-top-0 border-end-0 border-bottom-0 rounded-0">                                  
                            <div class="card ">
                                <div class="card-header pt-2 pb-2 d-flex align-items-center justify-content-between no-border-top">
                                    <div class="d-flex align-items-center">
                                        <input data-task-id="<%= task.ID %>" class="form-check-input me-2 task-check" type="checkbox" value="" aria-label="..." <% if (task.Done) { %> checked <% } %> />
                                        <input type="text" class="form-control task-title-edit" data-task-id="<%= task.ID %>" value="<%= task.Title %>" />
                                        <div class="invalid-feedback ms-4 pt-5 mt-3">Insert title before confirm editing.</div>
                                        <div class="task-title" data-task-id="<%= task.ID %>">
                                            <% if (task.Done) { %>
                                               <s><%= task.Title %></s>
                                            <% } else { %>  
                                                <%= task.Title %>
                                            <% } %>

                                        </div>
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
                                <div class="card-body pt-2 pb-2">
                                    <div class="d-flex align-items-center d-inline-block">                                                    
                                        <textarea class="form-control task-description-edit customSize hide" data-task-id="<%= task.ID %>"><%= task.Description %></textarea>
                                        <div class="invalid-feedback ms-2 pt-5 mt-3">Insert description before confirm editing.</div>
                                        <p class="task-description" data-task-id="<%= task.ID %>"><%= task.Description %></p>
                                    </div>                                        
                                </div>
                            </div>
                        </li>
                        <% } %>
                    </ul>
                        </div>
                   
                <!-- Tabs content -->

                   </div>
                </div>
            </div>
          </div>
        </section>
    </main>

</asp:Content>
