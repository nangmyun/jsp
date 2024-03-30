<%@ page language="java" import="java.sql.*, javax.sql.DataSource" contentType= "text/html;charset=utf8" pageEncoding="utf8"%>
<%@ include file="./SQLconstants.jsp"%>
<%
	// 이전 페이지에서 전달 받은 메시지 확인
	request.setCharacterEncoding("UTF-8");
	String 	message = request.getParameter( "message" ); 
	message = ( ( ( message == null ) || message.equals( "" ) || ( message.indexOf( " * " ) == 0 ) ) ? "_%" : message );

	try
	{
		// MySQL 드라이버 연결
		Class.forName( jdbc_driver ); 
		Connection con = DriverManager.getConnection( mySQL_database, mySQL_id, mySQL_password ); 
		Statement stmt = con.createStatement();

		// MySQL 책 검색 실행 및 결과 출력
		String query = "select * from book where title like '%" + message + "%';";
		ResultSet result = stmt.executeQuery( query );
		while( result.next() )
		{		
			out.print( "<BR>학년 : " + result.getString( "grade" ) 
					+ "<BR> 학번 : " + result.getString( "studentID" ) 
					+ "<BR> 이름 : "+ result.getString( "name" ) 
					+ "<BR> 생년월일 : " + result.getString( "birth" ) 
					+ "<BR> 성별 : " + result.getString( "gender" )
          + "<BR> 학적 : " + result.getString( "studentrecord" )
          + "<BR> 전화번호 : " + result.getString( "phonenumber" )
					 <br>" );
		}

		// MySQL 드라이버 연결 해제
		result.close(); 
		stmt.close();
		con.close();
	}
	// 예외 처리
	catch( SQLException e )
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
	writeLog( message + " 포함 학생 정보입니다.", request, session );
%>
