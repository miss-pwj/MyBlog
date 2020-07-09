<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
    System.out.println(request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="applicable-device" content="pc,mobile">
    <meta name="MobileOptimized" content="width"/>
    <meta name="HandheldFriendly" content="true"/>
    <link rel="shortcut icon" href="${APP_PATH}/img/logo.png">
    <rapid:block name="description">
        <meta name="description" content="${options.optionMetaDescrption}" />
    </rapid:block>
    <rapid:block name="keywords">
        <meta name="keywords" content="${options.optionMetaKeyword}" />
    </rapid:block>
    <rapid:block name="title">
        <title>
                ${options.optionSiteTitle}-${options.optionSiteDescrption}
        </title>
    </rapid:block>

    <!-- 代码高亮start-->
    <script type="text/javascript" src="${APP_PATH}/scripts/shCore.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushBash.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushCpp.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushCSharp.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushCss.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushDelphi.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushDiff.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushGroovy.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushJava.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushJScript.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushPhp.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushPlain.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushPython.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushRuby.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushScala.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushSql.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushVb.js"></script>
    <script type="text/javascript" src="${APP_PATH}/scripts/shBrushXml.js"></script>
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/styles/shCore.css"/>
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/styles/shThemeDefault.css"/>
    <script type="text/javascript">
        SyntaxHighlighter.config.clipboardSwf = '${APP_PATH}/scripts/clipboard.swf';
        SyntaxHighlighter.config.strings = {
            expandSource : '展开代码',
            viewSource : '查看代码',
            copyToClipboard : '复制代码',
            copyToClipboardConfirmation : '代码复制成功',
            print : '打印',
            help: '?',
            alert: '语法高亮\n\n',
            noBrush: '不能找到刷子: ',
            brushNotHtmlScript: '刷子没有配置html-script选项',
            aboutDialog: '<div></div>'
        };
        SyntaxHighlighter.all();
    </script>
    <!--代码高亮end-->
    <link rel="stylesheet" href="${APP_PATH}/css/style.css">
    <link rel="stylesheet" href="${APP_PATH}/plugin/font-awesome/css/font-awesome.min.css">

    <rapid:block name="header-style">

    </rapid:block>
</head>
<body>
<div id="page" class="site" style="transform: none;">

    <%@ include file="part/header.jsp" %>
    <div id="content" class="site-content" style="transform: none;">
        <rapid:block name="left"></rapid:block>
        <rapid:block name="right">
            <%@ include file="part/sidebar-1.jsp" %>
        </rapid:block>
    </div>
    <div class="clear"></div>
    <rapid:block name="link"></rapid:block>
    <%@ include file="part/footer.jsp"%>

</div>

    <script src="${APP_PATH}/js/jquery.min.js"></script>
    <script src="${APP_PATH}/js/superfish.js"></script>
    <script src="${APP_PATH}/js/script.js"></script>
    <script src="${APP_PATH}/plugin/layui/layui.all.js"></script>


<rapid:block name="footer-script"></rapid:block>

</body>
</html>