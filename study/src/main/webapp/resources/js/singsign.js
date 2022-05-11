/**
 * 
 */


$(document).ready(function(){
	
	
	$("#id").blur(function(){
		var user_id= $("#id").val();
		$.ajax({
			url : '/user/idCheck?userId='+user_id,
			type : 'get',
			success : function(data){
				console.log("1=중복 o / 0= 중복x : " +data);
				if(data==1){
					$("#id_check").text("사용중인 아이디입니다 : p");
					$("#id_check").css("color","red");
					$("#id").focus();
				}else{
					if((user_id.length)>4){
						$("#id_check").text("");
					}else if(user_id==""){
						$("#id_check").text("아이디를 입력해주세요 :");
						$("#id_check").css('color','red');
						$("#id").focus();
					}else{
						$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
						$('#id_check').css('color', 'red');
						$("#id").focus();
					}
				}
			}, error: function(){
				Swal.fire({
					  position: 'center',
					  icon: 'error',
					  title: '아이디가 중복되었습니다',
					  showConfirmButton: false,
					  timer: 1000
					});	
				$("#id").val("");
				$("#id").focus();
			}
		});
	});
	var password = $("#password").val();
	
	$("#signUp").on("click",function(e){
		if(id==""){
			alert("아이디를 입력하세요");
			$("#id").focus();
			return false;
		}
		if($("#password").val()==""){
			alert("비밀번호를 입력하세요");
			$("#password").focus();
			return false;
		}
		if($("#passwordConfirm").val()!=($("#password").val())){
			alert("비밀번호가 같지않습니다");
			$("#passwordConfirm").focus();
			return false;
		}
		if($("#name").val()==""){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		if($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var email = $("#email").val();
	      if (regEmail.test(email) === true) {
	    	  Swal.fire({
				  position: 'center',
				  icon: 'success',
				  title: '회원가입을 환영합니다.',
				  showConfirmButton: false,
				  timer: 1500
				});
	      }else{
	    	  alert("이메일형식을 맞춰주세요")
	    	  return false;
	      }
		$("#signForm").submit();
	})
	
})//document.ready()끝 





