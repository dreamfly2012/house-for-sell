<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:31:"./template/pc/lists_article.htm";i:1649214096;s:52:"/www/wwwroot/fangwu.80shihua.com/template/pc/nav.htm";i:1649214096;s:55:"/www/wwwroot/fangwu.80shihua.com/template/pc/header.htm";i:1649214096;s:55:"/www/wwwroot/fangwu.80shihua.com/template/pc/banner.htm";i:1649214096;s:53:"/www/wwwroot/fangwu.80shihua.com/template/pc/left.htm";i:1649214096;s:55:"/www/wwwroot/fangwu.80shihua.com/template/pc/footer.htm";i:1649214096;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><?php echo $eyou['field']['seo_title']; ?></title>
<meta name="description" content="<?php echo $eyou['field']['seo_description']; ?>" />
<meta name="keywords" content="<?php echo $eyou['field']['seo_keywords']; ?>" />
<link href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_cmspath"); echo $__VALUE__; ?>/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/css/bootstrap.min.css" rel="stylesheet">
<link href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/css/swiper-3.3.1.min.css" rel="stylesheet" />
<link href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/css/animate.css" rel="stylesheet">
<link href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/css/master.css" rel="stylesheet">
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/swiper-3.3.1.jquery.min.js" type="text/javascript"></script>
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/jquery.superslide.2.1.1.js" type="text/javascript"></script>
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/jquery.superslide.2.1.1.source.js" type="text/javascript"></script>
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/wow.min.js" type="text/javascript"></script>
<script src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_templets_pc"); echo $__VALUE__; ?>/skin/js/funtion.js" type="text/javascript"></script>
</head>
<body>
<div class="wrapper">
  <div class="class page-prev visible-xs visible-sm">
    <div class="m_list">
      <ul class="m_one">
        <li><a href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_cmsurl"); echo $__VALUE__; ?>">首页</a></li>
        <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = ""; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 60; endif; $tagChannel = new \think\template\taglib\eyou\TagChannel; $_result = $tagChannel->getChannel($typeid, "top", "current", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($_result) ? array_slice($_result,0, $row, true) : $_result->slice(0, $row, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $field["typename"] = text_msubstr($field["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $field;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
        <li> <a <?php if(!(empty($field['children']) || (($field['children'] instanceof \think\Collection || $field['children'] instanceof \think\Paginator ) && $field['children']->isEmpty()))): ?>href="javascript:;"<?php endif; ?> href="<?php echo $field['typeurl']; ?>"><?php echo $field['typename']; ?></a>
          <?php if(!(empty($field['children']) || (($field['children'] instanceof \think\Collection || $field['children'] instanceof \think\Paginator ) && $field['children']->isEmpty()))): ?>
          <ul class="m_two">
            <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = ""; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 100; endif;if(is_array($field['children']) || $field['children'] instanceof \think\Collection || $field['children'] instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($field['children']) ? array_slice($field['children'],0,100, true) : $field['children']->slice(0,100, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field2): $field2["typename"] = text_msubstr($field2["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $field2;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
              <li><a href="<?php echo $field2['typeurl']; ?>"><?php echo $field2['typename']; ?></a></li>
            <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field2 = []; ?>
          </ul>
          <?php endif; ?>
        </li>
        <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>  
      </ul>
    </div>
  </div>
  <div class="wrap">
    <div class="header">
      <div class="container">
        <div class="head">
          <div class="logo"><a href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_cmsurl"); echo $__VALUE__; ?>"><i><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_logo"); echo $__VALUE__; ?>"></i></a></div>
          <div class="nav">
            <ul class="one">
              <li class="<?php if(CONTROLLER_NAME == 'Index'): ?>on<?php endif; ?>"><a href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_cmsurl"); echo $__VALUE__; ?>">首页</a></li>
              <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = ""; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 60; endif; $tagChannel = new \think\template\taglib\eyou\TagChannel; $_result = $tagChannel->getChannel($typeid, "top", "on", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($_result) ? array_slice($_result,0, $row, true) : $_result->slice(0, $row, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $field["typename"] = text_msubstr($field["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $field;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
              <li class="<?php echo $field['currentstyle']; ?>"> <a href="<?php echo $field['typeurl']; ?>"><?php echo $field['typename']; ?></a>
               <?php if(!(empty($field['children']) || (($field['children'] instanceof \think\Collection || $field['children'] instanceof \think\Paginator ) && $field['children']->isEmpty()))): ?>
                <ul class="two">
                  <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = ""; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 100; endif;if(is_array($field['children']) || $field['children'] instanceof \think\Collection || $field['children'] instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($field['children']) ? array_slice($field['children'],0,100, true) : $field['children']->slice(0,100, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field2): $field2["typename"] = text_msubstr($field2["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $field2;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
                  <li><a href="<?php echo $field2['typeurl']; ?>"><?php echo $field2['typename']; ?></a></li>
                  <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field2 = []; ?>
                </ul>
                <?php endif; ?>
              </li>
             <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?> 
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- head_end -->
    <div class="mheader">
      <div class="nav_button"></div>
      <div class="mlogo"><a href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_cmsurl"); echo $__VALUE__; ?>"><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_logo"); echo $__VALUE__; ?>"></a></div>
      <div class="head_sear"></div>
      <div class="search">
      <?php  $tagSearchform = new \think\template\taglib\eyou\TagSearchform; $_result = $tagSearchform->getSearchform("","","","",""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $mod = ($e % 2 );$i= intval($key) + 1;?>
        <form method="get" action="<?php echo $field['action']; ?>">
          <?php echo $field['hidden']; ?>
          <input class="sear_box fl" type="text" name="keywords" id="keyword" placeholder="请输入关键词" />
          <input class="sear_btn fr" type="submit" src="images/search.png" value="" />
        </form>
      <?php ++$e; endforeach;endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>   
      </div>
    </div>
    <div class="banner ny_banner"> <img src="<?php echo gettoptype($eyou['field']['typeid'],'litpic'); ?>">
      <div class="ny_header">
        <div class="ny_cn"><?php echo gettoptype($eyou['field']['typeid'],'typename'); ?></div>
        <div class="ny_en"><?php echo gettoptype($eyou['field']['typeid'],'englist_name'); ?></div>
      </div>
      <div class="scroll"></div>
    </div>
    <div class="main">
      <div class="container main_container">
        <div class="headline ny_headline">
  <div class="cn"><?php echo gettoptype($eyou['field']['typeid'],'typename'); ?></div>
  <div class="en"><?php echo gettoptype($eyou['field']['typeid'],'englist_name'); ?></div>
</div>
<div class="left">
  <div class="left_top">
    <div class="title"><?php echo $eyou['field']['typename']; ?></div>
    <div class="classify"></div>
  </div>
  <div class="left_list">
    <ul class="first">
      <?php  if(isset($ui_typeid) && !empty($ui_typeid)) : $typeid = $ui_typeid; else: $typeid = ""; endif; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  if(isset($ui_row) && !empty($ui_row)) : $row = $ui_row; else: $row = 10; endif; $tagChannel = new \think\template\taglib\eyou\TagChannel; $_result = $tagChannel->getChannel($typeid, "first", "cu1", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1;$__LIST__ = is_array($_result) ? array_slice($_result,0, $row, true) : $_result->slice(0, $row, true); if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $field["typename"] = text_msubstr($field["typename"], 0, 100, false); $__LIST__[$key] = $_result[$key] = $field;$i= intval($key) + 1;$mod = ($i % 2 ); ?>
      <li><a class="<?php echo $field['currentstyle']; ?>" href="<?php echo $field['typeurl']; ?>"><?php echo $field['typename']; ?></a></li>
      <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>
    </ul>
  </div>
</div>

        <div class="right">
          <div class="news_list">
            <ul>
            <?php  $typeid = "";  if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  $param = array(      "typeid"=> $typeid,      "notypeid"=> "",      "flag"=> "",      "noflag"=> "",      "channel"=> "", ); $tagList = new \think\template\taglib\eyou\TagList; $_result_tmp = $tagList->getList($param, 6, "", "", "desc", "on");if(is_array($_result_tmp) || $_result_tmp instanceof \think\Collection || $_result_tmp instanceof \think\Paginator): $i = 0; $e = 1; $__LIST__ = $_result = $_result_tmp["list"]; $__PAGES__ = $_result_tmp["pages"];if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $aid = $field["aid"];$field["title"] = text_msubstr($field["title"], 0, 40, false);$field["seo_description"] = text_msubstr($field["seo_description"], 0, 160, true);$i= intval($key) + 1;$mod = ($i % 2 ); ?>
              <li class="news_item news_eg">
                <div class="container ny_container"><a href="<?php echo $field['arcurl']; ?>">
                  <dl class="news_time news_date">
                    <dd class="news_d news_day"><?php echo MyDate('m-d',$field['add_time']); ?></dd>
                    <dd class="news_y news_year"><?php echo MyDate('Y',$field['add_time']); ?></dd>
                  </dl>
                  <dl class="news_intro news_info">
                    <dd class="news_bt news_tit"> <?php echo $field['title']; ?></dd>
                    <dd class="news_nr news_des"> <?php echo html_msubstr($field['seo_description'],0,100,true); ?></dd>
                  </dl>
                  </a></div>
              </li>
            <?php ++$e; $aid = 0; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>  
            </ul>
          </div>
          <div class="next1"> 
          <ul>
           <?php  $__PAGES__ = isset($__PAGES__) ? $__PAGES__ : ""; $tagPagelist = new \think\template\taglib\eyou\TagPagelist; $__VALUE__ = $tagPagelist->getPagelist($__PAGES__, "index,pre,pageno,next,end", "2"); echo $__VALUE__; ?>
          </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- foot_start -->
    <div class="footer">
      <div class="foot_above">
        <div class="container">
          <div class="con_form">
            <?php  $typeid = "13"; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  $tagGuestbookform = new \think\template\taglib\eyou\TagGuestbookform; $_result = $tagGuestbookform->getGuestbookform($typeid, "default"); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $mod = ($e % 2 );$i= intval($key) + 1;?>
          <form method="POST" class="guest-form" enctype="multipart/form-data" action="<?php echo $field['action']; ?>" onsubmit="return checkForm();">
              <div class="con_line">
                <div class="con_name"><?php echo $field['itemname_1']; ?></div>
                <div class="con_input">
                  <input type="text" name="<?php echo $field['attr_1']; ?>" id="attr_1">
                </div>
              </div>
              <div class="con_line">
                <div class="con_name"><?php echo $field['itemname_2']; ?></div>
                <div class="con_input">
                  <input type="text" name="<?php echo $field['attr_2']; ?>" id="attr_2">
                </div>
              </div>
              <div class="con_line">
                <div class="con_name"><?php echo $field['itemname_3']; ?></div>
                <div class="con_input">
                  <input type="text" name="<?php echo $field['attr_3']; ?>" id="attr_3">
                </div>
              </div>
              <div class="con_line">
                <div class="con_name"><?php echo $field['itemname_4']; ?></div>
                <div class="con_input">
                  <input type="email" name="<?php echo $field['attr_4']; ?>" id="attr_4">
                </div>
              </div>
              <div class="con_line con_line_box">
                <div class="con_name"><?php echo $field['itemname_5']; ?></div>
                <div class="con_input">
                  <textarea name="<?php echo $field['attr_5']; ?>" id="attr_5" placeholder="输入<?php echo $field['itemname_5']; ?>"></textarea>
                </div>
              </div>

              <div class="con_sub">
                <input class="" type="submit" value="提交">
              </div>
            <?php echo $field['hidden']; ?>
          </form>
          <script type="text/javascript">
            function checkForm()
            {
              if(document.getElementById('attr_1').value.length == 0)
              {
                alert('请输入您的<?php echo $field['itemname_1']; ?>');
                return false;
              }
              if(document.getElementById('attr_2').value.length == 0)
              {
                alert('请输入您的<?php echo $field['itemname_2']; ?>');
                return false;
              }
              
              return true;
            }
          </script>
        <?php ++$e; endforeach;endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>
          </div>
          <div class="con_area">
            <div class="con_list">
              <ul>
                <li class="con_wx">
                  <div class="con_wx_hover fadeIn wow">
                    <div class="con_wx_img img_c"><i><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_1"); echo $__VALUE__; ?>"></i></div>
                  </div>
                </li>
                <li class="con_qq"> <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&site=<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_name"); echo $__VALUE__; ?>&menu=yes&uin=<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_2"); echo $__VALUE__; ?>" alt="QQ在线咨询"></a></li>
                <li class="con_wb"><a target="_blank" href="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_3"); echo $__VALUE__; ?>"></a></li>
              </ul>
            </div>
            <div class="con_tel">购房热线： <span><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_4"); echo $__VALUE__; ?></span></div>
            <div class="con_nr">
              <dd><span>地       址：</span><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_5"); echo $__VALUE__; ?></dd>
              <dd><span>邮       箱：</span><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_6"); echo $__VALUE__; ?></dd>
              <dd><span>传       真：</span><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_7"); echo $__VALUE__; ?></dd>
            </div>
            <div class="con_erweima img_c"><i><img src="<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_1"); echo $__VALUE__; ?>"></i></div>
          </div>
        </div>
      </div>
      <div class="foot_below">
        <div class="container">
          <div class="linker">
            <ul>
            <?php  $tagFlink = new \think\template\taglib\eyou\TagFlink; $_result = $tagFlink->getFlink("text", ""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $field["title"] = text_msubstr($field["title"], 0, 45, false); $__LIST__[$key] = $_result[$key] = $field;$mod = ($e % 2 );$i= intval($key) + 1;?>
              <li><a href="<?php echo $field['url']; ?>" <?php echo $field['target']; ?>><?php echo $field['title']; ?> </a></li>
            <?php ++$e; endforeach; endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?>
            </ul>
          </div>
          <div class="copyright">
            <p><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_copyright"); echo $__VALUE__; ?> &nbsp; &nbsp; &nbsp;<?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_recordnum"); echo $__VALUE__; ?> </p>
          </div>
        </div>
      </div>
    </div>
    <div class="side">
      <ul>
        <li class="side_sr"> 
          <!-- <div class="side_hover side_sr_hover">
                <div class="side_box side_sr_box">
                    <input type="text" name="s" id="keyword" placeholder="请输入关键词" />
                </div>
            </div> -->
         <?php  $tagSearchform = new \think\template\taglib\eyou\TagSearchform; $_result = $tagSearchform->getSearchform("","","","",""); if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $e = 1; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo htmlspecialchars_decode("");else: foreach($__LIST__ as $key=>$field): $mod = ($e % 2 );$i= intval($key) + 1;?>
          <form class="sr_hover" method="get" action="<?php echo $field['action']; ?>">
            <?php echo $field['hidden']; ?>
            <input class="sr_hover_btn fr" type="submit" value="" />
            <div class="sr_hover_box fl">
              <input type="text" name="keywords" id="keyword" placeholder="请输入关键词" />
            </div>
          </form>
          <?php ++$e; endforeach;endif; else: echo htmlspecialchars_decode("");endif; $field = []; ?> 
        </li>
        <li class="side_tel">
          <div class="tel_hover"><span><?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_attr_4"); echo $__VALUE__; ?></span></div>
        </li>
        <li class="side_top"></li>
      </ul>
    </div>
   <?php  $tagGlobal = new \think\template\taglib\eyou\TagGlobal; $__VALUE__ = $tagGlobal->getGlobal("web_thirdcode_pc"); echo $__VALUE__; ?>
  <!-- 应用插件标签 start -->
   <?php  $tagWeapp = new \think\template\taglib\eyou\TagWeapp; $__VALUE__ = $tagWeapp->getWeapp("default"); echo $__VALUE__; ?>
  <!-- 应用插件标签 end -->
  </div>
</div>
</body>
</html>
