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
            <form  action="<%=path %>/mtypeAdd.action" method="post" id="form1">
    <table style="width: 100%;" id="show_tab">
        
<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>分类名称:</td><td>
<input name="tname" type="text" id="tname" style="width: 200px;" required />
 </td></tr>


        <tr>
            <td>&nbsp;</td>
            <td align="left">
                <input type="submit" name="btnAdd" value="添 加"      class="btn btn-primary mb-2 mr-2 " />
                <input name="btnReturn" type="button" value="返 回"   class=" btn btn-success mb-2 mr-2"  onclick="location.href='<%=path %>/mtypeList.action';"  />
            </td>
        </tr>
    </table>
</form>



        </div>
    </div>
    

  </body>
</html>



