
<!DOCTYPE html>

<html>
<head>
    <title>易果生鲜_支付跳转</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="水果，进口水果，国产水果，易果网" />
    <meta name="Description" content="易果网是全国最大的专业精品水果网之一，从事高品质水果及健康食品销售，提供各类进口水果，国产水果，以专业便捷的配送服务让易果迅速布遍全国各地，使您第一时间品尝到最优质最新鲜的水果。电话：400-820-8251,800-820-8251" />
    <link rel="shortcut icon" href="http://static01.yiguo.com/utaste/images/yiguo.ico" />
    <link href="http://static01.yiguo.com/cart/css/public.css" rel="stylesheet" type="text/css">
    <link href="http://static01.yiguo.com/cart/css/yg.css" rel="stylesheet" type="text/css">
    <link href="http://static01.yiguo.com/cart/css/PickUpCard.css" rel="stylesheet" type="text/css">
    <script>
        yg_x = new Date();
    </script>

</head>
<body id="body">
<div class="w">
    <!------- 头部 ------->
    <div class="header clearfix">
        <div class="wrap">
            <div class="logo"><a></a></div>
        </div>
    </div>
    <div class="wrap">
        <div class="content">

                <div class="main PickUpCard ConfirmPay w1200">
                    <div class="c">
                        <dl>
                            <dt><i class="i1"></i>即将为您打开支付页面</dt>
                            <dd>
                                <ul>
                                    <li><span>订单编号：${orderDto.oid}</span><span>应付金额：<b class="price">￥ ${(orderDto.oamount)!"0.00"}</b></span></li>
                                    <li><span>送 货 至：${orderDto.bname}   ${orderDto.baddress}  </span></li>
                                </ul>
                                <a class="btn-org j_paybtn" id="PayBtn">立即支付</a>
                                <span class="fs12 mt10">倒计时结束时自动打开支付页面，如果未跳转，请点击按钮。</span>
                            </dd>
                            <input type="hidden" name="OrderPaymentNum" class="j_payonlineNum" value="30" />
                            <input type="hidden" name="SerialNumber" id="SerialNumber" value="${orderDto.oid}" />
                            <input type="hidden" name="TotalPrice" class="j_totalPrice" value="${(orderDto.oamount)!"0.00"}" />

                        </dl>
                    </div>
                </div>

        </div>
    </div>


    <script src="http://static01.yiguo.com/control/jquery-1.7.2-min.js"></script>
    <script src="http://static01.yiguo.com/common/common.js?v20151204"></script>
    <script src="http://static01.yiguo.com/common/stats.js?v20151204"></script>

</div>
<script src="http://static01.yiguo.com/control/jquery-1.7.2-min.js"></script>
<script src="http://static01.yiguo.com/common/util.js"></script>
<#--<script src="http://static01.yiguo.com/cart/js/orderrush.js"></script>-->

<script src="http://static01.yiguo.com/common/o_code.js?v20160908"></script>
</body>

<script type="text/javascript">


   $("#PayBtn").click(function () {
       //用户主动点击
        console.log("用户点击");
       toRedirect();

   })


   function toRedirect() {
       //开始支付

       console.log("点击支付");

       var oid = $("#SerialNumber").val()

       console.log(oid);

       var hr = 'http://127.0.0.1:8080/foodshop/api/pay?oid='+oid;

       window.location.href =hr;

   }



</script>
</html>
