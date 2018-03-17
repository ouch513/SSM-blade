$(function () {
    $('#regin-btn').bind('click', function () {
        $('#regin-warning').addClass('hide');
        var username = $('#regin-username').val();
        var email = $('#regin-email').val();
        var password = $('#regin-password').val();
        var check = $('#check-password').val();

        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/user/add',
            type: 'POST',
            data: {
                'username': username,
                'email': email,
                'password': password,
                'checkpass': check
            },
            dataType: 'json',
            success: function (obj) { //成功回调函数
                if (obj['status'] === 'error') {
                    $('#regin-warning').removeClass('hide');
                    $('#regin-warning strong').text(obj['info']);
                } else {
                    alert('注册成功（用户ID：' + obj['data']['userId'] + '）');
                    window.location.href = webPath + '/dashboard/login';
                }
            },
            error: function () {
                $('#regin-warning').removeClass('hide');
                $('#regin-warning strong').text('服务器请求失败！');
            }
        });
    })
})