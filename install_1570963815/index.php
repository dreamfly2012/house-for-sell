<?php

include 'auto.php';
if(IS_SAE)
header("Location: index_sae.php");

// php最低版本要求
$mini_php = '5.4.0';

if (file_exists('./install.lock')) {
    echo '
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        </head>
        <body>
            你已经安装过该系统，如果想重新安装，请先删除站点install目录下的 install.lock 文件，然后再安装。
        </body>
        </html>';
    exit;
}
@set_time_limit(1000);
if (phpversion() <= $mini_php)
    @set_magic_quotes_runtime(0);
if ($mini_php > phpversion()){
    header("Content-type:text/html;charset=utf-8");
    die('本系统要求PHP版本 >= '.$mini_php.'，当前PHP版本为：'.phpversion() . '，请到虚拟主机控制面板里切换PHP版本，或联系空间商协助切换。<a href="http://www.eyoucms.com/help/" target="_blank">点击查看易优安装教程</a>');
}

define("EYOUCMS_VERSION", '20180101');
date_default_timezone_set('PRC');
error_reporting(E_ALL & ~E_NOTICE);
header('Content-Type: text/html; charset=UTF-8');
define('SITEDIR', _dir_path(substr(dirname(__FILE__), 0, -8)));
//define('SITEDIR2', substr(SITEDIR,0,-7));
//echo SITEDIR2;
//exit;
//数据库
$sqlFile = 'eyoucms.sql';
$configFile = 'config.php';
if (!file_exists(SITEDIR . 'install/' . $sqlFile) || !file_exists(SITEDIR . 'install/' . $configFile)) {
    echo "缺少必要的安装文件（{$sqlFile} 或 {$configFile}）!";
    exit;
}
$Title = "EyouCMS安装向导";
$Powered = "Powered by EyouCMS";
$steps = array(
    '1' => '安装许可协议',
    '2' => '运行环境检测',
    '3' => '安装参数设置',
    '4' => '安装详细过程',
    '5' => '安装完成',
);
$step = isset($_GET['step']) ? intval($_GET['step']) : 1;

//地址
$scriptName = !empty($_SERVER["REQUEST_URI"]) ? $scriptName = $_SERVER["REQUEST_URI"] : $scriptName = $_SERVER["PHP_SELF"];
$rootpath = @preg_replace("/\/(I|i)nstall\/index\.php(.*)$/", "", $scriptName);
$domain = empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : $_SERVER['SERVER_NAME'];
if ((int) $_SERVER['SERVER_PORT'] != 80) {
    $domain .= ":" . $_SERVER['SERVER_PORT'];
}
$domain = $domain . $rootpath;

