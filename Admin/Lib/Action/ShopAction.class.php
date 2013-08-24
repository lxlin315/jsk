<?php
class ShopAction extends CommonAction {

    function index() {
        $this->display();
    }
    
    public function getAllShop() {
        $n = D("Shop");//实例化
        import("ORG.Util.Page"); //导入分页类
        $page = $_POST["page"];
        $rows = $_POST["rows"];
        $sort = $_POST["sort"];
        $order = $_POST["order"];
        //条件查询
        if ($_POST["name"] != null && $_POST["name"] != "") {
            $condition['account'] = array('like', $_POST["name"]);
        }if ($_POST["createdatetimeStart"] != null && $_POST["createdatetimeStart"] != "") {
            $condition['create_time'] = array('between', $_POST["createdatetimeStart"], $_POST["createdatetimeEnd"]);
        }if ($_POST["modifydatetimeStart"] != null && $_POST["modifydatetimeStart"] != "") {
            $condition['update_time'] = array('between', $_POST["modifydatetimeStart"], $_POST["modifydatetimeEnd"]);
        }
        $count = $n->count(); //计算总数
        $list = $n->where($condition)->page($page, $rows)->order(array($sort => $order))->select();
        $list = json_encode($list);
        $result = '{"total":' . $count . ',"rows":' . $list . '}';
        echo ($result); //输出json数据 
    }
    
    public function getAllData()
    {
        $n = D("Shop");
        import("ORG.Util.Page"); //导入分页类
        $page = $_POST["page"];
        $rows = $_POST["rows"];
        $sort = $_POST["sort"];
        $order = $_POST["order"];
        $count = $n->count(); //计算总数
        //$p = new Page($count,$rows);order($sort+','+$order)->
        $list = $n->relation(true)->order('id asc')->select();
        //$list = $n->select();
        $list = json_encode($list);
        $result = '{"total":' . $count . ',"rows":' . $list . '}';
        echo ($list); //输出json数据   
    }
}
?>
