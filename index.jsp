<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>

    <title>kakaocert SDK jsp Example.</title>
</head>
<body>
<div id="content">
    <p class="heading1">kakaocert SDK jsp Example.</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>간편 전자서명 API</legend>
        <ul>
            <li><a href="KakaocertService/requestESign.jsp">requestESign</a> - 전자서명 요청 API</li>
            <li><a href="KakaocertService/getESignResult.jsp">getESignResult</a> - 전자서명 결과확인 API</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>본인인증 API</legend>
        <ul>
            <li><a href="KakaocertService/requestVerifyAuth.jsp">requestVerifyAuth</a> - 본인인증 요청 API</li>
            <li><a href="KakaocertService/getVerifyAuthResult.jsp">getVerifyAuthResult</a> - 본인인증 결과확인 API</li>
        </ul>
    </fieldset>

    <fieldset class="fieldset1">
        <legend>자동이체 출금동의 API</legend>
        <ul>
            <li><a href="KakaocertService/requestCMS.jsp">requestCMS</a> - 자동이체 출금동의 요청 API</li>
            <li><a href="KakaocertService/getCMSResult.jsp">getCMSResult</a> - 자동이체 출금동의 결과 확인 API</li>
        </ul>
    </fieldset>
</div>
</body>
</html>
