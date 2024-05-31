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
            <form  action="<%=path %>/membersEdit.action" method="post"  id="form1">
    <table style="width: 100%;" id="show_tab">
        


<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>姓名:</td><td>
<input name="sname" type="text" id="sname" style="width: 200px;" required  value='${members.sname}' />
 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>手机号码:</td><td>
<input name="tel" type="text" id="tel" style="width: 200px;"  required   pattern="^(13|15|17|18|19)[0-9]{9}$" oninvalid="setCustomValidity('请输入正确的手机号')" oninput="setCustomValidity('')"   value='${members.tel}' />
 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>联系地址:</td><td>
<input name="address" type="text" id="address" style="width: 200px;" required  value='${members.address}' />
 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>QQ:</td><td>
<input name="qq" type="text" id="qq" style="width: 200px;" required  value='${members.qq}' />
 </td></tr>

<tr><td  style="text-align:right; width:20%;">
<font style='color:red'>*&nbsp;</font>电子邮箱:</td><td>
<input name="email" type="text" id="email" style="width: 200px;"  required   pattern="\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}" oninvalid="setCustomValidity('请输入正确的邮箱')" oninput="setCustomValidity('')"   value='${members.email}' />
 </td></tr>



        <tr>
            <td>&nbsp;</td>
            <td align="left">
                <input name="meid" type="hidden"  value='<%= request.getParameter("id") %>'>
                <input type="submit" name="btnAdd" value="保 存"      class="btn btn-primary mb-2 mr-2 " />
                <input name="btnReturn" type="button" value="返 回"   class=" btn btn-success mb-2 mr-2"  onclick="history.go(-1);"  />
            </td>
        </tr>
    </table>
</form>



        </div>
    </div>
    

  </body>
</html>



