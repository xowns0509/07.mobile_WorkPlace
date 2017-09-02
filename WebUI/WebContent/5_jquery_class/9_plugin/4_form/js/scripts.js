/**
 * 
 */

$(document).ready(function() {

	// checkbox checked 처리 하기 :
	// $('input:checkbox[id="checkbox_id"]').attr("checked", true); //단일건
	// class나 id 값을 가지고 있다면:
	//
	// $('#check_id').val();
	// $('.check_class').val();
	// 체크되어 있는지 알아보려면:
	//
	// if ($('#check_id').is(":checked"))
	// {
	// // it is checked
	// }
	
	// 
	
	$('input.agree').click(function() {
		//if(this.checked == false){//$('input.agree').is(":checked") == false
			$('input.check-all').prop("checked", false);
			//$('input.check-all').prop("checked", this.checked);
		//}
	});
	
	$('input.check-all').click(function() {
		if($('input.agree').is(":checked")){
			$('input.agree').prop("checked", false);
		}else{
			$('input.agree').prop("checked", true);//$('input.agree').attr("checked", true) prop 대신 attr로 주면 한 번만 됨
		}	
	});
	
//	$('input.class').click(function() {
//		if ($('input.class').is(":checked") == false) {
//
//		}
//	});

	// 이름 공백시 자바스크립트라면 아래를
	// var name = document.getElementById('name').value;
	// if(name.equals("")) alert('이름은 필수입력 사항입니다. ');
	//	
	// 제이쿼리라면 아래와 같이 작성해야 하지만
	// var name = $('name').val();
	// if(name.equals("")) alert('이름은 필수입력 사항입니다. ');

	// validate 플러그인을 넣으면 아래와 같이 해결됨
	// 가장 가까운 id를 골라내어 form을 찾아 냄.

	$('#signup form').validate({
		rules : {
			name : {
				required : true
			// 필수 입력사항으로 만들어줌

			},

			email : {
				required : true,
				email : true
			// 간단하게 email true라고 입력하는 것만으로도 알아서 검사하는 양식(정규화)을 박아줌
			},

			website : {
				url : true
			// url의 형태 맞춤. 정규화
			},

			password : {
				required : true,
				minlength : 6
			},

			// website : url 형식인지
			// password 6자이내
			// 비번 2개의 값이 맞는거 확인하려면
			// validate 808라인

			passconf : {
				required : true,
				equalTo : '#password'
			}

		// //수진이꺼
		// $('#signup form').validate({
		// rules:{
		// name:{required: true},
		// email:{required: true, email: true},
		// //website : url 형식
		// website:{url: true},
		// //비밀번호: 길이 6자이내
		// password:{minlength:6},
		// //비밀번호 2개의 값이 맞는지 확인
		// passconf:{equalTo:'#password'}
		// },
		// success:function(label){
		// label.text('OK').addClass('valid');
		// }
		// });

		},

		success : function(label) {
			label.text('성공').addClass('valid');// 초록색 체크아이콘이 뜨게하려면
			// text('성공')이게 반드시 들어가야 함. 글자는 꼭 성공이아니어도 됨. ok라던가
			// validate 280 여 라인에 메세지가 있는데 그거 다 한글로 바꿔야 함.
		}// success함수를 불러내는 거
	});
});