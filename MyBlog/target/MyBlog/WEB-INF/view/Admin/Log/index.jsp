<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 日志列表
    </rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/

        .layui-table {
            margin-top: 0;
        }

        .layui-btn {
            margin: 2px 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a><cite>日志信息列表</cite></a>
        </span>
    </blockquote>
<%--    ${logs.list}--%>
<table class="layui-table" lay-even lay-skin="nob" >
    <colgroup>
        <col width="100">
        <col width=100">
        <col width="100">
        <col width="50">
        <col width="50">
        <col width="100">
        <col width="50">
    </colgroup>
    <thead>
    <tr>
        <th>用户头像</th>
        <th>用户昵称</th>
        <th>用户邮箱</th>
        <th>用户操作</th>
        <th>操作时间</th>
        <th>ID</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${logs.list}" var="log">
        <tr>
            <td>
                <img src="${log.user.userAvatar}" width="48" height="48">
                <strong><a href="/admin/user/profile/${log.user.userId}">${log.user.userName}</a></strong>
<%--                 ${log.user.userAvatar}--%>
            </td>
            <td>
                ${log.user.userNickname}
            </td>
            <td>
                ${log.user.userEmail}
            </td>
            <td >
                ${log.operate}
            </td>
            <td>
                ${log.operateTime}
            </td>

            <td>
                ${log.id}
            </td>
        </tr>

    </c:forEach>
    </tbody>
</table>

</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
