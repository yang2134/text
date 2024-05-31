<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"  %> 
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
            <table style="width: 100%;text-align: center">
    <tr>
        <td>
            <form action="<%=path %>/membersList.action" method="post">
<strong> 微信昵称:</strong><input name="mname" type="text" id="mname" style="width: 150px;"  />
<strong> 姓名:</strong><input name="sname" type="text" id="sname" style="width: 150px;"  />
<strong> 手机号码:</strong><input name="tel" type="text" id="tel" style="width: 150px;"  />

<input name="search" type="submit" border="0" class="btn btn-primary mb-2 mr-2 "	value='搜索' />
</form>

        </td>
    </tr>
    <tr>
        <td>
            <pg:pager  url="membersList.action" items="${itemSize}" maxPageItems="${pageItem}"
                       maxIndexPages="${pageItem}" isOffset="${true}" export = "offset,currentPageNumber=pageNumber"  scope ="request" >
            
    <table style="width:100%;text-align: center" id="show_tab">
        <thead>
        <tr>
        <td >微信昵称</td>
        <td >头像</td>
        <td >姓名</td>
        <td >手机号码</td>
        <td >联系地址</td>
        <td >QQ</td>
        <td >电子邮箱</td>
        <td >注册时间</td>
        <td>操作</td>
</tr>

        </thead>
        <tbody>
        <c:forEach items="${membersList}" var="members" varStatus="status" >
        <tr>
        <td>${members.mname}</td>
        <td><img  src="${members.photo}" width="80"  height="80" /></td>
        <td>${members.sname}</td>
        <td>${members.tel}</td>
        <td>${members.address}</td>
        <td>${members.qq}</td>
        <td>${members.email}</td>
        <td>${members.matime}</td>
<td>
        <a href="<%=path %>/tomembersView.action?id=${members.meid}" class="cu-tag bg-cyan light "><i class="glyphicon glyphicon-zoom-in"></i>详细</a>&nbsp;
        <a href="<%=path %>/tomembersEdit.action?id=${members.meid}" class="cu-tag bg-green light "><i class="glyphicon glyphicon-pencil"></i>编辑</a>&nbsp;
<a href="javascript:void(0)" onclick="showMsg3('<%=path%>/membersDel.action','${members.meid}')" class="cu-tag bg-red light "><i class="glyphicon glyphicon-remove"></i>删除</a>&nbsp;
        </td>
        </tr>

        </c:forEach>
        </tbody>
    </table>





        </td>
    </tr>
    <tr>
        <td>
            <pg:index>	<jsp:include page="/common/pagination_tag.jsp" flush="true" />	</pg:index>	</pg:pager>
        </td>
    </tr>
</table>




        </div>
    </div>
    

  </body>
</html>



