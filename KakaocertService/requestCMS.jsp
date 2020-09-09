<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>Kakaocert SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.kakaocert.api.cms.RequestCMS"%>
<%@page import="com.kakaocert.api.KakaocertException"%>

<%
	/*
	 * 카카오톡 사용자에게 자동이체 출금동의를 요청합니다.
	 */

  // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
  String ClientCode = "020040000001";

  // 자동이체 출금동의 요청 정보 Object
  RequestCMS cmsRequest = new RequestCMS();

  // 고객센터 전화번호, 카카오톡 인증메시지 중 "고객센터" 항목에 표시
  cmsRequest.setCallCenterNum("1600-9999");

  // 인증요청 만료시간(초), 최대값 : 1000,	인증요청 만료시간(초) 내에 미인증시, 만료 상태로 처리됨
  cmsRequest.setExpires_in(60);

  // 수신자 생년월일, 형식 : YYYYMMDD
  cmsRequest.setReceiverBirthDay("19800101");

  // 수신자 휴대폰번호
  cmsRequest.setReceiverHP("010111222");

  // 수신자 성명
  cmsRequest.setReceiverName("홍길동");

  // 예금주명
	cmsRequest.setBankAccountName("예금주명");

	// 계좌번호, 이용기관은 사용자가 식별가능한 범위내에서 계좌번호의 일부를 마스킹 처리할 수 있음 예시) 371-02-6***85
	cmsRequest.setBankAccountNum("9-4**4-1234-58");

	// 은행코드
	cmsRequest.setBankCode("004");

	// 납부자 식별번호, 이용기관에서 부여한 고객식별번호
	cmsRequest.setClientUserID("20200504-001");

  // 인증요청 메시지 부가내용, 카카오톡 인증메시지 중 상단에 표시
  cmsRequest.setTMSMessage("부가메시지 내용");

  // 별칭코드, 이용기관이 생성한 별칭코드 (파트너 사이트에서 확인가능)
  // 카카오톡 인증메시지 중 "요청기관" 항목에 표시
  // 별칭코드 미 기재시 이용기관의 이용기관명이 "요청기관" 항목에 표시
  cmsRequest.setSubClientID("");

  // 인증요청 메시지 제목, 카카오톡 인증메시지 중 "요청구분" 항목에 표시
  cmsRequest.setTMSTitle("TMS Title");

  /*
  * 은행계좌 실명확인 생략여부
  * true : 은행계좌 실명확인 절차를 생략
  * false : 은행계좌 실명확인 절차를 진행
  *
  * - 인증메시지를 수신한 사용자가 카카오인증 비회원일 경우,
  *   카카오인증 회원등록 절차를 거쳐 은행계좌 실명확인 절차이후 전자서명 가능
  */
  cmsRequest.setAllowSimpleRegistYN(false);

  /*
  * 수신자 실명확인 여부
  * true : 카카오페이가 본인인증을 통해 확보한 사용자 실명과 ReceiverName 값을 비교
  * false : 카카오페이가 본인인증을 통해 확보한 사용자 실명과 RecevierName 값을 비교하지 않음.
  */
  cmsRequest.setVerifyNameYN(true);

  // PayLoad, 이용기관이 API 요청마다 생성한 payload(메모) 값
  cmsRequest.setPayLoad("memo Info");

  String receiptID = null;

  try {
    receiptID = kakaocertService.requestCMS(ClientCode, cmsRequest);

  } catch(KakaocertException ke) {
    throw ke;
  }

%>
	<body>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>자동이체 출금동의 요청</legend>
				<ul>
					<li>접수아이디 : <%=receiptID%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
