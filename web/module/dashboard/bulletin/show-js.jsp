<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {
    getBulletinInfo();

    $('#refresh-show-btn').bind('click',function () {
        $('#edit-success').addClass('hide');
        getBulletinInfo();
    });

    $('#delete-btn').bind('click',function () {
        deleteBulletin();
    });

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
                    $('#show-title').html(obj['data']['title']);
                    $('#show-content').html(obj['data']['content']);
                }
            },
            error:function (){ //失败回调函数
                getBulletinInfo();
            }
        });
    }

    function deleteBulletin() {
        $('#delete-warning').addClass('hide');
        var webPath = window.location.protocol + "//" + window.location.host;

        $.ajax({
            url: webPath + '/api/bulletin/delete',
            type: 'POST',
            data: {
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
                        $('#delete-warning').removeClass('hide');
                        $('#delete-warning strong').text(obj['info']);
                    }

                } else {
                    window.location.href = webPath+'/dashboard/bulletin/index';
                }
            },
            error: function () {
                deleteBulletin();
            }
        });
    }
});
</script>
