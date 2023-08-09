$(document).ready(function () {
    $('.confirm-edit').hide();
    $('.cancel-edit').hide();
    $('.task-title-edit').hide();
    $('.task-description-edit').hide();

    $('#form').blur(function (event) {
        var title = $("#form").val();
        if (title == "") {
            $("#form").addClass('is-invalid');
        } else {
            $("#form").removeClass('is-invalid');
        }
    });
    $('#form2').blur(function (event) {
        var description = $("#form2").val();
        if (description == "") {
            $("#form2").addClass('is-invalid');
        } else {
            $("#form2").removeClass('is-invalid');
        }
    });

    $('#addTaskButton').click(function (event) {
        event.preventDefault();

        var title = $("#form").val();
        var description = $("#form2").val();


        if (title != "" && description != "") {
            if (title == "") {
                $("#form").removeClass('is-invalid');
            }
            if (description == "") {
                $("#form2").removeClass('is-invalid');
            }

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
                    if (response.d != true) {
                        alert(response.d)
                    } else {
                        console.log('Tarefa adicionada com sucesso.');
                    }
                    location.reload();
                },
                error: function () {
                    console.log('Erro ao adicionar a tarefa.');
                }
            });
        }
        else {
            if (title == "") {
                $("#form").addClass('is-invalid');
            } else {
                $("#form").removeClass('is-invalid');
            }
            if (description == "") {
                $("#form2").addClass('is-invalid');
            } else {
                $("#form2").removeClass('is-invalid');
            }
        }
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

        location.reload();
    });

    $('.confirm-edit').click(function (e) {
        e.preventDefault();

        var taskId = $(this).data('task-id');
        var title = $('.task-title-edit[data-task-id="' + taskId + '"]').val();
        var description = $('.task-description-edit[data-task-id="' + taskId + '"]').val();

        if (title != "" && description != "") {
            if (title == "") {
                $('.task-title-edit[data-task-id="' + taskId + '"]').removeClass('is-invalid');
            }
            if (description == "") {
                $('.task-description-edit[data-task-id="' + taskId + '"]').removeClass('is-invalid');
            }

            var dataToSend = {
                taskId: taskId,
                title: title,
                description: description
            };

            $.ajax({
                type: "POST",
                url: 'Default.aspx/EditTask',
                data: JSON.stringify(dataToSend),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d != true) {
                        alert(response.d)
                    } else {
                        console.log('Tarefa editada com sucesso.');
                    }
                    location.reload();
                },
                error: function () {
                    alert('Erro ao editar a tarefa.');
                }
            });

        } else {
            if (title == "") {
                $('.task-title-edit[data-task-id="' + taskId + '"]').addClass('is-invalid');
            } else {
                $('.task-title-edit[data-task-id="' + taskId + '"]').removeClass('is-invalid');
            }
            if (description == "") {
                $('.task-description-edit[data-task-id="' + taskId + '"]').addClass('is-invalid');
            } else {
                $('.task-description-edit[data-task-id="' + taskId + '"]').removeClass('is-invalid');
            }
        }
    });

    $('.delete-task').click(function (e) {
        e.preventDefault();

        var dataToSend = {
            taskId: $(this).data('task-id')
        };

        if (confirm('Tem certeza que deseja excluir esta tarefa?')) {
            $.ajax({
                type: "POST",
                url: 'Default.aspx/DeleteTask',
                data: JSON.stringify(dataToSend),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    setTimeout(function () {
                        location.reload();
                    }, 300);
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
            isChecked: $(this).prop("checked")
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