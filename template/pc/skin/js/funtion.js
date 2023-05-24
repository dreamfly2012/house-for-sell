$(document).ready(function() {
	//banner
	// $('.swiper-container-banner').swiper({pagination: '.swiper-pagination-banner li',slidesPerView: 1,paginationClickable: true,spaceBetween: 0,autoplay:5500,speed: 300, autoplayDisableOnInteraction:false,nextButton: '.swiper-button-next-banner',prevButton: '.swiper-button-prev-banner'});
	// $('.swiper-container-banner').swiper({pagination: '.swiper-pagination-banner',paginationType : 'progress',slidesPerView: 1,loop:true,paginationClickable: true,spaceBetween: 0,autoplay:5500,speed: 300, autoplayDisableOnInteraction:false,nextButton: '.swiper-button-next-banner',prevButton: '.swiper-button-prev-banner'});
	$('.swiper-container-banner').swiper({pagination: '.swiper-pagination-banner',paginationType : 'progress',slidesPerView: 1,loop:true,paginationClickable: true,spaceBetween: 0,autoplay:5500,speed: 800, autoplayDisableOnInteraction:false,nextButton: '.swiper-button-next-banner',prevButton: '.swiper-button-prev-banner',
		onSlideChangeStart: function(swiper){
			var timer = jQuery(".swiper-container-banner .timer");
			timer.stop(true,true).animate({ "width":"0%" },0).animate({ "width":"100%" },5500);
		}
	});

	//计算navbar宽度
	function menuwidth(){
		var width=$(".nav" ).width();
		var size=$(".nav > ul > li").size();
		$(".nav > ul > li").css("width",Math.floor(width/size)+"px");
	}
	setTimeout(menuwidth,100);
	$(window).resize(function () {
		menuwidth();
	})
	//当调整浏览器窗口的大小时，发生 resize 事件。
	//nav横向下拉菜单栏
	$("ul.one li").hover(function(){
		$(this).addClass("cu")
		$(this).find("ul.two").stop(false,true).slideDown("400")
	},function(){
		$(this).removeClass("cu")
		$(this).find("ul.two").stop(false,true).slideUp("400")
	});

	//隐藏导航跟wrap的切换
    $(".nav_button").click(function(){
        $(this).toggleClass('head_close');
        $(".class").toggleClass("page-prev").addClass("page-in");
        pageSlideOver();
    })
    function pageSlideOver(){
        $('.page-out').on('transitionend', function(){
            $(this).removeClass('page-out');
        });
        $('.page-in').on('transitionend', function(){
            $(this).removeClass('page-in');
        });

        if ( !$(".class").hasClass('page-prev') ) {
            $(".mheader").addClass('fx');
        } else{
            $(".mheader").removeClass('fx');
        };
    }

	//mheader 隐藏导航
	$(".m_two,.m_three").siblings('a').append('<span></span>');
	$(".m_list .m_one>li>a").click(function() {
        $(this).toggleClass('cu1')
        $(this).parent().siblings().find('a').removeClass('cu1')
        $(this).parent().siblings().find('.m_two a').removeClass('cu2')
        $(this).parent().siblings().find('.m_three a').removeClass('cu3')
        $(this).find('span').toggleClass('close_one').parent().parent().siblings().find('span').removeClass('close_one');
        $(this).parent().siblings().find('.m_two,.m_three,.m_four').slideUp();
        $(this).siblings('.m_two').slideToggle();
    });
    $(".m_list .m_two>li>a").click(function() {
        $(this).addClass('cu2')
        $(this).parent().siblings().find('a').removeClass('cu2')
        $(this).parent().siblings().find('.m_three a').removeClass('cu3')
        $(this).find('span').toggleClass('close_one').parent().parent().siblings().find('span').removeClass('close_one');
        $(this).parent().siblings().find('.m_three,.m_four').slideUp();
        $(this).siblings('.m_three').slideToggle();
    });
    $(".m_list .m_three>li>a").click(function() {
        $(this).addClass('cu3')
        $(this).parent().siblings().find('a').removeClass('cu3')
        $(this).parent().siblings().find('.m_four').slideUp();
        $(this).siblings('.m_four').slideToggle();
    });
    //mheader 头部搜索
    $(".head_sear").click(function(event) {
    	$(this).toggleClass('head_close');
    	$(this).siblings('.search').slideToggle(400)
    });

	$(".side_top").click(function(){
		$("html,body").animate({scrollTop:'0px'},800);
	});
	//侧边电话 经过显示号码
    $(".side_tel").hover(function() {
        $(".tel_hover").stop(true, true).fadeIn(400);
    }, function() {
        $(".tel_hover").stop(true, true).fadeOut(400);
    });
    //侧边微信 经过显示二维码
    $(".side_sr").hover(function() {
        $(".sr_hover_box").stop(true, true).fadeIn(400);
    }, function() {
        $(".sr_hover_box").stop(true, true).fadeOut(400);
    });

    //首页产品展示点击切换==选项卡
    jQuery(".pro_slide").slide({titCell:".hd_pro li", effect:"fade", mainCell:".bd_pro",trigger:"click"});
    //首页产品展示点击切换==选项卡==手机端点击下拉切换
    $(".pro_click").click(function(event) {
        $(".hd_pro>ul").slideToggle(400);
        $(this).toggleClass('pro_close');
    });
    $(".hd_pro>ul>li").click(function(event) {
        var textcolor =$(this).text()
        // console.log(textcolor)
        $(".pro_click").text(textcolor)
        if ( $(window).width() < 992) {
        	$(".hd_pro>ul").slideUp(400);
        	$(".pro_click").removeClass('pro_close')
        };

    });

    //优势
    // function advWidth(){
    // 	var adv_w = $(".adv_data ul li.cu").width()
	   //  // console.log(adv_w)
	   //  $(".adv_left").width(adv_w/2)
	   //  $(".adv_right").width(adv_w/2)
	   //  if ( $(window).width() < 992 ) {
	   //  	$(".adv_left").width(adv_w/3)
	   //  	$(".adv_right").width(adv_w/3*2)
	   //  };
	   //  // && $(window).width() > 568
    // }
    function advWidth(){
        var adv_w = $(".a_data ul li.cu").width()
        // console.log(adv_w)
        $(".a_left").width(adv_w/2)
        $(".a_right").width(adv_w/2)
        if ( $(window).width() < 1200 ) {
            $(".a_left").width(adv_w)
            $(".a_right").width(adv_w)
        };
        // && $(window).width() > 568
    }
    setTimeout(advWidth,100);
	$(window).resize(function () {
		advWidth();
	})
    $(".a_data ul li").hover(function(){
		$(this).addClass("cu")
		$(this).siblings('li').removeClass("cu")
	},function(){
		// $(this).removeClass("cu")
	});

	//内页分类
    $(".left_list .first>li>a").click(function() {
        $(this).toggleClass('cu1')
        $(this).parent().siblings().find('a').removeClass('cu1')
        // $(this).find('span').toggleClass('close_first')
        // $(this).parent().siblings().find('span').removeClass('close_first');
        $(this).parent().siblings().find('.second a').removeClass('cu2')
        $(this).parent().siblings().find('.third a').removeClass('cu3')
        $(this).parent().siblings().find('.second,.third').slideUp();
        $(this).siblings('.second').slideToggle();
    });
    $(".left_list .second>li>a").click(function() {
        $(this).addClass('cu2')
        $(this).parent().siblings().find('a').removeClass('cu2')
        // $(this).find('span').toggleClass('close_first')
        // $(this).parent().siblings().find('span').removeClass('close_first');
        $(this).parent().siblings().find('.third a').removeClass('cu3')
        $(this).parent().siblings().find('.third').slideUp();
        $(this).siblings('.third').slideToggle();
    });
    //内页pc分类
    $(".classify").click(function() {
        $('.left_list').slideToggle(400);
        $(this).toggleClass('close_c');
    });

    //内页点击上拉
    $('.scroll').click(function(){
        var mainTop = $(".main").offset().top;
        $('html,body').animate({scrollTop: mainTop}, 800);
    });

    //产品详情页 多图轮播 pc   
    //大图切换
    jQuery(".pc_image").slide({ titCell:".smallimg li", mainCell:".bigimg", effect:"fold", delayTime:200,trigger:"mouseover",pnLoop:false});
    //小图左滚动切换
    jQuery(".pc_image .smallscroll").slide({ mainCell:"ul",delayTime:100,vis:3,effect:"top",autoPage:true,prevCell:".prev_det_pc",nextCell:".next_det_pc",pnLoop:false });

    //产品详情页 多图轮播 手机
    var galleryTop = new Swiper('.gallery-top', {
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            spaceBetween: 10,
            // loop:true,
            // loopedSlides: 4, //looped slides should be the same
            initialSlide :0,  //设定初始化时slide的索引。
        });
    var galleryThumbs = new Swiper('.gallery-thumbs', {
        spaceBetween: 10,
        slidesPerView: 3,
        // loop:true,
        // loopedSlides: 4, //looped slides should be the same
        centeredSlides: true,
        slidesPerView: 'auto',
        touchRatio: 0.2,
        initialSlide :0,  //设定初始化时slide的索引。
        slideToClickedSlide: true
    });
    galleryTop.params.control = galleryThumbs;
    galleryThumbs.params.control = galleryTop;

    //动画
    $(".news .news_data ul li,.adv_data ul li").each(function(index, el) {
        var itime = index/10 + 's';
        $(this).attr('data-wow-delay', itime);
    });
    $(".header").addClass('fadeInDown wow')
    $(".mheader,.news .news_data ul li,.here,.hint,.ny_headline").addClass('fadeInUp wow')
    $(".side,.adv_data ul li").addClass('fadeInRight wow')
    $(".left").addClass('fadeInLeft wow')

	// 鼠标滚动渐入
	if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
		new WOW().init();
	};

});