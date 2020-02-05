<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.mytable {
	border-collapse: collapse;
}

.mytable th, .mytable td {
	border: 1px solid black;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>baseball</h1>
	<br/>
	<br/>
	<br/>
	
	<button id="findTeam" type="button">팀</button>
	<label>선수</label>
<!--     <button id="findplayer" type="button">선수</button> -->
    <label>상세보기</label>
<!--   <button id="finddetail" type="button">상세보기</button>     -->
 	<br/>
 	<br/>
	
	<!-- 팀 테이블 -->
	<table class="mytable" style="display: inline-block;">
		<tbody id="team_tbody">

		</tbody>
	</table>



	<!-- 선수 테이블 -->
	<table class="mytable" style="display: inline-block; margin-bottom: 40px;">
		<tbody id="player_tbody">
			
		</tbody>
	</table>

	<!-- 상세보기 테이블 -->
	<table class="mytable" style="display: inline-block; margin-bottom: 148px">
		<tbody id="detail_tbody">	
			<tr>
			</tr>
		</tbody>
	</table>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	    
	
		$('#findTeam').on('click',function(){

			$('.team_items').remove();
			$('.player_items').remove();
			$('.detail_player').remove();
			
			$.ajax({
				
				type:'GET',
				url:'/list/api/findteam',
				dataType:'json'

			}).done(function(result){
				let str = '';
				for(let i=0; i<result.length; i++){
				str += '<tr class="team_items">';
				//str += '<td>'+result[i].name+'</td>'
				str += '<td><button onclick="button_find_player('+result[i].id+')" type="button">'+result[i].name+'</button></td>'
				str += '</tr>'
				$('#team_tbody').append(str);
				str = '';
				}
			})

	    })
	    
	    
	    
	    function button_find_player(team_num){
			
			$('.player_items').remove();
			$('.detail_items').remove();

            $.ajax({
				
				type:'GET',
				url:'/list/api/findplayer?num='+team_num,
				dataType:'json'

			}).done(function(result){
				console.log(result)				
				let str = '';
				for(let i=0; i<result.length; i++){
				str += '<tr class="player_items">';
				//str += '<td>'+result[i].name+'</td>'
				str += '<td><button onclick="button_detail_player('+result[i].id+')" type="button">'+result[i].playername+'</button></td>'
				str += '</tr>'
				$('#player_tbody').append(str);				
				str = '';
				}
			})    
		    
		}
	    
		function button_detail_player(player_num){		
			
			$('.detail_items').remove();		

			$.ajax({
				
				type:'GET',
				url:'/list/api/detailplayer?num='+player_num,
				dataType:'json'

			}).done(function(result){	
					
				let str = '';				
				str += '<tr class="detail_items">';
				str += '<td>'+result.name+'<br/>'+result.playername+'<br/>'+result.content+'</button></td>'
				str += '</tr>'
				$('#detail_tbody').append(str);		
									
			}) 	
			
	    }
	    
			
			
	</script>

</body>
</html>