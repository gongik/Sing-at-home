//플레이 리스트 추가 ajax
function listAdd(addlist){
	$.ajax({
		type : "post",
		url : "/play/list",
		data : JSON.stringify(addlist),
		contentType : "application/json; charset=utf-8",
		success : function(vaild){
			if(vaild=="success"){
				var id= $("#id").val();
				playList(id);
			}
		}
	})
}
//플레이 리스트 삭제
function plyDel(bno){
	console.log(bno);
	$.ajax({
		type : "delete",
		url : "/play/delete/"+bno,
		success : function(vaild){
			if(vaild=="success"){
				console.log("성공");
				var id= $("#id").val();
				playList(id);
			}
		}
	})
}
//플레이 리스트 내용표시 ajax
function playList(playId){
	console.log(playId)
	$.getJSON("/play/confirm/"+playId+".json",function(ply){
		console.log(ply);
		var str ="";
		for(var i=0; i<ply.length; i++){
			str += "<li class='plyClose'>";
			str += "<a id='plytube' href='#'>"+ply[i].title+"</a>";
			str += "<input type='text' class='plybno' value="+ply[i].bno+">"
			str += "</li>";
		}
		$(".sub ul").html(str);
	})
}
//노래장르선택시 리스트표시
function youSelect(youSel){
	var channelID = "UC58ttsbMu6kCeWRrEsDI2ww";
	var apiKey = "AIzaSyBprQm5aONbp4ex3J5DLxPY11eS5g4sCS4";
	console.log(youSel);
	$.ajax({
		url :'https://www.googleapis.com/youtube/v3/search?key='+apiKey+'&channelId='+channelID+'&part=snippet,id&order=relevance&maxResult=5 &q='+youSel,
		dataType:'jsonp',
		success: function(data){
			console.log(data);
			let count =0;
			$.each(data.items, function(key,value){
				var list = $(document.createDocumentFragment());
				count++;
				list.append([
						'<li class="searchList">'+count+" - "+value.snippet.title+'</li>',
				]
		);
		$('.searchBox').append(list);
			});
		}// function(data)
	})	
}// function youSelect();

// youtube 노래 리스트 검색
function you(){
	var channelID = "UC58ttsbMu6kCeWRrEsDI2ww";
	var apiKey = "AIzaSyBprQm5aONbp4ex3J5DLxPY11eS5g4sCS4";
	var search = $("#search").val();
	console.log(search);
	$.ajax({
		url :'https://www.googleapis.com/youtube/v3/search?key='+apiKey+'&channelId='+channelID+'&part=snippet,id&order=date&maxResult=5 &q='+search,
		//dataType:'json',
		dataType:'jsonp',
		success: function(data){
			console.log(data);
			let count =0;
			$.each(data.items, function(key,value){
				var list = $(document.createDocumentFragment());
				count++;
				list.append([
						'<li class="searchList">'+count+" - "+value.snippet.title+'</li>',
				]
		);
		$('.searchBox').append(list);
			});
		}// function(data)
	})	
}// function you();

//노래 동영상 표시
function youtube(){
	var channelID = "UC58ttsbMu6kCeWRrEsDI2ww";
	var apiKey = "AIzaSyBprQm5aONbp4ex3J5DLxPY11eS5g4sCS4";
	var search = $("#search").val();
	$.ajax({
		url :'https://www.googleapis.com/youtube/v3/search?key='+apiKey+'&channelId='+channelID+'&part=snippet,id&order=date&maxResult=5 &q='+search,
		dataType:'jsonp',
		success: function(data){
			if($("singto")){
				$(".singto").remove();
			}
				var list = $(document.createDocumentFragment());
				list.append([
							'<iframe class="singto" width="100%" height="500" src="https://www.youtube.com/embed/'+data.items[0].id.videoId+'"frameborder="0" allowfullscreen></iframe>',
				]
		);
		$('.youtube').append(list);
		}// function(data)
	})	//ajax
	$("#playText").val(search);
	$("#search").val("");
}//function youtube()

