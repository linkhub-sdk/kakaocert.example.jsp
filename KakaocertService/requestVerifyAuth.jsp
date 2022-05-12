<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>Kakaocert SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.kakaocert.api.verifyauth.RequestVerifyAuth"%>
<%@page import="com.kakaocert.api.KakaocertException"%>

<%
    /*
     * 카카오톡 사용자에게 본인인증 서명을 요청합니다.
     * - https://www.kakaocert.com/docs/verifyAuth/API/java#RequestVerifyAuth
     */

    // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
    String ClientCode = "020040000001";

    // 본인인증 요청 정보 Object
    RequestVerifyAuth requestObj = new RequestVerifyAuth();

    // 고객센터 전화번호, 카카오톡 인증메시지 중 "고객센터" 항목에 표시
    requestObj.setCallCenterNum("1600-9999");
    
    // 고객센터명, 카카오톡 인증메시지 중 "고객센터명" 항목에 표시
    requestObj.setCallCenterName("고객센터명");

    // 인증요청 만료시간(초), 최대값 : 1000,	인증요청 만료시간(초) 내에 미인증시, 만료 상태로 처리됨
    requestObj.setExpires_in(60);

    // 수신자 생년월일, 형식 : YYYYMMDD
    requestObj.setReceiverBirthDay("19700101");

    // 수신자 휴대폰번호
    requestObj.setReceiverHP("01012341234");

    // 수신자 성명
    requestObj.setReceiverName("홍길동");

    // 인증요청 메시지 부가내용, 카카오톡 인증메시지 중 상단에 표시
    requestObj.setTMSMessage("부가메시지 내용");

    // 별칭코드, 이용기관이 생성한 별칭코드 (파트너 사이트에서 확인가능)
    // 카카오톡 인증메시지 중 "요청기관" 항목에 표시
    // 별칭코드 미 기재시 이용기관의 이용기관명이 "요청기관" 항목에 표시
    requestObj.setSubClientID("");

    // 인증요청 메시지 제목, 카카오톡 인증메시지 중 "요청구분" 항목에 표시
    requestObj.setTMSTitle("TMS Title");

    // Token 원문, 보안을 위해 1회용으로 생성
    // 인증완료시, getVerifyAuthResult API의 returnToken 항목값으로 반환
    requestObj.setToken("20220504-001");

    /*
     * 은행계좌 실명확인 생략여부
     * true : 은행계좌 실명확인 절차를 생략
     * false : 은행계좌 실명확인 절차를 진행
     *
     * - 인증메시지를 수신한 사용자가 카카오인증 비회원일 경우,
     *   카카오인증 회원등록 절차를 거쳐 은행계좌 실명확인 절차이후 전자서명 가능
     */
    requestObj.setAllowSimpleRegistYN(false);

    /*
     * 수신자 실명확인 여부
     * true : 카카오페이가 본인인증을 통해 확보한 사용자 실명과 ReceiverName 값을 비교
     * false : 카카오페이가 본인인증을 통해 확보한 사용자 실명과 RecevierName 값을 비교하지 않음.
     */
    requestObj.setVerifyNameYN(true);

    // PayLoad, 이용기관이 API 요청마다 생성한 payload(메모) 값
    requestObj.setPayLoad("memo Info");

    String receiptID = null;

    try {
        receiptID = kakaocertService.requestVerifyAuth(ClientCode, requestObj);
    } catch(KakaocertException ke) {
        throw ke;
  }

%>
    <body>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>본인인증 요청</legend>
                <ul>
                    <li>접수아이디 : <%=receiptID%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
