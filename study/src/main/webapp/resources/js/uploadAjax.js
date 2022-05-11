/**
 * 
 */
// 파일의 확장자(exe, sh, zip, alz) 업로드 제한
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
// 크기
var maxSize=5242880;// 5MB미만으로 제한 

// 파일의 확장자나 크기의 제한하는 기능의 함수 선언 
function checkExtension(fileName,fileSize){
	if(fileSize>=maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할수 없읍니다");
		return false;
	}
	return true;
}
// 


$(document).ready(function(){
			
			var title = $("#title");
			var content = $("#content");
			var formObj = $("form[role='form']")
			$(title).keyup(function(){
				if(title.val().length>15){
					alert("제목은 15글자이하여야합니다.")
					title.val("");
					title.focus();
				}
			})
			$("#uploadBtn").on("click",function(e){
				if(title.val()==""){
					alert("제목을 입력하세요");
					title.focus();
					return false;
				}else if(content.val()==""){
					alert("내용을 입력하세요");
					content.focus();
					return false;	
				}
			e.preventDefault();

			var str="";
			//파일 이 바뀌면서 실행된 uploadResult의 li개수만큼 폼(role)에 추가하여 submit으로 컨트롤러에 전송
			$("#uploadResult ul li").each(function(i,obj){
				console.log($(obj))
				str+="<input type='text' name='attach["+i+"].fileName' value='"+$(obj).data("filename")+"'>"
				str+="<input type='text' name='attach["+i+"].uploadPath' value='"+$(obj).data("path")+"'>"
				str+="<input type='text' name='attach["+i+"].uuid' value='"+$(obj).data("uuid")+"'>"
				str+="<input type='text' name='attach["+i+"].image' value='"+$(obj).data("image")+"'>"
			})
			formObj.append(str).submit();
		})
	
	//write.jsp에 있는 파일선택버튼의 내용이 바뀌면(change)
	$("input[type='file']").on("change",function(){
		// html의 폼태그와 같은역할을하는 FormData 객체 
		// FormDatas는 쉽게 말해서 가상의 <Form>태그로 생각
		// Ajax를 이용하는 파일 업로드는 FormData를 이용해서 필요한
		// 파라미터를 담아서 전송.
		var formData = new FormData();
		var inputFile = $("input[name='uploadfile']");
		var files=inputFile[0].files;
		
		console.log(files);
		
		for (var i =0; i<files.length; i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;	
			}
			// 파일 정보 (files[i])를 보내자
			formData.append("uploadfile",files[i]);
		}//end for
		
		$.ajax({
			type : "post",
			url : "/uploadAjaxAction",
			data : formData,
			processData:false,
			contentType:false,
			success : function(result){
//					alert(result);
				var str="";
				//                index번째 변수이름
				$(result).each(function(i,obj){     
					//이미지 이면 섬네일을 웹브라우저에 출력 
					if(obj.image){
						//  encodeURIComponent 원화표시를 /로 자동으로 바꿔주는함수
						str+="<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"'data-filename='"+obj.fileName+"'data-image='"+obj.image+"'"+">"
						str+="<img src='/display?fileName="+encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName)+"'>"
						str+="</li>"
					}else{
						//이미지가 아니면 (파일명으로 되어있는 링크를클릭해서 다운로드 할수있도록 처리)
						str+="<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"'data-filename='"+obj.fileName+"'data-image='"+obj.image+"'"+">"
						str+="<a href='/download?fileName="+encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName)+"'>"+obj.fileName+"</a>"
						str+="</li>"
					}
				})
				// id가 uploadResult이면서 ul인태그 
				$("#uploadResult ul").html(str)
			}
		})
	})
})
