
<!DOCTYPE html>
<html>
<head>
    <title>结算-瑞秋易果生鲜</title>

    <link rel="shortcut icon" href="http://static01.yiguo.com/cart/images/yiguo.ico" />
    <link href="http://static01.yiguo.com/cart/css/public.css" rel="stylesheet" type="text/css" />
    <link href="http://static01.yiguo.com/cart/css/yg.css" rel="stylesheet" type="text/css" />

    <link href="http://static01.yiguo.com/cart/css/order.css?v=20161019" rel="stylesheet" type="text/css" />
    <link href="http://static01.yiguo.com/cart/js/jqueryui/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="http://static01.yiguo.com/common/msgbox/msgbox.css" rel="stylesheet" type="text/css" />

</head>
<body id="body">
<div class="w">



    <!------- 顶部工具栏 ------->
    <div class="site-nav">
        <div class="wrap">
            <ul class="fl">
                <li>欢迎光临瑞秋易果生鲜！</li>
            </ul>

            <ul class="fr">
                    <#if username?exists>


                        <li id="_logout" ><a href="userlogout" class="logout">[退出]</a></li>
                        <li> &nbsp</li>
                        <li> &nbsp</li>
                        <li> &nbsp</li>
                        <li> &nbsp</li>
                        <li> &nbsp</li>
                        <li> &nbsp</li>
                        <li> &nbsp</li>
                        <li> &nbsp</li>
                        <li></li>

                        <li class="myyiguo">
                            <!--根据session 处理  -->
                            <div class="tit"><a rel="nofollow" href="#"><i></i>我的易果<s></s></a>
                            </div>
                            <div class="con">
                            <#--<li id="_loginname" ><a rel="nofollow" href="#">${username}</a></li>-->
                                <a rel="nofollow" href="myorder">我的订单</a>
                                <a rel="nofollow" href="userlogout" class="logout">退出</a>
                            </div>

                        </li>
                    <#else >

                        <li id="_register" ><a rel="nofollow" href="/foodshop/buyer/register">[注册]</a></li>
                        <li id="_login">
                            <a rel="nofollow" href="/foodshop/buyer/login">[登录]</a>
                        </li>
                    </#if>
            </ul>
        </div>
    </div>

    <!------- 头部 ------->
    <div class="header clearfix">
        <div class="wrap">
        <#--<div class="logo">-->
        <#--<a href="index" target="_blank"></a>-->

        <#--</div>-->
        <#---->
        </div>
    </div>

    <div class="order">
        <div class="wrap">
            <h2>填写核对订单信息</h2>
            <div class="order-alert">
                <!--收货信息-->
                <div id="order1" class="order-mode complete">
                    <h3><i class="o-i-receive"></i>收货信息</h3>
                    <div class="o-order">
                        <div>收货地址：<input id="Address" type="text" class="input" placeholder="必填" maxlength="20"></div>
                    </div>

                </div>

                <!--商品信息-->
                <div id="order5" class="order-mode">
                    <h3>
                        <i class="o-i-commodity"></i>商品信息
                        <a class="backcart" href="/foodshop/buyer/mycart">返回购物车&gt;&gt;</a>
                    </h3>
                    <div class="o-commodity">


                        <table class="table">
                            <thead>
                            <tr>
                                <th width="590">商品名称</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>金额小计</th>
                            </tr>
                            </thead>
                            <tbody>
                                <#list cart.cartfoods?keys  as foodkey>
                                <#assign item = cart.cartfoods?values>
                                    <tr>
                                        <#assign oneprice=foodkey.fprice>
                                        <#assign number=item[foodkey_index]>
                                        <td><a href="fooddetail?fid=${foodkey.fid}">${foodkey.fname}</a>
                                        </td>
                                        <td>￥${foodkey.fprice}</td>
                                        <td>${number}</td>
                                        <td>￥${oneprice*number}</td>
                                    </tr>
                                </#list >
                            </tbody>
                        </table>

                    </div>
                </div>


                <div id="orderPlus" class="order-mode-last">
                    <h3><i class="o-i-order"></i>订货人信息</h3>
                    <div class="o-order">
                        <div>订货人姓名：<input id="OrderUserName" type="text" class="input" placeholder="必填" maxlength="20"></div>
                        <div>订货人手机：<input id="OrderUserMobile" type="text" class="input" placeholder="必填" maxlength="15"></div>
                    </div>
                </div>
                <div class="settle-space"></div>
                <div id="order71" class="cart-footer clearfix settle">
                    <div class="wrap">
                        <div class="right">
                            <span class="none">商品金额：<em>￥</em><em>${cart.totalprice}</em>元</span>
                            <span class="fs14">应付款：<em>￥</em><em>${cart.totalprice}</em></span>
                            <a id="btnOrderSubmit"  class="btn">提交订单</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>



    <script src="http://static01.yiguo.com/control/jquery-1.7.2-min.js"></script>
    <script src="http://static01.yiguo.com/common/common.js?v20151204"></script>
    <script src="http://static01.yiguo.com/common/stats.js?v20151204"></script>

</div>


<script type="text/javascript" src="http://static01.yiguo.com/cart/js/open-shut.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/tab.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/modal.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/common/util.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/order.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/common/global-v2.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/common/msgbox/msgbox.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/jquery.validate.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/jquery.tmpl.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/jquery.jTemplates.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/orderCity.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/orderProcess.js?v=2017020901"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cps/cpsOrder.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/orderController.js"></script>



<script src="http://static01.yiguo.com/common/o_code.js?v20160908"></script>
</body>

<script type="text/javascript">


    $("#btnOrderSubmit").click(function () {

        console.log("提交点击");
        var address = $("#Address").val();
        var get_phone = $("#OrderUserMobile").val();
        var get_name = $("#OrderUserName").val();

        if(address == ""){
            console.log('地址为空');
            alert("地址为空")
        }else if(get_phone==""){
            alert("请输入正确的手机号")
        }else if(get_name==""){
            alert("收货人姓名为空")

        }else {
            var phone = $("#OrderUserMobile").val();
            if( /^1[3|4|5|7|8][0-9]{9}$/ig.test(phone)){
                console.log(phone);

                //请求后台数据库 查询用户是否已经注册
                $.ajax({
                    url:"http://localhost:8080/foodshop/api/count",
                    type: 'POST',
                    async: false,
                    data: {"address":address,"getName":get_name,"getPhone":get_phone},
                    timeout: 3000,
                    dataType: 'json',
                    success: function(data){
                        console.log(data['code']);
                        console.log("创建订单信息成功");
                        if(data['code']=='801'){

                            self.location = "pay?oid="+data['oid'];
                        }
                    },
                    error:function () {
                        alert("错误")
                    }
                })




            }else {
                alert("请输入正确的手机号")
            }


        }




    })






</script>
</html>
