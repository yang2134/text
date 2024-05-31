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
