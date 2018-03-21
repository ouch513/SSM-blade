<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {
    getBulletinInfo();

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
                    $('#edit-content').val(obj['data']['content']);
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
        var content = $('#edit-content').val();

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

});
</script>
