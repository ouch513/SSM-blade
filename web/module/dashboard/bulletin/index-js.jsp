<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {

    getBulletinListData();

    $('#refresh-data').bind('click',function () {
        getBulletinListData();
    });

    function getBulletinListData(){
        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath+'/api/bulletin/list',
            type:'POST',
            data: {
                'userId': "<%=request.getSession().getAttribute("userId")%>",
                'token': "<%=request.getSession().getAttribute("token")%>"
            },
            dataType: 'json',
            success:function(obj){ //成功回调函数
                $('#dataTables tbody').html('');
                if (obj['status']==='error'){

                    if(obj['info']==='登录超时'){
                        alert(obj['info']);
                        window.location.href = webPath+'/dashboard/login';
                    }else{
                        var errorInfo = "<tr><td colspan='6'>" + obj['info'] + "</td></tr>";
                        $('#dataTables tbody').append(errorInfo);
                    }

                } else {
                    for(var i=0; i < obj['data'].length; i++){

                        var trData = "<tr>"
                            + "<td>" + obj['data'][i]['title'] +"</td>"
                            + "<td>" + obj['data'][i]['updatedAt'] +"</td>";

                        trData += "<td><a href='"+webPath+'/dashboard/bulletin/show/'+obj['data'][i]['bulletinId']+"'><span class='label label-success' style='cursor:pointer'>查看</span></a>";
                        trData += " <a href='"+webPath+'/dashboard/bulletin/edit/'+obj['data'][i]['bulletinId']+"'><span class='label label-warning' style='cursor:pointer'>修改</span></a>";
                        trData +="</td></tr>";

                        $('#dataTables tbody').append(trData);
                    }
                }

                $('#dataTables').dataTable();
            },
            error:function (){ //失败回调函数
                getBulletinListData();
            }
        });
    }
});
</script>