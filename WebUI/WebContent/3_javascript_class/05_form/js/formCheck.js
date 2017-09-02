	function checkFields()
	{	
		// 공란 체크
		for( i=0 ; i < document.frm.length ; i++ )
			{
			if( document.frm.elements[i].type == "text")
				{
					if( document.frm.elements[i].value == "")
					{
						alert("모든 칸을 입력하시렵니까")
						return false;
					}
				}
			}
		
		// 성별확인
		if( document.frm.gender[0].checked == true )
		{
			alert("당신은 " + document.frm.gender[0].value + "이시군요");
		}else if(document.frm.gender[1].checked == true){
			alert("당신은 " + document.frm.gender[1].value + "이시군요");
		}
		
		// 이메일확인
		var mailObj = document.frm.email;
		if( (mailObj.value.indexOf("@",0 )) < 0 || (mailObj.value.indexOf(".",0 )) < 0 )
			{
				alert("멜형식이 우째");
				mailObj.focus();		// 포커스를 준다
				mailObj.select();		// 문자를 선택상태로 한다
				return false;			// submit 안되게 한다
			}
		
		return true;
	}