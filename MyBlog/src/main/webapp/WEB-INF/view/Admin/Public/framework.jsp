<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="${APP_PATH}/img/logo.png">
    <title>
        ${options.optionSiteTitle}后台
            <rapid:block name="title"></rapid:block>
    </title>

    <!--引入markdown css样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/editormd/css/editormd.css" />

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
    <link rel="stylesheet" href="${APP_PATH}/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="${APP_PATH}/css/back.css">
    <link rel="stylesheet" href="${APP_PATH}/plugin/font-awesome/css/font-awesome.min.css">
    <rapid:block name="header-style"></rapid:block>
    <rapid:block name="header-script"></rapid:block>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a href="/admin" style="color:#009688;">
        ${options.optionSiteTitle}后台
        </a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/" target="_blank">前台</a></li>

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${loginUser.userAvatar}" class="layui-nav-img">
                    ${loginUser.userName}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/admin/user/profile/${loginUser.userId}">基本资料</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="/admin/logout">退出登录</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">文章</a>
                    <dl class="layui-nav-child">
                        <c:if test="${loginUser.userName=='admin'}">
                        <dd><a href="/admin/article">全部文章</a></dd>
                        </c:if>
                        <dd><a href="/admin/article/insert">写文章</a></dd>
                        <dd><a href="/admin/category">分类</a></dd>
                        <dd><a href="/admin/tag">标签</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="/admin/comment">
                        评论
                    </a>
                </li>
                <c:if test="${loginUser.userName=='admin'}">


                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        用户
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/user">全部用户</a></dd>
                        <dd><a href="/admin/user/insert">添加用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">
                        日志
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/getLogs">日志信息</a></dd>
<%--                        <dd><a href="/admin/user/insert">添加用户</a></dd>--%>
                    </dl>
                </li>
                </c:if>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <rapid:block name="content">

            </rapid:block>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © ${options.optionSiteTitle} - 后台
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/plugin/layui/layui.all.js"></script>
<script src="/js/back.js"></script>
<!--引入markdown js   要放在body最下面-->
<script src="${pageContext.request.contextPath}/editormd/editormd.js"></script>
<rapid:block name="footer-script">

</rapid:block>
<script>
    //给文本编辑器的iframe引入代码高亮的css
   // $("iframe").contents().find("head").append("<link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

</script>
<script>
    var testEditor;
    $(function() {
        testEditor = editormd("test-editormd", {
            width   : "90%",
            height  : 400,
            syncScrolling : "single",
            saveHTMLToTextarea : true, //设置可保存为html 获取的时候testEditor.getHtml();就可以了
            /*theme : "dark",*/  //设置主题，有默认
            /*previewTheme : "dark",*/
            /*editorTheme : "pastel-on-dark",*/
            searchReplace : true,
            emoji : true,
            taskList : true,
            tocm            : true,         // Using [TOCM]
            tex : true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart : true,             // 开启流程图支持，默认关闭
            sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
            dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
            imageUpload : false,
          //  imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
         //   imageUploadURL : "/editormdPic",
            path    : "${pageContext.request.contextPath}/editormd/lib/"
        });
    });
</script>

</body>
</html>