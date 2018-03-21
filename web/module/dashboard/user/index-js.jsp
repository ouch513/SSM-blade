<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
$(function () {

    getUserListData();

    $('#refresh-data').bind('click',function () {
        getUserListData();
    });

    function getUserListData(){
        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath+'/api/user/list',
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
                            + "<td>" + obj['data'][i]['username'] +"</td>"
                            + "<td>" + obj['data'][i]['email'] +"</td>";

                        if(obj['data'][i]['role']==="会员用户"){
                            trData += "<td><span class='text-danger'>" + obj['data'][i]['role'] +"</span></td>";
                        }else{
                            trData += "<td>" + obj['data'][i]['role'] +"</td>";
                        }

                        if(obj['data'][i]['adminRole']==="管理员"){
                            trData += "<td><span class='label label-success'>" + obj['data'][i]['adminRole'] +"</span></td>";
                        }else if(obj['data'][i]['adminRole']==="超级管理员"){
                            trData += "<td><span class='label label-danger'>" + obj['data'][i]['adminRole'] +"</span></td>";
                        }else{
                            trData += "<td>" + obj['data'][i]['adminRole'] +"</td>";
                        }

                        trData += "<td>" + obj['data'][i]['regTime'] +"</td>";

                        trData += "<td><a href='"+webPath+'/dashboard/user/show/'+obj['data'][i]['userId']+"'><span class='label label-success' style='cursor:pointer'>查看</span></a></td>";

                        trData +="</tr>";

                        $('#dataTables tbody').append(trData);
                    }
                }

                $('#dataTables').dataTable();
            },
            error:function (){ //失败回调函数
                getUserListData();
            }
        });
    }
});
</script>