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
     * [App to App] 자동이체 출금동의 요청시 반환된 접수아이디를 통해 서명을 검증합니다.
     * - 서명검증시 전자서명 데이터 전문(signedData)이 반환됩니다.
     * - 카카오페이 API 서비스 운영정책에 따라 검증 API는 1회만 호출할 수 있습니다. 재시도시 오류처리됩니다.
     * - https://www.kakaocert.com/docs/CMS/API/java#A-VerifyCMS
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String ClientCode = "020040000001";

    // 자동이체 출금동의 요청시 반환된 접수아이디
    String receiptID = "022050916103400001";

   // AppToApp 앱스킴 성공처리시 반환되는 서명값(iOS-sig, Android-signature)
    String signature = "abcd";
    
    VerifyResult result = null;

    try {
        result = kakaocertService.verifyCMS(ClientCode, receiptID, signature);
    } catch(KakaocertException ke) {
        throw ke;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response </p>
            <br/>
                <fieldset class="fieldset1">
                <legend>자동이체 출금동의 서명검증</legend>
                <ul>
                    <li>접수아이디 (receiptId) : <%=result.getReceiptId()%></li>
                    <li>전자서명 데이터 전문 (signedData) : <%=result.getSignedData()%></li>
                </ul>
                </fieldset>
        </div>
    </body>
</html>
