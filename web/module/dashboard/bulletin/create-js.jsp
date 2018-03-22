<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {

        var ue = UE.getEditor('create-content');
        ue.ready(function () {
            ue.setHeight(400);
        });

        $('#create-btn').bind('click', function () {
            createBulletin();
        });

        function createBulletin() {
            $('#create-warning').addClass('hide');
            var title = $('#create-title').val();
            var content = htmlEncodeByRegExp(ue.getContent());

            var webPath = window.location.protocol + "//" + window.location.host;

            $.ajax({
                url: webPath + '/api/bulletin/create',
                type: 'POST',
                data: {
                    'title': title,
                    'content': content,
                    'userId': "<%=request.getSession().getAttribute("userId")%>",
                    'token': "<%=request.getSession().getAttribute("token")%>"
                },
                dataType: 'json',
                success: function (obj) { //成功回调函数
                    if (obj['status'] === 'error') {

                        if (obj['info'] === '登录超时') {
                            alert(obj['info']);
                            window.location.href = webPath + '/dashboard/login';
                        } else {
                            $('#create-warning').removeClass('hide');
                            $('#create-warning strong').text(obj['info']);
                        }

                    } else {
                        window.location.href = webPath + '/dashboard/bulletin/show/' + obj['data']['bulletinId'];
                    }
                },
                error: function () {
                    createBulletin();
                }
            });
        }


        function htmlEncodeByRegExp(str) {
            var s = "";
            if (str.length == 0) return "";
            s = str.replace(/&/g, "&amp;");
            s = s.replace(/</g, "&lt;");
            s = s.replace(/>/g, "&gt;");
            s = s.replace(/ /g, "&nbsp;");
            s = s.replace(/\'/g, "&#39;");
            s = s.replace(/\"/g, "&quot;");
            return s;
        }

    })
</script>