<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Time Machine</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/vendor/jquery-2.0.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/vendor/bootstrap.js"></script>
    <sitemesh:write property="head"/>
</head>
<body>
<div class="page">
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar-brand">Time Machine</span>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-left">
                <sec:authorize access="isAuthenticated()">
                    <li><a href="${pageContext.request.contextPath}">Home</a></li>
                </sec:authorize>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="isAnonymous()">
                    <li class ="signin_li"><a class="btn btn-primary signin-a" href="${pageContext.request.contextPath}/login">Login <span class="glyphicon glyphicon-log-in" aria-hidden="true"/></a></li>
                	<li class="signup_li" ><a class="btn btn-danger signup-a" href="${pageContext.request.contextPath}/user/register">Sign Up <span class="glyphicon glyphicon-registration-mark" aria-hidden="true"/></a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li>
                        <form action="${pageContext.request.contextPath}/logout" method="POST">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-primary logout-btn">Logout  <span class="glyphicon glyphicon-log-out" aria-hidden="true"/>
                            </button>
                        </form>
                    </li>
                </sec:authorize>
            </ul>
            <sec:authorize access="isAuthenticated()">
                <p class="nav navbar-nav navbar-right navbar-text sign-in-text">
                    <sec:authentication property="principal.socialSignInProvider" var="signInProvider"/>
                    <c:if test="${signInProvider == 'FACEBOOK'}">
                        <i class="icon-facebook-sign"></i>
                    </c:if>
                    <c:if test="${signInProvider == 'TWITTER'}">
                        <i class="icon-twitter-sign"></i>
                    </c:if>
                    <c:if test="${empty signInProvider}">
                        Signed in as
                    </c:if>
                    <sec:authentication property="principal.username"/>
                </p>
            </sec:authorize>
        </div><!-- /.navbar-collapse -->
    </div>
    <div class="content">
        <div id="view-holder">
            <sitemesh:write property="body"/>
        </div>
    </div>
</div>
</body>
</html>