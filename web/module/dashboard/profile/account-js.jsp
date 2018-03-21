<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {
    getAccountInfo();

    $('#account-show-btn').bind('click',function () {
        $('#account-edit-success').addClass('hide');
        getAccountInfo();
    });

    $('#account-edit-btn').bind('click', function () {
        editUserInfo();
    })

    $('#account-pass-btn').bind('click', function () {
        editPassword();
    })

    function getAccountInfo(){
        $('#account-edit-warning').addClass('hide');
        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath+'/api/user/queryByUserId',
            type:'POST',
            data: {
                'userId': "<%=request.getSession().getAttribute("userId")%>"
            },
            dataType: 'json',
            success:function(obj){ //成功回调函数
                if (obj['status']==='error'){

                    if(obj['info']==='登录超时'){
                        alert(obj['info']);
                        window.location.href = webPath+'/dashboard/login';
                    }else{
                        $('#account-edit-warning').removeClass('hide');
                        $('#account-edit-warning strong').text(obj['info']);
                    }

                } else {
                    $('#account-username').val(obj['data']['username']);
                    $('#account-email').val(obj['data']['email']);
                    $('#account-role').val(obj['data']['role']);
                    $('#account-admin-role').val(obj['data']['adminRole']);
                }
            },
            error:function (){ //失败回调函数
                getAccountInfo();
            }
        });
    }

    function editUserInfo() {
        $('#account-edit-success').addClass('hide');
        $('#account-edit-warning').addClass('hide');
        var email = $('#account-email').val();

        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/user/edit',
            type: 'POST',
            data: {
                'email': email,
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
                        $('#account-edit-warning').removeClass('hide');
                        $('#account-edit-warning strong').text(obj['info']);
                    }

                } else {
                    $('#account-edit-success').removeClass('hide');
                    $('#account-edit-success strong').text(obj['info']);
                    getAccountInfo();
                }
            },
            error: function () {
                editUserInfo();
            }
        });
    }

    function editPassword() {
        $('#account-pass-success').addClass('hide');
        $('#account-pass-warning').addClass('hide');
        var password = $('#edit-account-password').val();
        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/user/editPass',
            type: 'POST',
            data: {
                'password': password,
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
                        $('#account--pass-warning').removeClass('hide');
                        $('#account-pass-warning strong').text(obj['info']);
                    }

                } else {
                    $('#account-pass-success').removeClass('hide');
                    $('#account-pass-success strong').text(obj['info']);
                }
            },
            error: function () {
                editPassword();
            }
        });
    }

});
</script>