switch ($step) {

    case '1':
        session_start();
        $_SESSION['isset_author'] = null;
        session_destroy();
        include_once ("./templates/step1.php");
        exit();

    case '2':

        if (phpversion() < 5) {
            die('本系统需要PHP5.4.0以上 + MYSQL >= 5.0环境，当前PHP版本为：' . phpversion());
        }

        $err = 0;

        $phpv = @ phpversion();
        if ($mini_php <= phpversion()){
            $phpvStr = '<img src="images/ok.png">';
        }else{
            $phpvStr = '<img src="images/del.png"> &nbsp;<a href="http://www.eyoucms.com/bbs/3132.html" target="_blank">当前版本('.phpversion().')不支持</a>';
            $err++;
        }
        $os = PHP_OS;
        //$os = php_uname();
        $tmp = function_exists('gd_info') ? gd_info() : array();
        $server = $_SERVER["SERVER_SOFTWARE"];
        $host = (empty($_SERVER["SERVER_ADDR"]) ? $_SERVER["SERVER_HOST"] : $_SERVER["SERVER_ADDR"]);
        $name = $_SERVER["SERVER_NAME"];
        $max_execution_time = ini_get('max_execution_time');
        $allow_reference = (ini_get('allow_call_time_pass_reference') ? '<img src="images/ok.png">' : '<img src="images/del.png">');
        $allow_url_fopen = (ini_get('allow_url_fopen') ? '<img src="images/ok.png">' : '<img src="images/del.png">');
        $safe_mode = (ini_get('safe_mode') ? '<img src="images/del.png">&nbsp;<a href="http://www.eyoucms.com/bbs/3125.html" target="_blank">详情</a>' : '<img src="images/ok.png">');
        
        if (empty($tmp['GD Version'])) {
            $gd = '<img src="images/del.png">&nbsp;<a href="http://www.eyoucms.com/bbs/3126.html" target="_blank">详情</a>';
            $err++;
        } else {
            $gd = '<img src="images/ok.png">';
        }
        if (function_exists('mysqli_connect')) {
            $mysql = '<img src="images/ok.png">';
        } else {
            $mysql = '<img src="images/del.png">&nbsp;<a href="http://www.eyoucms.com/bbs/3127.html" target="_blank">详情</a>';
            $err++;
        }
        // if (ini_get('file_uploads')) {
        //     $uploadSize = '<img src="images/ok.png">';
        // } else {
        //     $uploadSize = '<img src="images/del.png">&nbsp;<a href="http://www.eyoucms.com/bbs/3128.html" target="_blank">详情</a>';
        // }
        if (class_exists('pdo')) {
            $pdo = '<img src="images/ok.png">';
        } else {
            $pdo = '<img src="images/del.png">&nbsp;<a href="http://www.eyoucms.com/bbs/3129.html" target="_blank">详情</a>';
            $err++;
        }
        if (extension_loaded('pdo_mysql')) {
            $pdo_mysql = '<img src="images/ok.png">';
        } else {
            $pdo_mysql = '<img src="images/del.png">&nbsp;<a href="http://www.eyoucms.com/bbs/3129.html" target="_blank">详情</a>';
            $err++;
        }
/*        if (function_exists('session_start')) {
            $session = '<img src="images/ok.png">';
        } else {
            $session = '<img src="images/del.png">';
            $err++;
        }*/
        if(function_exists('curl_init')){
            $curl = '<img src="images/ok.png">';
        }else{
            $curl = '<img src="images/del.png">&nbsp;<a href="http://www.eyoucms.com/bbs/3130.html" target="_blank">详情</a>';
            $err++;
        }
        if(function_exists('file_put_contents')){
            $file_put_contents = '<img src="images/ok.png">';
        }else{
            $file_put_contents = '<img src="images/del.png">&nbsp;<a href="http://www.eyoucms.com/bbs/3131.html" target="_blank">详情</a>';
            $err++;
        }
        // if(function_exists('scandir')){
        //     $scandir = '<img src="images/ok.png">';
        // }else{
        //     $scandir = '<img src="images/del.png">';
        //     $err++;
        // }
        
        $folder = array(
            'install',
            'uploads',
            'data/runtime',
            'application/admin/conf',
            'application/config.php',
            'application/database.php',
        );
        include_once ("./templates/step2.php");
        exit();

    case '3':
        $dbName = trim(addslashes($_POST['dbName']));
        $dbUser = trim(addslashes($_POST['dbUser']));
        $dbport = !empty($_POST['dbport']) ? addslashes($_POST['dbport']) : '3306';
        $dbPwd = $_POST['dbPwd'];
        $dbHost = addslashes($_POST['dbHost']);
        if ($_GET['testdbpwd']) {
            $conn = @mysqli_connect($dbHost, $dbUser, $dbPwd,NULL,$dbport);     
            if (mysqli_connect_errno($conn)){
                die(json_encode(array(
                    'errcode'   => 0,
                    'dbpwmsg'    => "<span for='dbname' generated='true' class='tips_error'>数据库连接失败，请重新设定</span>",
                )));
            } else {
                /*针对mysql5版本，结合程序本身一些复杂SQL进行sql_mode设置*/
                // $result = mysqli_query($conn,"SELECT @@global.sql_mode");
                // $result = $result->fetch_array();
                // $version = mysqli_get_server_info($conn);
                // if ($version >= 5)
                // {
                //     if(strstr($result[0],'STRICT_ALL_TABLES') || strstr($result[0],'TRADITIONAL') || strstr($result[0],'ANSI') || strstr($result[0],'ONLY_FULL_GROUP_BY')) {
                //         die(json_encode(array(
                //             'errcode'   => -1,
                //             'dbpwmsg'    => "<span for='dbname' generated='true' class='tips_error'>请在mysql配置文件修改sql-mode或sql_mode</span>&nbsp;<a href='http://www.eyoucms.com/bbs/2799.html' target='_blank'>点击查看操作</a>",
                //         )));
                //     } 
                // }
                /*--end*/

                if (empty($dbName)) {
                    die(json_encode(array(
                        'errcode'   => -2,
                        'dbpwmsg'    => "<span class='green'>信息正确</span>",
                        'dbnamemsg'    => "<span class='red'>数据库不能为空，请设定</span>",
                    )));

                } else {
                    /*检测数据库是否存在*/
                    $result = mysqli_query($conn,"select count(table_name) as c from information_schema.`TABLES` where table_schema='$dbName'");
                    $result = $result->fetch_array();
                    if($result['c'] > 0) { // 存在
                        $dbnamemsg = "<span class='red'>数据库已经存在，系统将覆盖数据库</span>";
                    } else { // 不存在
                        $dbnamemsg = "<span class='green'>数据库不存在，系统将自动创建</span>";
                    }
                    /*--end*/
                }
                
                die(json_encode(array(
                    'errcode'   => 1,
                    'dbpwmsg'    => "<span class='green'>信息正确</span>",
                    'dbnamemsg'    => $dbnamemsg,
                )));
            }
        }
        else if ($_GET['check']) 
        {
            if (!function_exists('mysqli_connect')) {
                $arr = array(
                    'code'   => -1,
                    'msg'   => "请安装 mysqli 扩展！",
                );
                die(json_encode($arr));
            }

            $conn = @mysqli_connect($dbHost, $dbUser, $dbPwd,NULL,$dbport);
            if (mysqli_connect_errno($conn)){
                $arr = array(
                    'code'   => -1,
                    'msg'   => "请检查数据库连接信息，".iconv('gbk', 'utf-8', mysqli_connect_error($conn)),
                );
                die(json_encode($arr));
            }

            mysqli_set_charset($conn, "utf8"); //,character_set_client=binary,sql_mode='';
            $version = mysqli_get_server_info($conn);
            if ($version < 5.1) {
                $arr = array(
                    'code'   => -1,
                    'msg'   => '数据库版本('.$version.')太低！必须 >= 5.1',
                );
                die(json_encode($arr));
            }

            if (!@mysqli_select_db($conn,$dbName)) {
                //创建数据时同时设置编码
                if (!@mysqli_query($conn,"CREATE DATABASE IF NOT EXISTS `" . $dbName . "` DEFAULT CHARACTER SET utf8;")) {
                    $arr = array(
                        'code'   => -1,
                        'msg'   => '数据库 ' . $dbName . ' 不存在，也没权限创建新的数据库，建议联系空间商或者服务器负责人！',
                    );
                    die(json_encode($arr));
                }
            }

            $arr = array(
                'code'   => 0,
                'msg'   => '',
            );
            die(json_encode($arr));
        }

        include_once ("./templates/step3.php");
        exit();

    case '4':
        $arr = array();

        $dbHost = trim(addslashes($_POST['dbhost']));
        $dbport = !empty($_POST['dbport']) ? addslashes($_POST['dbport']) : '3306';
        $dbName = trim(addslashes($_POST['dbname']));
        $dbUser = trim(addslashes($_POST['dbuser']));
        $dbPwd = trim($_POST['dbpw']);
        $dbPrefix = empty($_POST['dbprefix']) ? 'ey_' : trim(addslashes($_POST['dbprefix']));

        $username = trim(addslashes($_POST['manager']));
        $password = trim($_POST['manager_pwd']);
        
        if (!function_exists('mysqli_connect')) {
            $arr['msg'] = "请安装 mysqli 扩展!";
            echo json_encode($arr);
            exit;
        }           
        
        $conn = @mysqli_connect($dbHost, $dbUser, $dbPwd,NULL,$dbport);
        if (mysqli_connect_errno($conn)){
            $arr['msg'] = "连接数据库失败!".mysqli_connect_error($conn);           
            echo json_encode($arr);
            exit;
        }
        mysqli_set_charset($conn, "utf8"); //,character_set_client=binary,sql_mode='';
        $version = mysqli_get_server_info($conn);
        if ($version < 5.1) {
            $arr['msg'] = '数据库版本('.$version.')太低! 必须 >= 5.1';
            echo json_encode($arr);
            exit;
        }

        if (!@mysqli_select_db($conn,$dbName)) {
            //创建数据时同时设置编码
            if (!@mysqli_query($conn,"CREATE DATABASE IF NOT EXISTS `" . $dbName . "` DEFAULT CHARACTER SET utf8;")) {
                $arr['msg'] = '数据库 ' . $dbName . ' 不存在，也没权限创建新的数据库，建议联系空间商或者服务器负责人！';
                echo json_encode($arr);
                exit;
            }

            mysqli_select_db($conn , $dbName);
        }

        //读取数据文件
        $sqldata = file_get_contents(SITEDIR . 'install/' . $sqlFile);
        $sqlFormat = sql_split($sqldata, $dbPrefix);
        //创建写入sql数据库文件到库中 结束

        /**
         * 执行SQL语句
         */
        $counts = count($sqlFormat);

        for ($i = 0; $i < $counts; $i++) {
            $sql = trim($sqlFormat[$i]);

            if (strstr($sql, 'CREATE TABLE')) {
                preg_match('/CREATE TABLE `([^ ]*)`/', $sql, $matches);
                mysqli_query($conn,"DROP TABLE IF EXISTS `$matches[1]");
                $ret = mysqli_query($conn,$sql);
                if (!$ret) {
                    $message = '创建数据表' . $matches[1] . '失败，请尝试F5刷新!';
                    $arr = array('msg' => $message);
                    echo json_encode($arr);
                    exit;
                }
            } else {
                if(trim($sql) == '')
                   continue;
                preg_match('/INSERT INTO `([^ ]*)`/', $sql, $matches);
                $ret = mysqli_query($conn,$sql);
                if (!$ret) {
                    $message = '写入表' . $matches[1] . '记录失败，请尝试F5刷新!';
                    $arr = array('msg' => $message);
                    echo json_encode($arr);
                    exit;
                }
            }
        }

        // 清空测试数据
/*            if(addslashes($_POST['demo']) != 'demo')
        {               
            $result = mysqli_query($conn,"show tables");      
            $tables=$result->fetch_all(MYSQLI_NUM);//参数MYSQL_ASSOC、MYSQLI_NUM、MYSQLI_BOTH规定产生数组类型
            $bl_table = array('ey_admin','ey_arcrank','ey_auth_access','ey_auth_modular','ey_auth_role','ey_auth_role_admin','ey_auth_rule','ey_channeltype','ey_config','ey_email_template');
            foreach($bl_table as $k => $v)
            {
                $bl_table[$k] = str_replace('ey_',$dbPrefix,$v); 
            }                 
        
            foreach($tables as $key => $val)
            {                   
                if(!in_array($val[0], $bl_table))
                {
                    mysqli_query($conn,"truncate table ".$val[0]);
                }       
            }
            delFile('../public/upload'); // 清空测试图片
        }*/

        /*清空缓存*/
        delFile('../data/runtime');
        /*--end*/

        if (999999 == $i) {
            exit('-1');
        }       

        //读取配置文件，并替换真实配置数据1
        $strConfig = file_get_contents(SITEDIR . 'install/' . $configFile);
        $strConfig = str_replace('#DB_HOST#', $dbHost, $strConfig);
        $strConfig = str_replace('#DB_NAME#', $dbName, $strConfig);
        $strConfig = str_replace('#DB_USER#', $dbUser, $strConfig);
        $strConfig = str_replace('#DB_PWD#', $dbPwd, $strConfig);
        $strConfig = str_replace('#DB_PORT#', $dbport, $strConfig);
        $strConfig = str_replace('#DB_PREFIX#', $dbPrefix, $strConfig);
        $strConfig = str_replace('#DB_CHARSET#', 'utf8', $strConfig);
        $strConfig = str_replace('#DB_DEBUG#', false, $strConfig);
        @chmod(SITEDIR . '/application/database.php',0777); //数据库配置文件的地址
        @file_put_contents(SITEDIR . '/application/database.php', $strConfig); //数据库配置文件的地址
        
        //读取配置文件，并替换缓存前缀
        $strConfig = file_get_contents(SITEDIR . '/application/config.php');
        $uniqid_str = uniqid();
        $uniqid_str = md5($uniqid_str);
        $strConfig = str_replace('eyoucms_cache_prefix', $uniqid_str, $strConfig);           
        @chmod(SITEDIR . '/application/config.php',0777); //配置文件的地址
        @file_put_contents(SITEDIR . '/application/config.php', $strConfig); //配置文件的地址            
        
        //更新网站基本配置信息
        $web_cmspath = preg_replace('/(.*)\/install([\w]*)\/index\.php/i', '$1', $_SERVER['SCRIPT_NAME']);
        $web_basehost = 'http://'.trim($_SERVER['HTTP_HOST'], '/').$web_cmspath;
        $sql = "UPDATE `{$dbPrefix}config` SET `value` = '$web_basehost' WHERE name = 'web_basehost' AND inc_type = 'web'";
        mysqli_query($conn, $sql);
        $sql = "UPDATE `{$dbPrefix}config` SET `value` = '$web_cmspath' WHERE name = 'web_cmspath' AND inc_type = 'web'";
        mysqli_query($conn, $sql);

        //插入管理员表字段tp_admin表
        $time = time();
        $ip = get_client_ip();
        $ip = empty($ip) ? "0.0.0.0" : $ip;
        $password = md5('!*&^eyoucms<>|?'.trim($_POST['manager_pwd']));
        mysqli_query($conn, "DELETE FROM `{$dbPrefix}admin` WHERE user_name = 'admin'");
        mysqli_query($conn, " INSERT  INTO `{$dbPrefix}admin` (`admin_id`,`user_name`,`true_name`,`password`,`add_time`,`last_login`,`last_ip`,`login_cnt`,`status`) VALUES ('1','$username','$username','$password','$time','0','$ip','1','1')");
                
        $url = $_SERVER['PHP_SELF']."?step=5";
        header("Location: {$url}");
        exit;

    case '5':
        $ip = get_server_ip();
        $host = $_SERVER['HTTP_HOST'];
        $curent_version = file_get_contents(SITEDIR .'/data/conf/version.txt');
        $create_date = date("Ymdhis");
        $time = time();
        $phpv = urlencode(phpversion());
        $web_server    = urlencode($_SERVER['SERVER_SOFTWARE']);
        $mt_rand_str = $create_date.sp_random_string(6);
        $ajax_url = 'aHR0cDovL3NlcnZpY2UuZXlvdWNtcy5jb20vaW5kZXgucGhwP209YXBpJmM9U2VydmljZSZhPXVzZXJfcHVzaA==';
        $str_constant = "<?php".PHP_EOL."define('INSTALL_DATE',".$time.");".PHP_EOL."define('SERIALNUMBER','".$mt_rand_str."');";
        @file_put_contents(SITEDIR . '/application/admin/conf/constant.php', $str_constant);
        include_once ("./templates/step5.php");
        @touch('./install.lock');
        exit();
}

