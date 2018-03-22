<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {
    var ue = UE.getEditor('edit-content');
    ue.ready(function () {
        ue.setHeight(400);
        getBulletinInfo();
    });

    $('#edit-btn').bind('click', function () {
        updateBulletinInfo();
    })

    function getBulletinInfo(){
        $('#edit-warning').addClass('hide');
        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath+'/api/bulletin/queryById',
            type:'POST',
            data: {
                'userId': "<%=request.getSession().getAttribute("userId")%>",
                'token': "<%=request.getSession().getAttribute("token")%>",
                'bulletinId': "${bulletinId}"
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
                    $('#edit-title').val(obj['data']['title']);
                    ue.setContent(htmlDecodeByRegExp(obj['data']['content']));
                }
            },
            error:function (){ //失败回调函数
                getBulletinInfo();
            }
        });
    }

    function updateBulletinInfo() {
        $('#edit-success').addClass('hide');
        $('#edit-warning').addClass('hide');
        var title = $('#edit-title').val();
        var content = htmlEncodeByRegExp(ue.getContent());

        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/bulletin/update',
            type: 'POST',
            data: {
                'title': title,
                'content': content,
                'bulletinId': "${bulletinId}",
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
                    getBulletinInfo();
                }
            },
            error: function () {
                updateBulletinInfo();
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

    function htmlDecodeByRegExp(str) {
        var s = "";
        if (str.length == 0) return "";
        s = str.replace(/&amp;/g, "&");
        s = s.replace(/&lt;/g, "<");
        s = s.replace(/&gt;/g, ">");
        s = s.replace(/&nbsp;/g, " ");
        s = s.replace(/&#39;/g, "\'");
        s = s.replace(/&quot;/g, "\"");
        return s;
    }
});
</script>
