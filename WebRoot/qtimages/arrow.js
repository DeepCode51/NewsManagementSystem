$("document").ready(function(){
	/***不需要自动滚动，去掉即可***/
	var time = window.setInterval(function(){
		$('.caseRight').click();	
	},5000);
	$('.casePicUlIdBox').mouseover(function() {
			clearInterval(time);
		});
	$('.casePicUlIdBox').mouseout(function(){
		  time = window.setInterval(function(){
			$('.caseRight').click();	
		 },5000);
	});
	
	$('.caseLeft').mouseover(function() {
			clearInterval(time);
		});
	$('.caseLeft').mouseout(function(){
		  time = window.setInterval(function(){
			$('.caseLeft').click();	
		 },5000);
	});
	
	$('.caseRight').mouseover(function() {
			clearInterval(time);
		});
	$('.caseRight').mouseout(function(){
		  time = window.setInterval(function(){
			$('.caseRight').click();	
		 },5000);
	});
	/***不需要自动滚动，去掉即可***/
	var page=1;
	var i=1;
	var box=$('.casePicUlIdBox');
	var h=$('.casePicUlIdBox ul').width();
	var pagetotal= $('.casePicUlIdBox ul').length;
	$(".casePicUlIdBox").css("width",pagetotal*h+"px");
	$('.htmlpic2').html($('.htmlpic1').html());//复制内容
   // document.getElementById("a").innerHTML =  document.getElementById("b").innerHTML;
    w = pagetotal*1200;	
    //alert(w);
	$('.caseLeft').bind('click',upwardsfn);
	$('.caseRight').bind('click',downfn);	
	function upwardsfn(){
		/*
		if($('.htmlpic1,.htmlpic2').is(':animated')){
			$('.htmlpic1,.htmlpic2').stop(true,true);
		}*/
		/*if(page>1){
			box.animate({ marginLeft : '+='+h }, "slow");
			page--;
		}*/
		if($('.htmlpic2,.htmlpic1').is(':animated')){
			$('.htmlpic2,.htmlpic1').stop(true,true);
		}
		if($('.casePicUlIdBox ul').length>1){
			ml = parseInt($('.htmlpic1').css('left'));
			sl = parseInt($('.htmlpic2').css('left'));
		   // alert(ml);
			if(ml<=0 && ml>w*-1){
				if(ml==0){
					$('.htmlpic2').css({left: w * -1 + 'px'});
					sl = parseInt($('.htmlpic2').css('left'));
				}
				$('.htmlpic2').animate({left: sl + 240 + 'px'},'slow');
				$('.htmlpic1').animate({left: ml + 240 + 'px'},'slow');				
			}else{
				if(sl==0){
					$('.htmlpic1').css({left: w * -1 + 'px'});
					ml = parseInt($('.htmlpic1').css('left'));
				}
				$('.htmlpic1').animate({left: ml + 240 + 'px'},'slow');			
				$('.htmlpic2').animate({left: sl + 240 + 'px'},'slow');
			}
		}
	}
	function downfn(){
		/*f(pagetotal>page){
			box.animate({ marginLeft : '-='+h }, "slow");
			page++;
		}*/
		//alert(w);
		if($('.htmlpic1,.htmlpic2').is(':animated')){
			$('.htmlpic1,.htmlpic2').stop(true,true);
		}
		if($('.casePicUlIdBox ul').length>1){//多于4张图片
			ml = parseInt($('.htmlpic1').css('left'));//默认图片ul位置
			sl = parseInt($('.htmlpic2').css('left'));//交换图片ul位置
			if(ml<= 1200 && ml>w*-1){//默认图片显示时
			    if(ml+w == 1200){//交换图片最后一屏时
					$('.htmlpic2').css({left:'1200px'})//默认图片放在显示区域右
					sl = parseInt($('.htmlpic2').css('left'));
				}
				$('.htmlpic1').animate({left: ml - 240 + 'px'},'slow');//默认图片滚动	
				$('.htmlpic2').animate({left: sl - 240 + 'px'},'slow');//交换图片滚动
			}else{//交换图片显示时

				if(sl+w == 1200){//交换图片最后一屏时
					$('.htmlpic1').css({left:'1200px'})//默认图片放在显示区域右
					ml = parseInt($('.htmlpic1').css('left'));
				}
				$('.htmlpic1').animate({left: ml - 240 + 'px'},'slow');//默认图片滚动	
				$('.htmlpic2').animate({left: sl - 240 + 'px'},'slow');//交换图片滚动
			}
		}

	}

});

$(function() {
	var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
	var len = $("#focus ul li").length; //获取焦点图个数
	var index = 0;
	var picTimer;
	
	//以下代码添加数字按钮和按钮后的半透明长条
	var btn = "<div class='btn'>";
	for(var i=0; i < len; i++) {
		//btn += "<span>" + (i+1) + "</span>";
		btn += "<span>&nbsp;</span>";
	}
	btn += "</div>"
	$("#focus").append(btn);
	//$("#focus .btnBg").css("opacity",0.5);
	
	//为数字按钮添加鼠标滑入事件，以显示相应的内容
	$("#focus .btn span").mouseenter(function() {
		index = $("#focus .btn span").index(this);
		showPics(index);
	}).eq(0).trigger("mouseenter");
	
	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
	$("#focus ul").css("width",sWidth * (len + 1));
	
	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
	$("#focus").hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			if(index == len) { //如果索引值等于li元素个数，说明最后一张图播放完毕，接下来要显示第一张图，即调用showFirPic()，然后将索引值清零
				showFirPic();
				index = 0;
			} else { //如果索引值不等于li元素个数，按普通状态切换，调用showPics()
				showPics(index);
			}
			index++;
		},3000); //此3000代表自动播放的间隔，单位：毫秒
	}).trigger("mouseleave");
	
	//显示图片函数，根据接收的index值显示相应的内容
	function showPics(index) { //普通切换
		var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
		$("#focus ul").stop(true,false).animate({"left":nowLeft},500); //通过animate()调整ul元素滚动到计算出的position
		$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
	}
	
	function showFirPic() { //最后一张图自动切换到第一张图时专用
		$("#focus ul").append($("#focus ul li:first").clone());
		var nowLeft = -len*sWidth; //通过li元素个数计算ul元素的left值，也就是最后一个li元素的右边
		$("#focus ul").stop(true,false).animate({"left":nowLeft},500,function() {
			//通过callback，在动画结束后把ul元素重新定位到起点，然后删除最后一个复制过去的元素
			$("#focus ul").css("left","0");
			$("#focus ul li:last").remove();
		}); 
		$("#focus .btn span").removeClass("on").eq(0).addClass("on"); //为第一个按钮添加选中的效果
	}
});