function testwrite($d) {
    $tfile = "_test.txt";
    $fp = @fopen($d . "/" . $tfile, "w");
    if (!$fp) {
        return false;
    }
    fclose($fp);
    $rs = @unlink($d . "/" . $tfile);
    if ($rs) {
        return true;
    }
    return false;
}

function sql_execute($sql, $tablepre) {
    $sqls = sql_split($sql, $tablepre);
    if (is_array($sqls)) {
        foreach ($sqls as $sql) {
            if (trim($sql) != '') {
                mysqli_query($sql);
            }
        }
    } else {
        mysqli_query($sqls);
    }
    return true;
}

function sql_split($sql, $tablepre) {

    if ($tablepre != "ey_")
        $sql = str_replace("ey_", $tablepre, $sql);
          
    $sql = preg_replace("/TYPE=(InnoDB|MyISAM|MEMORY)( DEFAULT CHARSET=[^; ]+)?/", "ENGINE=\\1 DEFAULT CHARSET=utf8", $sql);
    
    $sql = str_replace("\r", "\n", $sql);
    $ret = array();
    $num = 0;
    $queriesarray = explode(";\n", trim($sql));
    unset($sql);
    foreach ($queriesarray as $query) {
        $ret[$num] = '';
        $queries = explode("\n", trim($query));
        $queries = array_filter($queries);
        foreach ($queries as $query) {
            $str1 = substr($query, 0, 1);
            if ($str1 != '#' && $str1 != '-')
                $ret[$num] .= $query;
        }
        $num++;
    }
    return $ret;
}

