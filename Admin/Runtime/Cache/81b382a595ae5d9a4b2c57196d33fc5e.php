<?php if (!defined('THINK_PATH')) exit();?><script type="text/javascript">
    function layout_center_addTab(url, title) {
        layout_center_addTabFun({
            title: title,
            closable: true,
            href: url,
        });
    }
</script>
<div class="easyui-accordion" data-options="fit:true,border:false">
    <?php if(is_array($node)): $i = 0; $__LIST__ = $node;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div title="<?php echo ($vo["title"]); ?>" data-options="iconCls:'icon-house'" class="left_menu">
        <ul>
            <?php if(is_array($vo{'node'})): $i = 0; $__LIST__ = $vo{'node'};if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;?><li>
                <div onclick="layout_center_addTab('__APP__/<?php echo ($sub["name"]); ?>', '<?php echo ($sub["title"]); ?>');"><img src="__PUBLIC__/images/house_go.png" width="16" height="16"/><?php echo ($sub["title"]); ?></div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div><?php endforeach; endif; else: echo "" ;endif; ?>
</div>