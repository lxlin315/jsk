<?php

// 本类由系统自动生成，仅供测试用途
class LayoutAction extends CommonAction {

    public function menu() {
        $menu = M("node");
        $id = $_POST["id"];
        if ($id == null || "" . equals($id)) {
            //$list=$menu->select();
            $con['level'] = array(
                'elt',
                2
            );
            $con['ismenu'] = 1;
            $list = $menu->where($con)->select();
            //$list=$list["0"];attributes
            //$list['info'] = 'info';
            //dump($list);
            //$this->ajaxReturn($list,"没有id",1);
            $list = json_encode($list);
            //$list.put('state','open');
            echo $list; //输出json数据 
        } else {
            $list = $menu->where('pid=' + $id)->select();
            //$this->ajaxReturn($list,"有id",1);
        }
    }

    //左边导航菜单
    public function west() {
        if (session(C('ADMIN_AUTH_KEY'))) {
            $node = D('Node')->where("level=2 and ismenu=1 and status=1")->order('sort')->relation(TRUE)->select(); 
            //dump($_SESSION['_ACCESS_LIST']);
            //dump($node);
        } else {
            //取出所有节点
            $node = D('Node')->where("level=2 and ismenu=1 and status=1")->order('sort')->relation(TRUE)->select();
            //dump($_SESSION['_ACCESS_LIST']);
            //取出当前登录用户的所有模块权限（英文名称）和操作权限（ID）
            $module = ''; //模块权限
            $node_id = ''; //操作权限
            $accessList = $_SESSION['_ACCESS_LIST'];
            foreach ($accessList as $key => $value) {
                foreach ($value as $key1 => $value1) {
                    $module = $module . ',' . $key1;//获取所有模块权限
                    foreach ($value1 as $key2 => $value2) {
                        $node_id = $node_id . ',' . $value2;//获取所有操作权限
                    }
                }
            }
            //去除不存在的操作权限
            foreach ($node as $key => $value) {
                if (!in_array(strtoupper($value['name']), explode(',', $module))) {
                    unset($node[$key]);
                } else {
                    //模块存在，比较里面的操作
                    foreach ($value['node'] as $key1 => $value1) {
                        if (!in_array($value1['id'], explode(',', $node_id))) {
                            unset($node[$key]['node'][$key1]); //一层一层下来删除此操作
                        }
                    }
                }
            }
        }
        $this->assign('node', $node);
        $this->display();
    }
    
    public function east()
    {
        $this->display();
    }

    // 后台首页 查看系统信息
    public function main() {
        $info = array(
            '操作系统' => PHP_OS,
            '运行环境' => $_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式' => php_sapi_name(),
            'ThinkPHP版本' => THINK_VERSION . ' [ <a href="http://thinkphp.cn" target="_blank">查看最新版本</a> ]',
            '上传附件限制' => ini_get('upload_max_filesize'),
            '执行时间限制' => ini_get('max_execution_time') . '秒',
            '服务器时间' => date("Y年n月j日 H:i:s"),
            '北京时间' => gmdate("Y年n月j日 H:i:s", time() + 8 * 3600),
            '服务器域名/IP' => $_SERVER['SERVER_NAME'] . ' [ ' . gethostbyname($_SERVER['SERVER_NAME']) . ' ]',
            '剩余空间' => round((@disk_free_space(".") / (1024 * 1024)), 2) . 'M',
            'register_globals' => get_cfg_var("register_globals") == "1" ? "ON" : "OFF",
            'magic_quotes_gpc' => (1 === get_magic_quotes_gpc()) ? 'YES' : 'NO',
            'magic_quotes_runtime' => (1 === get_magic_quotes_runtime()) ? 'YES' : 'NO',
        );
        $this->assign('info1', $info);
        // dump($info);
        $this->display();
    }

    //注册用户提交处理  
    public function add() {
        $m = D("user");
        if (!$m->create($_POST)) {
            $this->ajaxReturn($m->getError(), '创建对象失败', 3);
        } else {
            if ($result = $m->add($_POST)) {
                $this->ajaxReturn($_POST, '添加成功！', 1);
            } else {
                $this->ajaxReturn($m->getError(), '添加失败！', 0);
            }
        }
    }    
}

?>