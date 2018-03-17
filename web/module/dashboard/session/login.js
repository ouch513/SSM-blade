$(function () {
    $('#login-btn').bind('click', function () {
        $('#login-warning').addClass('hide');
        var username = $('#login-username').val();
        var password = $('#login-password').val();

        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/user/login',
            type: 'POST',
            data: {
                'username': username,
                'password': password
            },
            dataType: 'json',
            success: function (obj) { //成功回调函数
                if (obj['status'] === 'error') {
                    $('#login-warning').removeClass('hide');
                    $('#login-warning strong').text(obj['info']);
                }else {
                    window.location.href = webPath + '/dashboard/index';
                }
            },
            error: function () {
                $('#login-warning').removeClass('hide');
                $('#login-warning strong').text('服务器请求失败！');
            }
        });
    })
})