$(document).ready(function(){
	
	var id= $("#id").val();
	playList(id);
	//플레이 리스트 추가
	$(".playList").on("click",function(){
		var title = $("#playText").val();
		Swal.fire({
			  position: 'center',
			  icon: 'success',
			  title: '플레이 리스트에 추가하였습니다',
			  showConfirmButton: false,
			  timer: 1000
			});
		var id= $("#id").val();
		listAdd({title:title,id:id});
	})
	//플레이 리스트 삭제
	  $(".sub ul").on("click","input",function(){
		var bno = $(this).val();
		plyDel(bno);
		
	})
	//플레이 리스트  동영상 재생
	$(".sub ul").on("click","a",function(e){
		e.preventDefault();
		 $('#side').animate({
		        right : -100 + "%"
		    })

		    $('#wrap').css({
		        position : 'relative'
		    })
		var plyTitle = $(this).text();
		$("#search").val(plyTitle);
		youtube();
	})
	//노래 장르 선택
	$(".mBDown ul li").on("click","a",function(e){
		e.preventDefault();
		var youSel = $(this).text();
		if($("searchList")){
			$(".searchList").remove();
		}
		if($("singto")){
			$(".singto").remove();
		}
		$(".main11").show();
		$(".searchTitle").text(youSel);
		youSelect(youSel);
	})
	
   //마우스 올릴시 색깔변함 
	$(".searchBox").on("mouseover",".searchList",function(){
		$(this).css("color", "yellow");
	});
	$(".searchBox").on("mouseleave",".searchList",function(){
		$(this).css("color", "white");
	});
	$(".mBDown ul li a").on("mouseover",function(){
		$(this).css("color", "orange");
	});
	$(".mBDown ul li a").on("mouseleave",function(){
		$(this).css("color", "white");
	});
	// 노래리스트 클릭시 이벤트 델리게이트. 새로추가된 클래스에도 적용이됨
	$(".searchBox").on("click",".searchList",function(){
		let searchT= $(this).text();
		let searchText= searchT.substr(3);
		console.log(searchText);
		$("#search").val(searchText); 
		if($("singto")){
			$(".singto").remove();
		}
		$(".main11").hide();
		youtube();
	})
	// search input 엔터 / 검색 
	$("#search").keyup(function(e){
		if(e.keyCode ===13 ) {
			if($("searchList")){
				$(".searchList").remove();
			}
			$(".searchTitle").text("인기검색");
			if($("singto")){
				$(".singto").remove();
			}
			$(".main11").show();
			you();
			$("#search").blur();
		}
	});
	// 노래 검색버튼
	$(".searchBtn").on("click",function(){
		if($("searchList")){
			$(".searchList").remove();
		}
		if($("singto")){
			$(".singto").remove();
		}
		$(".searchTitle").text("인기검색");
		$(".main11").show();
		you();
	})
	
    /* 슬라이드 */
    $('#slideShow').each(function(){
        let $slideGroup = $(this).find('.slides');//모든 슬라이드
        let $slides = $slideGroup.find('.slide');// 각슬라이드
        let $pager =$(this).find('.pager')//pager

        let pagerHtml = '';
        let currentIndex = 0;
        let timer ;

        //슬라이드 이미지 위치
        $slides.each(function(i){
            $(this).css({
                'left' : i *100 +"%"
            })
            //pager 생성
            pagerHtml += "<a href=''>" + (i+1) +"</a>"
        })
        //html() : 매개변수로 전달한 문자열을 HTML코드에 삽입하는 메서드
        $pager.html(pagerHtml)

        //모든 슬라이드 표시
        function goToSlide(index){
            $slideGroup.animate({
                'left' : -100 *index +"%",
            },500)
            currentIndex =index;

            updateNav();
        }
      //슬라이드 상태에 따라서 업데이트
        function updateNav(){
            $pager.find('a').removeClass('active')
            $pager.find('a').eq(currentIndex).addClass('active');
        }
            //타이머 
            function startTimer(){
              timer = setInterval(function(){
                    let nextIndex = (currentIndex+1) % $slides.length
                    goToSlide(nextIndex)
                },3000)
            }
            //타이머 정지
            function stopTimer(){
                clearInterval(timer)
            }

            //pager에 해당하는 이미지 표시하기
            $pager.on('click','a', function(event){
                event.preventDefault();  //콜백함수를 실행하고싶지만 a의 링크이동을 막고싶을때 사용
                
                if(!$(this).hasClass('active')){
                    goToSlide($(this).index())
                }
            })

            $(this).on({
                mouseenter : stopTimer,
                mouseleave : startTimer
            })
            goToSlide(currentIndex);
            startTimer();
    })
})

//사이드 열기

$('.open_menu').click(function(){
    // show ,hide ,toggle, fadein, fadeout
    // fadeToggle, slideup, slidedown, slideToggle
    $('#side').animate({
        right : 0
    })

    $('#wrap').css({
        'position' : 'fixed'
    })
})

//사이드 닫기

$('.s_close').click(function(){
    $('#side').animate({
        right : -100 + "%"
    })

    $('#wrap').css({
        position : 'relative'
    })
})

//사이드 아코디언 메뉴
	
	$('.s_gnb .d1 .m1').click(function(){
	
	let d = $(this).siblings('.sub').css("display");
	
	if(d=='block'){
	    $('.s_gnb .d1 .sub').slideUp();
	}else{
	    $('.s_gnb .d1 .sub').slideUp()
	    $(this).siblings('.sub').slideDown()
	    $('.s_gnb .d1 .m1').removeClass('on')
	    $(this).addClass('on')
	}
	
})
