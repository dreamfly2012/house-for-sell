<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:30:"./template/pc/view_article.htm";i:1589872080;s:52:"/www/wwwroot/fangwu.80shihua.com/template/pc/nav.htm";i:1589872080;s:55:"/www/wwwroot/fangwu.80shihua.com/template/pc/header.htm";i:1589872080;s:55:"/www/wwwroot/fangwu.80shihua.com/template/pc/banner.htm";i:1589872079;s:55:"/www/wwwroot/fangwu.80shihua.com/template/pc/footer.htm";i:1589872079;}*/ ?>
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
    <div class="main main_search"><!-- 新增main_search -->
      <div class="container">
        <div class="here"><span>当前位置 ：</span>  <?php  $typeid = ""; if(empty($typeid) && isset($channelartlist["id"]) && !empty($channelartlist["id"])) : $typeid = intval($channelartlist["id"]); endif;  $tagPosition = new \think\template\taglib\eyou\TagPosition; $__VALUE__ = $tagPosition->getPosition($typeid, "", ""); echo $__VALUE__; ?></div>
        <div class="news_title"><?php echo $eyou['field']['titlr']; ?> </div>
        <div class="news_publish">来源：<?php echo $eyou['field']['typename']; ?>   <?php echo MyDate('Y-m-d',$eyou['field']['add_time']); ?></div>
        <div class="about_det news_det">
        <?php echo $eyou['field']['content']; ?> 
         </div>
        <div class="next2">
          <div class="share_box">
            <div class="bdsharebuttonbox"> <a href="#" class="bds_more" data-cmd="more" style="color:#333">分享到：</a> <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a> <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a> <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a> <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a> </div>
            <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
                </script> 
          </div>
          <ul>
            <?php  $tagPrenext = new \think\template\taglib\eyou\TagPrenext; $_result = $tagPrenext->getPrenext("pre");if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator):  $__LIST__ = $_result;if( empty($__LIST__) ) : echo htmlspecialchars_decode("&lt;li&gt;&lt;a&gt;上一篇：暂无&lt;/a&gt;&lt;/li&gt;");else: $field = $__LIST__;$field["title"] = text_msubstr($field["title"], 0, 100, false);?>
            <li><a href="<?php echo $field['arcurl']; ?>" title="<?php echo $field['title']; ?>"> 上一篇：<?php echo $field['title']; ?> </a></li>
            <?php endif; else: echo htmlspecialchars_decode("&lt;li&gt;&lt;a&gt;上一篇：暂无&lt;/a&gt;&lt;/li&gt;");endif; $field = [];  $tagPrenext = new \think\template\taglib\eyou\TagPrenext; $_result = $tagPrenext->getPrenext("next");if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator):  $__LIST__ = $_result;if( empty($__LIST__) ) : echo htmlspecialchars_decode("&lt;li&gt;&lt;a&gt;下一篇：暂无&lt;/a&gt;&lt;/li&gt;");else: $field = $__LIST__;$field["title"] = text_msubstr($field["title"], 0, 100, false);?>
            <li><a href="<?php echo $field['arcurl']; ?>" title="<?php echo $field['title']; ?>"> 下一篇：<?php echo $field['title']; ?> </a></li>
            <?php endif; else: echo htmlspecialchars_decode("&lt;li&gt;&lt;a&gt;下一篇：暂无&lt;/a&gt;&lt;/li&gt;");endif; $field = []; ?>
          </ul>
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