function _dir_path($path) {
    $path = str_replace('\\', '/', $path);
    if (substr($path, -1) != '/')
        $path = $path . '/';
    return $path;
}

// 获取客户端IP地址
function get_client_ip() {
    static $ip = NULL;
    if ($ip !== NULL)
        return $ip;
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
        $pos = array_search('unknown', $arr);
        if (false !== $pos)
            unset($arr[$pos]);
        $ip = trim($arr[0]);
    }elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (isset($_SERVER['REMOTE_ADDR'])) {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    // IP地址合法验证
    $ip = (false !== ip2long($ip)) ? $ip : '0.0.0.0';
    return $ip;
}

// 服务器端IP
function get_server_ip(){   
    return gethostbyname($_SERVER["SERVER_NAME"]);   
}  

function dir_create($path, $mode = 0777) {
    if (is_dir($path))
        return TRUE;
    $ftp_enable = 0;
    $path = dir_path($path);
    $temp = explode('/', $path);
    $cur_dir = '';
    $max = count($temp) - 1;
    for ($i = 0; $i < $max; $i++) {
        $cur_dir .= $temp[$i] . '/';
        if (@is_dir($cur_dir))
            continue;
        @mkdir($cur_dir, 0777, true);
        @chmod($cur_dir, 0777);
    }
    return is_dir($path);
}

