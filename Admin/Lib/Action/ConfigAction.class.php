<?php

class ConfigAction extends CommonAction {

    public function index() {
        $this->display();
    }
    //保存config的值
    public function SetValue()
    {
        //网站标题
        C('SITE_NAME',$_POST['title']);
        
        //关键字
        C('SITE_KEYWORDS',$_POST['keywords']);
        
        //网站描述
        C('SITE_DESCRIPTION',$_POST['description']);
        
        //网站备案
        C('ICP_NUM',$_POST['icp']);
        
        //统计代码
        C('CNZZ',$_POST['cnzz']);
        
        $this->ajaxReturn($_POST, '更新成功！', 1);
    }
}
?>
