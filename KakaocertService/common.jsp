<%--
===================================================================================
* Kakaocert API Java SDK JSP Example
*
* Class Module for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub class module
* to accomplish authentication APIs.

Update date : 2020-09-10
===================================================================================
--%>

<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="kakaocertService" scope="application" class="com.kakaocert.api.KakaocertServiceImp"/>

<%-- 링크아이디 --%>
<jsp:setProperty name="kakaocertService" property="linkID" value="TESTER"/>

<%-- 비밀키, 사용자 인증에 사용되는 정보이므로 유출에 주의 --%>
<jsp:setProperty name="kakaocertService" property="secretKey" value="SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I="/>

<%-- 인증토큰 발급 IP 제한 On/Off, ture-제한기능 사용(기본값-권장),  false-제한기능 미사용 --%>
<jsp:setProperty name="kakaocertService" property="IPRestrictOnOff" value="true"/>
