<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="<%=path %>/admin/css/style.css">

    
<script src="<%=path%>/admin/js/jquery2.js" type="text/javascript"></script>
<script src="<%=path%>/admin/js/sweetalert2.js" type="text/javascript"></script>
<link href="<%=path%>/admin/css/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/admin/css/pro.css" rel="stylesheet" type="text/css" />

<style>
    #show_tab table {
        width:100%;
        margin:15px 0
    }
    #show_tab th {
        background-color:#13C7A3;
        color:#FFFFFF
    }
    #show_tab,#show_tab th,#show_tab td
    {
        font-size:0.95em;

        padding:4px;
        border:1px solid #78dfca;
        border-collapse:collapse
    }
    #show_tab thead{
        background-color:#b0ece0;
    }
    #show_tab tr:nth-child(even){
        background-color:#fdfdfd;
    }

    td{
            padding-right: 10px;
    }
</style>

<script>
        //声明弹出提示方法
        function showMsg(msg,url) {
                swal({
                        title: msg,
                        html: '<b style="color:red">2</b>&nbsp;秒后自动关闭',
                        type: 'success',
                        confirmButtonText: '确定',
                        timer: 2000,
                }).then(
                        function () {
                                location.href=url;
                        },
                        function (dismiss) {
                                if (dismiss === 'timer') {
                                        location.href=url;
                                }
                        }
                )
        }

        //声明弹出提示方法
        function showMsg2(msg) {
                swal({
                        title: '操作失败',
                        text: msg,
                        type: 'error',
                        confirmButtonText: '确定',
                })
        }


        function showMsg3(url,id) {
                swal({
                        title: '您确定要执行此操作吗?',
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#03a9f4',
                        cancelButtonColor: '#d33',
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                }).then(function () {
                        location.href=url+"?id="+id;
                }, function (dismiss) {
                })
        }

        //声明弹出提示方法
        function showMsg4(msg) {


                swal({
                        title: msg,
                        html: '<b style="color:red">2</b>&nbsp;秒后自动关闭',
                        type: 'success',
                        confirmButtonText: '确定',
                        timer: 2000,
                }).then(
                        function () {

                        },
                        function (dismiss) {
                                if (dismiss === 'timer') {

                                }
                        }
                )
        }

        function showMsg5(url,id) {
                swal({
                        title: '您确定要执行此操作吗?',
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#03a9f4',
                        cancelButtonColor: '#d33',
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                }).then(function () {
                        location.href=url+"?f=1&id="+id;
                }, function (dismiss) {
                })
        }

</script>

  
