
<!DOCTYPE html>
<html>
<head>
    <title>购物车-瑞秋易果生鲜</title>

    <link rel="shortcut icon" href="http://static01.yiguo.com/cart/images/yiguo.ico" />
    <link href="/foodshop/css/buyer/public.css" rel="stylesheet" type="text/css" />
    <link href="/foodshop/css/buyer/index/customer.css" rel="stylesheet" type="text/css">
    <link href="/foodshop/css/buyer/index/pageguide.css" rel="stylesheet" type="text/css">
    <link href="/foodshop/css/buyer/mycart/yg.css" rel="stylesheet" type="text/css" />

    <link href="/foodshop/css/buyer/mycart/cart.css" rel="stylesheet" type="text/css" />


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
                                <a rel="nofollow" href="#">我的订单</a>
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


    <div class="popout dazhaxie" style="display: none;">
        <div class="popout-wrap">
            <div class="popout-con">
                <a class="close" onclick="$('.dazhaxie').hide()">×</a>
                <div class="con">
                    <p>大闸蟹类商品仅限APP购买，立即扫描二维码下载APP享受更多优惠</p>
                    <p><img src="http://static01.yiguo.com/cart/images/header/qrcode_app.jpg"></p>
                    <a class="btn" href="http://img02.yiguo.com/mobapp/appdownload.html" target="_blank">立即下载</a>
                </div>
            </div>
        </div>
        <div class="popout-bg"></div>
    </div>

    <div id="theLogin" class="popout p-login" style="display:none;">
        <div class="popout-wrap">
            <div class="popout-con">
                <div class="title" style="margin-bottom:40px;">登    录<a class="close" href="javascript:void()"></a></div>

                <iframe src="https://login.yiguo.com/login/SimIndex?Url=http://cart.yiguo.com/ShopCart/RedirectToOrder" id="dialogIframe" name="dialogIframe" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" style="border: 0px; width: 100%; height: 79%;"></iframe>
            </div>
        </div>
        <div class="popout-bg">&nbsp;</div>
    </div>
    <!-------  我的购物车 ------->
    <div class="cart">
        <div class="wrap">
            <h2>
                我的购物车

                <a class="on-shopping" href="index">继续购物 &gt; &gt;</a>
            </h2>
            <div class="cart-alert">
                <div class="cart-header">
                    <table class="cart-table">
                        <tbody>
                        <tr>
                            <th class="cart-t-info">商品信息</th>
                            <th class="cart-t-price">单价</th>
                            <th class="cart-t-num">购买数量</th>
                            <th class="cart-t-total">合计</th>
                            <th class="cart-t-opera">操作</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="cart-list" id="theInsulationCan">



                    <table class="cart-table">
                        <tbody>

                            <#list cart.cartfoods?keys  as foodkey>
                                <#assign item = cart.cartfoods?values>
                                <tr>
                                    <#assign oneprice=foodkey.fprice>
                                    <#assign number=item[foodkey_index]>
                                    <td class="cart-t-img"><a href="fooddetail?fid=${foodkey.fid}"><img src="${(foodkey.fimage)!""}"></a></td>
                                    <td class="cart-t-info"><a href="fooddetail?fid=${foodkey.fid}">${foodkey.fname}</a></td>
                                    <td class="cart-t-ub" style="width:75px;"></td>
                                    <td class="cart-t-price">￥${foodkey.fprice}</td>
                                    <td class="cart-t-price"><span>${number}</span></td>


                                    <td class="cart-t-total">￥<span>${oneprice*number}</span></td>
                                    <td class="cart-t-opera">
                                        <a href="mycartdelete?fid=${foodkey.fid}">删除</a>
                                    </td>
                                </tr>
                            </#list>

                        </tbody>
                    </table>
                    <#--<div id="theCart" style="display:none;">-->
                        <#--<span id="theTotalUB">0</span>-->
                        <#--<span id="theTotalPrice">59.00</span>-->
                    <#--</div>-->

                </div>
                <div class="settle-space"></div>
                <div class="cart-footer clearfix settle">
                    <div class="wrap">

                        <div class="fr">

                            <span class="fs14">总价：<em>￥<span>${cart.totalprice}</span></em></span>
                            <input id="SelectedCommIds" name="SelectedCommIds" type="hidden" value="" />

                            <a href="/foodshop/buyer/order" class="btn" id="btnSubmit" name="btnSubmit" style="cursor:pointer;">去结算</a>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <style>
        i {
            background-image: none;
        }
    </style>
    <script type="text/javascript">

        var nowDate = new Date();
        var nowTime = nowDate.getFullYear() + "-" + (nowDate.getMonth() + 1) + "-" + nowDate.getDate();
        var endTime = "2017-5-15";
        if (ToDate(nowTime) >= ToDate(endTime)) {
            $('.col1 .ml5').hide();
        }

        function ToDate(str) {
            var arr = str.split("-");
            var newDate = new Date(arr[0], arr[1], arr[2]);
            return newDate;
        }
    </script>
</div>

<script src="http://static01.yiguo.com/cart/js/jquery.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/common/global-v2.js?v20161208"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/tab.js"></script>
<script type="text/javascript" src="http://static01.yiguo.com/cart/js/CartController.js?v20161208"></script>
<script type="text/javascript">


</script>


<script src="http://static01.yiguo.com/common/common.js?v20150427"></script>
<script src="http://static01.yiguo.com/common/stats.js?v20150427"></script>
<script src="http://static01.yiguo.com/www/js/city.js?v20160816"></script>
<script src="http://static01.yiguo.com/www/js/app.js?v20160816"></script>
</body>
</html>
