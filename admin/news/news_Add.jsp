<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
 <jsp:include flush="true" page="${basePath}/admin/head.jsp"></jsp:include>     
 </head>
 
  <body>


        
     
       
        <div style="width: 100%; padding: 20px;line-height: 29px;" class="row">
        <div style="width: 100%; padding: 20px;line-height: 29px;">
            <form  action="<%=path %>/newsAdd.action" method="post" id="form1">
    <table style="width: 100%;" id="show_tab">
        
<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>标题:</td><td>
<input name="title" type="text" id="title" style="width: 200px;" required />
 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>资讯图片:</td><td>
<script type="text/javascript" src="<%=path%>/admin/js/popup_shuaxin_no.js"></script>
<script language="javascript">

    function up2()
    {
        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
        pop.setContent("contentUrl","<%=path%>/upfile/upload1.jsp");
        pop.setContent("title","文件上传");
        pop.build();
        pop.show();
    }
</script>
<input type="text" name="photo" id="fujian" size="50" readonly="readonly" />
<input type="button" value="上传" onclick="up2()" />
 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>资讯内容:</td><td>
<link rel="stylesheet" href="<%=path %>/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=path %>/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=path %>/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=path %>/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=path %>/kindeditor/plugins/code/prettify.js"></script>
<script>
    KindEditor.ready(function(K) {
        var editor1 = K.create('textarea[name="memo"]', {
            cssPath : '<%=path %>/kindeditor/plugins/code/prettify.css',
            uploadJson : '<%=path %>/kindeditor/jsp/upload_json.jsp',
            fileManagerJson : '<%=path %>/kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            afterCreate : function() {
                var self = this;
                K.ctrl(document, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
                K.ctrl(self.edit.doc, 13, function() {
                    self.sync();
                    document.forms['example'].submit();
                });
            }
        });
        prettyPrint();
    });
</script>
<textarea id="memo"  name="memo" cols="100" rows="8" style="width:700px;height:400px;visibility:hidden;"></textarea>
 </td></tr>



        <tr>
            <td>&nbsp;</td>
            <td align="left">
                <input type="submit" name="btnAdd" value="添 加"      class="btn btn-primary mb-2 mr-2 " />
                <input name="btnReturn" type="button" value="返 回"   class=" btn btn-success mb-2 mr-2"  onclick="location.href='<%=path %>/newsList.action';"  />
            </td>
        </tr>
    </table>
</form>



        </div>
    </div>
    

  </body>
</html>



