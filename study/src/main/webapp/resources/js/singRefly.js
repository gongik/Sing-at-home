
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize=5242880;

function checkExtension(fileName,fileSize){
	if(fileSize>=maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할수 없습니다");
		return false;
	}
	return true;
}

$(document).ready(function(){
	var bno = $("#bno").val();
	$("#btn_like").show();
	$("#btn_likeOn").hide();
	console.log(bno);
	list(bno);
	singLike(bno);
	
	$("#addReply").on("click",function(){
		let id = $("#idConfirm").val();
		$("#reply").val("");
		$("#replyer").val(id);
		$("#modalModBtn").hide();
		$("#modalRemoveBtn").hide();
		$("#replydateDiv").hide();
		$("#modalWriteBtn").show();
	})
	
	$("#modalWriteBtn").on("click",function(){
		var reply = $("#reply").val();
		var replyer = $("#replyer").val();
		add({reply:reply,replyer:replyer,bno:bno});
	})
	// 현재 ul태그뒤에 li가 숨어있어서 클릭할수가없다 delicate 사용 
	$(".replyList").on("click","li",function(){
		var id =$("#idConfirm").val();
		var replyId = $(this).find("p").text();
		if(id===replyId){
			console.log("실행");
		}else{
			console.log("안됌");
			return false;
		}
		var rno=$(this).data("rno");
		get(rno);
		$("#replyer").val(id);
		$("#rno").val(rno);
		$(".modal").modal("show");
		$("#modalWriteBtn").hide();
		$("#modalModBtn").show();
		$("#modalRemoveBtn").show();
		$("#replydateDiv").hide();
	})
	
	$("#modalModBtn").on("click",function(){
		var rno=$("#rno").val();
		var reply = $("#reply").val();
		modify({rno:rno,reply:reply,bno:bno});
	})
		
	$("#modalRemoveBtn").on("click",function(){
		var rno=$("#rno").val();
		remove(rno);
	})
	
	$("#btn_like").on("click",function(){
		var id = $("#sid").val();
		var bno = $("#bno").val();
		if(id==""){
			Swal.fire({
				  position: 'center',
				  icon: 'warning',
				  title: '로그인이 필요합니다.',
				  showConfirmButton: false,
				  timer: 1300
				});	
			return false;
		}
		likeAdd({id:id,bno:bno});
	})
	$("#btn_likeOn").on("click",function(){
		var id = $("#sid").val();
		var bno = $("#bno").val();
		likeDel({id:id,bno:bno});
		
	})
}) // document.ready 끝 


//좋아요 추가
function likeAdd(likelist){
	$.ajax({
		type : "post",
		url : "/sing/like",
		data : JSON.stringify(likelist),
		contentType : "application/json; charset=utf-8",
		success : function(like){
			if(like=="success"){
				console.log("추가성공");
				var bno = $("#bno").val();
				$("#btn_likeOn").show();
				$("#btn_like").hide();
				$(".like_count").text(Number($(".like_count").text())+1);
			}
		}
	})
}

//좋아요 삭제
function likeDel(likeDelete){
	$.ajax({
		type : "delete",
		url : "/sing/likeDelete",
		data : JSON.stringify(likeDelete),
		contentType : "application/json; charset=utf-8",
		success : function(like){
			if(like=="success"){
				console.log("삭제성공");
				$("#btn_likeOn").hide();
				$("#btn_like").show();
				$(".like_count").text(Number($(".like_count").text())-1);
			}
		}
	})
}

//좋아요 표시
function singLike(bno){
	var id = $("#sid").val();
	$.getJSON("/sing/list/"+id+"/"+bno+".json",function(data){
		console.log(data);
		if(data!=null){
			console.log(data);
			$("#btn_like").hide();
			$("#btn_likeOn").show();
		}
	})
}


//댓글쓰기
function add (replylist){
	$.ajax({
		type :"post",
		url : "/reply/write",
		data : JSON.stringify(replylist), // JSON.stringfy메소드는 json객체를 String객체로 변환시켜주는 메소드임.
		contentType : "application/json; charset=utf-8", //보내는 자원의 형식을 명시하기 위해 헤더에 실리는 정보 
		success : function(vaild){
			if(vaild=="success"){
				location.reload();
			}
		}
	})
}

//댓글 목록 표시
function list(bno){
	$.getJSON("/reply/list/"+bno+".json",function(data){
		var reply="";
		for(var i=0; i<data.length; i++){
			reply+= "<li data-rno="+data[i].rno+"><div>";
			reply+= "<div>작성자 <p class='idConfirm'>"+data[i].replyer+"</p></div>"
			reply+= "<div>댓글  : "+data[i].reply+"</div>"
			reply+= "</div></li>"
		}
		$(".replyList").html(reply);
	})
}

//댓글 작성자표시
function get(rno){
	$.getJSON("/reply/detail/"+rno+".json",function(data){
		$("#reply").val(data.reply);
		$("#replyer").val(data.replyer);
	})
}

//댓글수정
function modify(reply){
	$.ajax({
		type : "put",
		url : "/reply/modify",
		data : JSON.stringify(reply),
		contentType : "application/json; charset=utf-8",
		success : function(su){
			$(".modal").modal("hide");
			list(reply.bno);
		}
	})
}
//댓글 삭제
function remove(rno,bno){
	var bno = $("#bno").val();
	$.ajax({
		type : "delete",
		url : "/reply/remove/"+rno,
		success : function(su){
			if(su=="success"){
				$(".modal").modal("hide");
				list(bno);
			}
		}
	})
}




