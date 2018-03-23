<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {
    getPermissionInfo();

    $('#refresh-show-btn').bind('click',function () {
        $('#edit-success').addClass('hide');
        getPermissionInfo();
    });

    $('#edit-btn').bind('click', function () {
        updatePermissionInfo();
    })

    $('#delete-permission').bind('click', function () {
        deletePermission();
    })

    function getPermissionInfo(){
        $('#edit-warning').addClass('hide');
        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath+'/api/permission/queryById',
            type:'POST',
            data: {
                'userId': "<%=request.getSession().getAttribute("userId")%>",
                'token': "<%=request.getSession().getAttribute("token")%>",
                'permissionId': "${permissionId}"
            },
            dataType: 'json',
            success:function(obj){ //成功回调函数
                if (obj['status']==='error'){

                    if(obj['info']==='登录超时'){
                        alert(obj['info']);
                        window.location.href = webPath+'/dashboard/login';
                    }else{
                        $('#edit-warning').removeClass('hide');
                        $('#edit-warning strong').text(obj['info']);
                    }

                } else {
                    $('#edit-permission-name').val(obj['data']['name']);
                    $('#edit-permission-slug').val(obj['data']['slug']);
                    if(obj['data']['type']==="管理权限"){
                        $("#edit-permission-type").get(0).options[0].selected = true;
                    }else {
                        $("#edit-permission-type").get(0).options[1].selected = true;
                    }
                }
            },
            error:function (){ //失败回调函数
                getPermissionInfo();
            }
        });
    }

    function updatePermissionInfo() {
        $('#edit-success').addClass('hide');
        $('#edit-warning').addClass('hide');
        var name = $('#edit-permission-name').val();
        var slug = $('#edit-permission-slug').val();
        var type = $('#edit-permission-type').val();

        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/permission/update',
            type: 'POST',
            data: {
                'name': name,
                'slug': slug,
                'type': type,
                'permissionId': "${permissionId}",
                'userId': "<%=request.getSession().getAttribute("userId")%>",
                'token': "<%=request.getSession().getAttribute("token")%>"
            },
            dataType: 'json',
            success: function (obj) { //成功回调函数
                if (obj['status'] === 'error') {

                    if(obj['info']==='登录超时'){
                        alert(obj['info']);
                        window.location.href = webPath+'/dashboard/login';
                    }else{
                        $('#edit-warning').removeClass('hide');
                        $('#edit-warning strong').text(obj['info']);
                    }

                } else {
                    $('#edit-success').removeClass('hide');
                    $('#edit-success strong').text(obj['info']);
                    getPermissionInfo();
                }
            },
            error: function () {
                updatePermissionInfo();
            }
        });
    }

    function deletePermission() {
        $('#delete-success').addClass('hide');
        $('#delete-warning').addClass('hide');
        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/permission/delete',
            type: 'POST',
            data: {
                'permissionId': "${permissionId}",
                'userId': "<%=request.getSession().getAttribute("userId")%>",
                'token': "<%=request.getSession().getAttribute("token")%>"
            },
            dataType: 'json',
            success: function (obj) { //成功回调函数
                if (obj['status'] === 'error') {

                    if(obj['info']==='登录超时'){
                        alert(obj['info']);
                        window.location.href = webPath+'/dashboard/login';
                    }else{
                        $('#delete-warning').removeClass('hide');
                        $('#delete-warning strong').text(obj['info']);
                    }

                } else {
                    $('#delete-success').removeClass('hide');
                    $('#delete-success strong').text(obj['info']);
                    window.location.href = webPath+'/dashboard/permission/index';
                }
            },
            error: function () {
                deletePermission();
            }
        });
    }
});
</script>
