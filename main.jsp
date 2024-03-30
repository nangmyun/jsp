<%@ page contentType= "text/html;charset=utf8" pageEncoding="utf8"%>
<% request.setCharacterEncoding("UTF-8");%>
<HTML>
	<HEAD>
		<style>
			.textTop{
				text-align: center;
			}
		</style> 
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
	</HEAD>
	<BODY onLoad="showMessage( '<%=request.getParameter( "message" )%>' );" >
		<!-- 화면구성 -->
		<br><BR>
		<div class="textTop">
			<p style="font-size: 20;">학교 행사에 필요한 정보를 제공하는 사이트입니다.</p>
		
		
			<BR> 
			 
			 
			
				<!-- 명단 검색 -->
				<INPUT TYPE = "button" value = "명단 검색" style = "font-size: 25; padding-left: 20; padding-right: 20; background: lightgray;" onClick="javascript:move( './search.jsp' );">
				&nbsp; &nbsp;
				<!-- 명단 추가 -->
				<INPUT TYPE = "button" value = "명단 추가" style = "font-size: 25; padding-left: 20; padding-right: 20; background: lightgray;" onClick="javascript:move( './insert.jsp' );">
				&nbsp; &nbsp;
				<!-- 명단 삭제 -->
				<INPUT TYPE = "button" value = "명단 삭제" style = "font-size: 25; padding-left: 20; padding-right: 20; background: lightgray;" onClick="javascript:move( './delete.jsp' );">	
			

			<BR> <BR> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<BR> <BR>  
			
			<!-- 책 목록 출력 -->
			<%@ include file="./selectSQL.jsp"%>
		</div>
	</BODY>
</HTML>
