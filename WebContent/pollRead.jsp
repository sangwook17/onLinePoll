<%@page import="com.koreait.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(Vote)</title>
<!-- favicon: 인터넷 웹 브라우저의 주소창에 표시되는 웹사이트나 웹페이지를 대표하는 아이콘이다.-->
<link rel="icon" href="./favicon.ico">
</head>
<body>

<!-- 투표 항목이 저장 된 텍스트 파일의 데이터를 읽어서 웹 브라우저에 출력한다. -->
<%
//	프로젝트르 실행하면 이클립스가 자체적으로 웹 서버를 구축하고 구축된 웹 서버에서 웹 서비스를 실행한다. => 실제 경로. RealPath
//	이클립스 웹 서비스가 구현되는 실제 경로
// 	D:\kokgi_11gi\JSP\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\0817_onlinePoll\application.getRealPath("/") 
//	명령을 실행해서 이클립스 웹 서비스가 구현되는 실제 경로르 얻어올 수 있다.

//	out.println(application.getRealPath("/"));   // "/"는 웹 서비스가 실행되는 web root(최상위 경로)를 의미한다.
	String filepath = application.getRealPath("/") + "poll.txt";
//	out.println(filepath);

// 	텍스트 파일의 데이터를 읽어오는 메소드르 실행해서 리턴되는 결과를 ArrayList에 저장한다.
	ArrayList<String> poll = PollRead.pollRead(filepath);
//	out.println(poll);
//	for (String str : poll) {
//		out.println(str + "<br>");
//	}

// 투표 항목의 개수를 계산한다. 
	int itemCount = (poll.size() -1) / 2;
//	out.println(itemCount);
%>

	<form action="pollWrite.jsp" method="post">

	<!-- cellpadding : 셀과 셀 내부에 입력 된 데이터와의 간격을 지정한다. => 표 안여백 -->
	<!-- cellspacing : 셀과 셀 사이의 간격을 지정한다. => 표 셀간격-->
	<table width="500" border="1" align="center" cellpadding="5" cellspacing="0">
	
	<tr height="50">
		<th>
			<%=poll.get(0)%>
		</th>
	</tr>
	
	<!-- 투표 항목의 개수만큼 반복하며 라디오 버튼과 투표 항목을 출력한다. -->
	<%
	for (int i = 1; i <= itemCount; i++) {	
	%>
	<tr height="50">
		<td>
			<input type="radio" name="poll" value=<%=i%>><%=poll.get(i)%>
		</td>
	</tr>
	<%
		}
	%>		
	<tr height="50">
		<td align="center">
			<input type="submit" value="투표하기">
			<input type="button" value="결과보기" onclick="location.href='pollResult.jsp'">		
		</td>
	</tr>
	</form>	
	
</table>

</body>
</html>




















