<?php
class FeiyinAction extends CommonAction{

    function index() {
        $this->display();
    }
    
    public function getAllData()
    {
        $n = D("feiyin");
        import("ORG.Util.Page"); //导入分页类
        $page = $_POST["page"];
        $rows = $_POST["rows"];
        $sort = $_POST["sort"];
        $order = $_POST["order"];
        //dump($order);
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
}
?>