function dir_path($path) {
    $path = str_replace('\\', '/', $path);
    if (substr($path, -1) != '/')
        $path = $path . '/';
    return $path;
}

function sp_password($pw, $pre){
    $decor = md5($pre);
    $mi = md5($pw);
    return substr($decor,0,12).$mi.substr($decor,-4,4);
}

function sp_random_string($len = 8) {
    $chars = array(
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
            "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
            "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
            "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
            "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
            "3", "4", "5", "6", "7", "8", "9"
    );
    $charsLen = count($chars) - 1;
    shuffle($chars);    // 将数组打乱
    $output = "";
    for ($i = 0; $i < $len; $i++) {
        $output .= $chars[mt_rand(0, $charsLen)];
    }
    return $output;
}
// 递归删除文件夹
function delFile($dir,$file_type='') {
    if(is_dir($dir)){
        $files = scandir($dir);
        //打开目录 //列出目录中的所有文件并去掉 . 和 ..
        foreach($files as $filename){
            if($filename!='.' && $filename!='..'){
                if(!is_dir($dir.'/'.$filename)){
                    if(empty($file_type)){
                        unlink($dir.'/'.$filename);
                    }else{
                        if(is_array($file_type)){
                            //正则匹配指定文件
                            if(preg_match($file_type[0],$filename)){
                                unlink($dir.'/'.$filename);
                            }
                        }else{
                            //指定包含某些字符串的文件
                            if(false!=stristr($filename,$file_type)){
                                unlink($dir.'/'.$filename);
                            }
                        }
                    }
                }else{
                    delFile($dir.'/'.$filename);
                    rmdir($dir.'/'.$filename);
                }
            }
        }
    }else{
        if(file_exists($dir)) unlink($dir);
    }
}
?>