<?php

class CommonAction extends Action {

    function _initialize() {
        //import('ORG.Util.Session');
        // 用户权限检查  
        if (C('USER_AUTH_ON') && !in_array(MODULE_NAME, explode(',', C('NOT_AUTH_MODULE'))) && !in_array(ACTION_NAME, explode(',', C('NOT_AUTH_ACTION')))) {
            import('ORG.Util.RBAC');
            //dump(RBAC :: AccessDecision());
            if (!RBAC :: AccessDecision()) {
                //检查认证识别号  
                if (!$_SESSION[C('USER_AUTH_KEY')]) {
                    if ($this->isAjax()) {
                        $this->ajaxReturn(RBAC :: AccessDecision(), "你没有权限！请联系管理员", 0);
                    } else {
                        //跳转到认证网关  
                        redirect(PHP_FILE . C('USER_AUTH_GATEWAY'));
                    }
                }
            }
        }
    }
}

?>