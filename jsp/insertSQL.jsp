<%@ page language="java" import="java.sql.*, javax.sql.DataSource" contentType= "text/html;charset=utf8" pageEncoding="utf8"%>
<%@ include file="SQLconstants.jsp"%>
<% 
	// 이전 페이지에서 전달 받은 메시지 확인
	request.setCharacterEncoding("UTF-8");
	String grade = request.getParameter( "grade" );
 	String studentID = request.getParameter( "studentID" );
	String name = request.getParameter( "name" );
	String birth = request.getParameter( "birth" );
	String gender = request.getParameter( "gender" );
	String studentrecord = request.getParameter( "studentrecord" );
	String phonenumber = request.getParameter( "phonenumber" );
	String message = null;

	try
	{
		// MySQL 드라이버 연결 
		Class.forName( jdbc_driver ); 
		Connection con = DriverManager.getConnection( mySQL_database, mySQL_id, mySQL_password ); 
		Statement stmt = con.createStatement();

		// MySQL 책 추가 실행 	
		String query = "insert into book( grade, studentID, name, birth, gender, studentrecord, phonenumber ) values ( '" + grade + "', '" + studentID + "', '" + anameuthor + "', '" + birth + "', '" + gender + "', '" + studentrecord + "', '" + phonenumber + "');"; 
		query = new String( query.getBytes("utf-8") );
		if ( stmt.executeUpdate( query ) > 0 )
		{
			message = "명단에 추가했습니다. "; 
		}
		else 
		{
			message = "명단에 추가할 수 없습니다. "; 
		}

		// MySQL 드라이버 연결 해제
		stmt.close();
		con.close();
	} 
	// 예외 처리
	catch(SQLException e)
	{
		message = e.getMessage();
	}
	catch( Exception e ) 
	{
		message = e.getMessage();
	}   
%>

<%@ include file="./log.jsp"%>
<%
	// 로그 데이터 추출
	writeLog( message, request, session );
%>
 
<!-- 다음 페이지로 메시지 전달 -->
<form name = "frm" method = "post" action = "./search.jsp" >
	<input type = 'hidden' name = 'message' value = ' * <%=message%>' >
</form>
<script language="javascript">
	document.frm.submit();
</script>
