<%@ page contentType= "text/html;charset=utf8" pageEncoding="utf8"%>
<% request.setCharacterEncoding("UTF-8");%>
<HTML>
	<HEAD>      
		<script language="javascript">
			// 전달받은 메시지 출력
			function showMessage( message )
			{
				if ( ( message != null ) && ( message != "" ) && ( message.substring( 0, 3 ) == " * " )  ) 
				{
					alert( message );
				}
			}     
			// 지정한 url로 이동하는 함수 
			function move( url )	
	 		{
				document.formm.action = url;
				document.formm.submit();
			}
		</script>

		<style>
			.textTop{
				text-align: center;
			}
		</style> 

	</HEAD>
	<BODY onLoad="showMessage( '<%=request.getParameter( "message" )%>' );" >
		<!-- 화면구성 -->
		<BR><BR>

		<div class="textTop">

			<p style="font-size: 20;">명단 검색 창입니다.<br>
			학생의 이름을 입력하시면 해당하는 학생의 정보가 출력됩니다.<br></p><br>
			<form name = "formm" method = "post" style="display: flex; align-items: center; justify-content: center;">
				<INPUT TYPE = "button" value = "메인" onClick="javascript:move( './main.jsp' );">
				&nbsp;
				<INPUT TYPE="text" placeholder="검색" NAME="message" SIZE="50"> 
				<INPUT TYPE = "button" value = "Ϙ" onClick="javascript:move( './search.jsp' );">	
			</form> 
			


			<BR> <BR> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<BR> <BR>  
			
			<!-- 책 목록 출력 -->
			<%@ include file="./selectSQL.jsp"%>
		</div>
	</BODY>
</HTML>
 
