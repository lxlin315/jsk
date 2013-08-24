<?php

$siteconfig = require './siteconfig.php';
$config = array(
    'DB_TYPE' => 'mysql',
    'DB_HOST' => 'localhost',
    'DB_NAME' => 'jsk_thinkphp',
    'DB_USER' => 'root',
    'DB_PWD' => '123456',
    'DB_PORT' => '3306',
    'DB_PREFIX' => '',
    
    'SHOW_PAGE_TRACE' => 1, //是否显示页面TRACE信息
    'SHOW_ERROR_MSG' => true, //显示错误信息
    'TMPL_ACTION_ERROR' => 'Public:error', // 默认错误跳转对应的模板文件
    'TMPL_ACTION_SUCCESS' => 'Public:success', // 默认成功跳转对应的模板文件
    'USER_AUTH_ON' => true,
    'USER_AUTH_TYPE' => 2, // 默认认证类型 1 登录认证 2 实时认证
    'USER_AUTH_KEY' => 'authId', // 用户认证SESSION标记
    'RBAC_SUPERADMIN'=>'admin',//超级管理员名称，对应用户表中某一用户名
    'ADMIN_AUTH_KEY' => 'administrator',//超级管理员识别号
    'USER_AUTH_MODEL' => 'User', // 默认验证数据表模型
    'AUTH_PWD_ENCODER' => 'md5', // 用户认证密码加密方式
    'USER_AUTH_GATEWAY' => '/Public/login', // 默认认证网关
    'NOT_AUTH_MODULE' => 'Public', // 默认无需认证模块
    'NOT_AUTH_ACTION' => 'checkLogin,logout', // 默认无需认证操作
    'REQUIRE_AUTH_MODULE' => '', // 默认需要认证模块
    'REQUIRE_AUTH_ACTION' => '', // 默认需要认证操作
    'GUEST_AUTH_ON' => false, // 是否开启游客授权访问
    'GUEST_AUTH_ID' => 0, // 游客的用户ID
    
    //'DB_LIKE_FIELDS'=>'title|remark',
    'RBAC_ROLE_TABLE' => 'role',
    'RBAC_USER_TABLE' => 'role_user',
    'RBAC_ACCESS_TABLE' => 'access',
    'RBAC_NODE_TABLE' => 'node',
    
);
return array_merge($config, $siteconfig);
?>