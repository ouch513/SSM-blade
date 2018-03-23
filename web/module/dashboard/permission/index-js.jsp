<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {

    getPermissionListData();

    $('#refresh-data').bind('click',function () {
        getPermissionListData();
    });

    $('#create-btn').bind('click', function () {
        createPermission();
    });

    function createPermission() {
        var name = $('#create-permission-name').val();
        var slug = $('#create-permission-slug').val();
        var type = $('#create-permission-type').val();

        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath + '/api/permission/create',
            type: 'POST',
            data: {
                'name': name,
                'slug': slug,
                'type': type,
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
                        alert(obj['info']);
                    }

                } else {
                    alert(obj['info']);
                    $('#create-permission-name').val("");
                    $('#create-permission-slug').val("");
                    getPermissionListData();
                }
            },
            error: function () {
                createPermission();
            }
        });
    }

    function getPermissionListData(){
        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath+'/api/permission/list',
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
                            + "<td>" + obj['data'][i]['name'] +"</td>"
                            + "<td>" + obj['data'][i]['slug'] +"</td>";

                        if(obj['data'][i]['type']==="管理权限"){
                            trData += "<td><span class='text-success'>" + obj['data'][i]['type'] +"</span></td>";
                        }else{
                            trData += "<td><span class='text-warning'>" + obj['data'][i]['type'] +"</span></td>";
                        }

                        trData += "<td><a href='"+webPath+'/dashboard/permission/show/'+obj['data'][i]['permissionId']+"'><span class='label label-success' style='cursor:pointer'>修改</span></a></td>";

                        trData +="</tr>";

                        $('#dataTables tbody').append(trData);
                    }
                }

                $('#dataTables').dataTable();
            },
            error:function (){ //失败回调函数
                getPermissionListData();
            }
        });
    }
});
</script>