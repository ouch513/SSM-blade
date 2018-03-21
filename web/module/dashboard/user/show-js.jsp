<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {
    getUserInfo();

    $('#refresh-show-btn').bind('click',function () {
        $('#edit-success').addClass('hide');
        getUserInfo();
    });

    $('#edit-btn').bind('click', function () {
        updateUserInfo();
    })

    $('#edit-pass-btn').bind('click', function () {
        updatePassword();
    })

    $('#delete-user').bind('click', function () {
        deleteUser();
    })

    function getUserInfo(){
        $('#edit-warning').addClass('hide');
        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath+'/api/user/queryById',
            type:'POST',
            data: {
                'curId': "<%=request.getSession().getAttribute("userId")%>",
                'token': "<%=request.getSession().getAttribute("token")%>",
                'userId': "${userId}"
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
                    $('#edit-username').val(obj['data']['username']);
                    $('#edit-email').val(obj['data']['email']);

                    if(obj['data']['adminRole']==="管理员"){
                        $('#show-admin-role').html('用户 <span class="label label-success">管理员</span>：');
                    }else if(obj['data']['adminRole']==="超级管理员"){
                        $('#show-admin-role').html('用户 <span class="label label-danger">超级管理员</span>：');
                    }else{
                        $('#show-admin-role').html('用户：');
                    }

                    $('#edit-member').prop('checked',false);
                    $('#edit-vip').prop('checked',false);
                    if(obj['data']['role']==="会员用户"){
                        $('#edit-vip').prop('checked',true);
                    }else {
                        $('#edit-member').prop('checked',true);
                    }
                }
            },
            error:function (){ //失败回调函数
                getUserInfo();
            }
        });
    }

    function updateUserInfo() {
        $('#edit-success').addClass('hide');
        $('#edit-warning').addClass('hide');
        var email = $('#edit-email').val();
        var role = $('input[name="role"]:checked').val();

        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/user/update',
            type: 'POST',
            data: {
                'email': email,
                'role': role,
                'userId': "${userId}",
                'curId': "<%=request.getSession().getAttribute("userId")%>",
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
                    getUserInfo();
                }
            },
            error: function () {
                updateUserInfo();
            }
        });
    }

    function updatePassword() {
        $('#edit-pass-success').addClass('hide');
        $('#edit-pass-warning').addClass('hide');
        var password = $('#edit-pass-password').val();
        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/user/updatePass',
            type: 'POST',
            data: {
                'password': password,
                'userId': "${userId}",
                'curId': "<%=request.getSession().getAttribute("userId")%>",
                'token': "<%=request.getSession().getAttribute("token")%>"
            },
            dataType: 'json',
            success: function (obj) { //成功回调函数
                if (obj['status'] === 'error') {

                    if(obj['info']==='登录超时'){
                        alert(obj['info']);
                        window.location.href = webPath+'/dashboard/login';
                    }else{
                        $('#edit-pass-warning').removeClass('hide');
                        $('#edit-pass-warning strong').text(obj['info']);
                    }

                } else {
                    $('#edit-pass-success').removeClass('hide');
                    $('#edit-pass-success strong').text(obj['info']);
                }
            },
            error: function () {
                updatePassword();
            }
        });
    }

    function deleteUser() {
        $('#delete-success').addClass('hide');
        $('#delete-warning').addClass('hide');
        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/user/delete',
            type: 'POST',
            data: {
                'userId': "${userId}",
                'curId': "<%=request.getSession().getAttribute("userId")%>",
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
                    window.location.href = webPath+'/dashboard/user/index';
                }
            },
            error: function () {
                deleteUser();
            }
        });
    }
});
</script>
