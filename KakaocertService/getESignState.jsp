<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>kakaocert SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.kakaocert.api.KakaocertException"%>
<%@page import="com.kakaocert.api.esign.ResultESign"%>

<%
    /*
     * 전자서명 요청시 반환된 접수아이디를 통해 서명 상태를 확인합니다.
     * - https://www.kakaocert.com/docs/ESign/API/java#GetESignState
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String ClientCode = "020040000001";

    // 전자서명 요청시 반환된 접수아이디
    String receiptID = "022050610472600001";

    ResultESign result = null;

    try {
        result = kakaocertService.getESignState(ClientCode, receiptID);
    } catch(KakaocertException ke) {
        throw ke;
  }
%>
    <body>
        <div id="content">
            <p class="heading1">Response </p>
            <br/>
            <fieldset class="fieldset1">
                <legend>전자서명 서명상태 확인</legend>
                <ul>
                    <li>receiptID(접수아이디) : <%= result.getReceiptID()%></li>
                    <li>clientCode (이용기관코드) : <%= result.getClientCode()%></li>
                    <li>clientName (이용기관명) : <%= result.getClientName()%></li>
                    <li>subClientName (별칭) : <%= result.getSubClientName()%></li>
                    <li>subClientCode (별칭코드) : <%= result.getSubClientCode()%></li>
                    <li>state (상태) : <%= result.getState()%></li>
                    <li>expires_in (인증요청 만료시간(초)) : <%= result.getExpires_in()%></li>
                    <li>callCenterNum(고객센터 전화번호) : <%= result.getCallCenterNum()%></li>
                    <li>callCenterName(고객센터명) : <%= result.getCallCenterName()%></li>
                    <li>tmstitle (인증요청 메시지 제목) : <%= result.getTmstitle()%></li>
                    <li>tmsmessage (인증요청 메시지 부가내용) : <%= result.getTmsmessage()%></li>
                    <li>allowSimpleRegistYN	(은행계좌 실명확인 생략여부) : <%= result.isAllowSimpleRegistYN()%></li>
                    <li>verifyNameYN (수신자 실명확인 여부) : <%= result.isVerifyNameYN()%></li>
                    <li>requestDT (카카오 인증서버 등록일시) : <%= result.getRequestDT()%></li>
                    <li>expireDT (인증 만료일시) : <%= result.getExpireDT()%></li>
                    <li>regDT (인증요청 등록일시) : <%= result.getRegDT()%></li>
                    <li>viewDT (수신자 카카오톡 인증메시지 확인일시) : <%= result.getViewDT()%></li>
                    <li>completeDT (수신자 카카오톡 전자서명 완료일시) : <%= result.getCompleteDT()%></li>
                    <li>verifyDT (서명 검증일시) : <%= result.getVerifyDT()%></li>
                    <li>payload (payload) : <%= result.getPayload()%></li>
                    <li>appUseYN (AppToApp 인증여부) : <%= result.isAppUseYN()%></li>
                    <li>tx_id (카카오톡 트랜잭션아이디-앱스킴 호출용) : <%= result.getTx_id()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
