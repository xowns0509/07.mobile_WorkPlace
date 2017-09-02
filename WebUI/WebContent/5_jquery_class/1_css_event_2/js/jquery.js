/**
 * 
 */

//마우스가 올라가면 scr 속성값에서 _off를 _on만 변경
//그 결과 이미지가 변경.

//$('#divHtml').html('<img src = "images/puppy.jpg"/>');
$(function() {
	
	$('.rollover').each(function(){
	      $('img').mouseover(function() {
	        $(this).attr("src", $(this).attr('src').replace("off","on"));
	      });
	      
	      $('img').mouseout(function() {
	        $(this).attr("src", $(this).attr('src').replace("on", "off"));
	      });
	   });
	//each가 해당되는 놈.
	

//	
//	$('.rollover:first').hover(function() {//#celebs tr까지만 하면 
//		$(this).html('<img src="imgs/menu01_on.png" alt="Home" />');
//	}, function() {
//		$(this).html('<img src="imgs/menu01_off.png" alt="Home" />');
//	});
//	
//	$('.rollover:eq(1)').hover(function() {//#celebs tr까지만 하면 
//		$(this).html('<img src="imgs/menu02_on.png"  alt="Products"/>');
//	}, function() {
//		$(this).html('<img src="imgs/menu02_off.png"  alt="Products"/>');
//	});
//	
//	$('.rollover:last').hover(function() {//#celebs tr까지만 하면 
//		$(this).html('<img src="imgs/menu03_on.png"  alt="Company" />');
//	}, function() {
//		$(this).html('<img src="imgs/menu03_off.png"  alt="Company" />');
//	});

});