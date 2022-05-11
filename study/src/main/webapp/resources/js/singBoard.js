
//검색버튼을 클릭했을때
//검색종류가 선택되어있지 않으면
//alert(검색종류를 선택하세요)
//키워드가 입력되어있지않으면
//alert(키워드를 입력하세요)
$(document).ready(function(){
	$("#searchbtn").on("click",function(e){
		if($("#type").val()==""){
			alert("검색종류를 선택하세요");
			return false;
		}
		if($("#keyword").val()==""){ //getter 
			alert("키워드를 입력하세요");
			return false;
		}
		// 검색버튼 클릭시 무조건 1페이지부터 검색할수 있도록 
		// pagenum을 1로 셋팅. 
		$("#pagenum").val("1")// setter
		
		$("#searchForm").submit(); //searchForm 태그 서브밋실행 
	})// 검색버튼을 클릭했을떄의 끝 
	
	// 페이지 아이디(.pageNo)번호를 클릭했을 떄 
	$(".pageNo").on("click",function(e){
		e.preventDefault(); //a태그의 href 기능 중지 
		//사용자가 선택한 페이지 번호를 
		 //<input type="hidden" id="pagenum" name="pagenum" value="${pageMaker.cri.pagenum}">
		//값 셋팅
		$("#pagenum").val($(this).attr("href"));
//		$("#amount").val();
//		$("#type").val();
//		$("#keyword").val();
		$("#searchForm").submit();
	})
	// 페이지번호를 클릭했을떄의 끝
	
	
})

