$(function () {

    getUserListData();

    $('#refresh-data').bind('click',function () {
        getUserListData();
    });

    function getUserListData(){
        var webPath = window.location.protocol + "//" + window.location.host;
        $.ajax({
            url: webPath+'/api/user/list',
            type:'GET',
            dataType: 'json',
            success:function(obj){ //成功回调函数
                $('#dataTables tbody').html('');
                if (obj['status']==='error'){
                    var errorInfo = "<tr><td colspan='5'>" + obj['info'] + "</td></tr>";
                    $('#dataTables tbody').append(errorInfo);
                } else {
                    for(var i=0; i < obj['data'].length; i++){

                        var trData = "<tr>"
                            + "<td>" + obj['data'][i]['username'] +"</td>"
                            + "<td>" + obj['data'][i]['email'] +"</td>"
                            + "<td>" + obj['data'][i]['role'] +"</td>";

                        if(obj['data'][i]['adminRole']==="管理员"){
                            trData += "<td><span class='label label-success'>" + obj['data'][i]['adminRole'] +"</span></td>";
                        }else if(obj['data'][i]['adminRole']==="超级管理员"){
                            trData += "<td><span class='label label-danger'>" + obj['data'][i]['adminRole'] +"</span></td>";
                        }else{
                            trData += "<td>" + obj['data'][i]['adminRole'] +"</td>";

                        }

                        trData += "<td>" + obj['data'][i]['regTime'] +"</td></tr>";

                        $('#dataTables tbody').append(trData);
                    }
                }

                $('#dataTables').dataTable();
            },
            error:function (){ //失败回调函数
                $('#dataTables tbody').html('');
                $('#dataTables tbody').append("<tr><td colspan='5'>获取数据失败</td></tr>")
            }
        });
    }
});