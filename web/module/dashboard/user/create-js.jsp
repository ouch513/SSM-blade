<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {

        $('#create-btn').bind('click', function () {
            createUser();
        });

        function createUser() {
            $('#create-warning').addClass('hide');
            var username = $('#create-username').val();
            var email = $('#create-email').val();
            var password = $('#create-password').val();
            var role = $('input[name="role"]:checked').val();
            var adminRole = $('input[name="adminRole"]:checked').val();

            var webPath = window.location.protocol + "//" + window.location.host;

            $.ajax({
                url: webPath + '/api/user/create',
                type: 'POST',
                data: {
                    'username': username,
                    'email': email,
                    'password': password,
                    'role': role,
                    'adminRole': adminRole,
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
                            $('#create-warning').removeClass('hide');
                            $('#create-warning strong').text(obj['info']);
                        }

                    } else {
                        alert('创建成功!\n您设置的密码是: ' + password);
                        window.location.href = webPath + '/dashboard/user/show/' + obj['data']['userId'];
                    }
                },
                error: function () {
                    createUser();
                }
            });
        }
    })
</script>