<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>kakaocert SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.kakaocert.api.KakaocertException"%>
<%@page import="com.kakaocert.api.VerifyResult"%>

<%
	/*
	 * [App to App] 전자서명 요청시 반환된 접수아이디를 통해 서명을 검증합니다.
	 */

  // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
  String ClientCode = "020040000001";

	// 전자서명 요청시 반환된 접수아이디
	String receiptID = "020090916030900001";

  // App To App 앱스킴 응답 서명값
  String signature = "abcd";

  VerifyResult result = null;

	try {

    result = kakaocertService.verifyESign(ClientCode, receiptID, signature);

	} catch(KakaocertException ke) {
    throw ke;
  }
%>
	<body>
		<div id="content">
			<p class="heading1">Response </p>
			<br/>
			<fieldset class="fieldset1">
				<legend>전자서명 서명검증</legend>
				<ul>
          <li>접수아이디 (receiptId) : <%=result.getReceiptId()%></li>
          <li>전자서명 데이터 전문 (signedData) : <%=result.getSignedData()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
