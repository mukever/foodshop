


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>易果生鲜_全球精选</title>
    <meta name="Keywords" content="水果，进口水果，国产水果，易果网" />
    <meta name="Description" content="易果生鲜Yiguo网是专业的进口生鲜水果食品网络购物平台，为您精选全球3001多种生鲜果蔬品质食材，在体验网上购物新模式的同时享尽各国新鲜美味，易果网是您悠悦生活的品质之选。" />
    <meta property="qc:admins" content="15753240576117576375" />
    <link rel="shortcut icon" href="http://static01.yiguo.com/common/images/yiguo.ico" />
    <link href="http://static01.yiguo.com/utaste/css/public.css?v=v20160816" rel="stylesheet" type="text/css">

    <link href="http://static01.yiguo.com/utaste/css/yg.css?v=20150922" rel="stylesheet" type="text/css">
    <link href="http://static01.yiguo.com/utaste/css/search.css?v=20150922" rel="stylesheet" type="text/css">
    <script src="http://static01.yiguo.com/control/jquery-1.7.2-min.js?v20150427"></script>
    <link href="http://static01.yiguo.com/utaste/css/returns.css" rel="stylesheet" type="text/css">

    <link href="http://static01.yiguo.com/utaste/css/yg.css?v=20150922" rel="stylesheet" type="text/css">
    <link href="http://static01.yiguo.com/utaste/css/myorder.css" rel="stylesheet" type="text/css">

    <link href="http://static01.yiguo.com/utaste/css/themes.css?v=20150922" rel="stylesheet" type="text/css">

</head>
<body id="body">


<div class="w">
    <!------- 顶部工具栏 ------->



    <div class="site-nav">
        <div class="wrap">
            <ul class="fl">
                <li>欢迎光临瑞秋易果生鲜！</li>
                <!--送货城市 开始-->

                <!--送货城市 结束-->
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
                                <a rel="nofollow" href="myorderlist">我的订单</a>
                                <a rel="nofollow" href="userlogout" class="logout">退出</a>
                            </div>

                        </li>
                    <#else>
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
            <div class="logo">
                <a href="index.ftl"></a>
            </div>
            <!--购物车 开始-->

            <div class="shopping-cart">
                <dl>

                    <dt class="shopping-btn"><a href="mycart">
                            <span class="totleNum">
                                <b>
                                ${(cart.all_number)!"0"}

                                </b>
                            </span>
                        <b class="totlePrice">
                            ¥ ${(cart.totalprice)!"0"}

                        </b></a></dt>

                </dl>
            </div>
            <!--购物车 结束-->
        </div>
    </div>
    <!--商品分类 开始-->
    <div class="header-nav">
        <div class="wrap">
            <!--商品分类 开始-->
         <#include "../buyercommon/wrap.ftl">
            <!--商品分类 结束-->

        </div>
    </div>
    <div class="wrap">
        <!--面包屑-->
        <div class="crumbs"><a class="ml0" href="index">首页</a>&gt;<a href="myorder" class="j_ygnav">我的易果</a><span class="j_thridcrumbs hide">&gt;<a href="javascript:void(0)" class="on j_thirdnav"></a></span></div>
        <div class="content myyg">
            <div class="sub">
                <div class="menu j_menu">
                    <dl>
                        <dt>交易信息</dt>
                        <dd>
                            <ul>
                                <li><a href="myorderlist">我的订单</a></li>
                            </ul>
                        </dd>
                    </dl>
                </div>
                <div>
                    <div class="ad" style="height: 308px;">
                        <a href="#"  style="display: none"><img src="http://static01.yiguo.com/utaste/images/ad.jpg" width="194" height="308"></a>
                    </div>
                </div>
            </div>




            <div class="main myorder">
                <div class="title">
                    我的订单
                </div>
                <div class="order-table j_Loading" id="allorderlst">
                    <div class="order-list-head clearfix">
                        <span class="w520">订单信息</span>

                        <span class="w140">实付金额</span>
                        <span class="w140">订单状态</span>
                        <span class="w140">操作</span>
                    </div>
                    <div class="order-list-body">
                        <ul class="j_allorderli"></ul>
                    </div>
                </div>
                <!--页码 开始-->
                <div class="paging j_active" id="j_pages">
                </div>
                <!--页码 结束-->
                    <#list orderDtoPage.content as orderDto>
                    <li>
                        <table class="order-list j_product">
                            <thead>
                            <tr>
                                <th colspan="4"><div><span>订单号：${orderDto.oid}</span><span>提交时间：${orderDto.ocreatetime}</span></div></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td width="520" class="all-goods">

                                    <div class="m">

                                        收货人姓名：${orderDto.bname}
                                        <br/>
                                        收货人手机号：${orderDto.bphone}
                                        <br/>
                                        收货地址：${orderDto.baddress}

                                        <br/>
                                    </div>
                                    <div class="m">
                                         <#assign  detail = orderDto.orderDetailsList>
                                        <#list detail as food>
                                         <img src="${(food.fimage)!""}" width="40" height="40" class="j_product_img">
                                         商品名称:   ${food.fname}

                                         商品数量：  ${food.fquantity}

                                         商品单价:￥   ${food.fprice}
                                         <br/>
                                        </#list>


                                    </div>

                                    <div>
                                </td>
                                <td class="amount" width="140">${orderDto.oamount}</td>
                                <td width="140">

                                    ${orderDto.getOrderStatusEnum().message}

                                </td>
                                <td width="140" class="operate">
                                    <#if orderDto.getOrderPayStatus().code == 0 && orderDto.getOrderStatusEnum().code==0>
                                        <div>
                                            <a class="btn-org" href="pay?oid=${orderDto.oid}">立即支付</a>
                                        </div>
                                        <#elseif orderDto.getOrderStatusEnum().code==2>
                                                <div>
                                                    订单被取消，无法支付
                                                </div>
                                        <#else>
                                        <div>
                                            支付完成
                                        </div>
                                    </#if>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </li>
                    </#list>
            </div>



        </div>

    </div>

</div>
<script src="http://static01.yiguo.com/utaste/js/handlebars-v3.0.1.js"></script>
<script src="http://static01.yiguo.com/control/jquery.superslide.js"></script>
<script src="http://static01.yiguo.com/utaste/js/utaste.js?v20160519"></script>
<script src="http://static01.yiguo.com/utaste/js/sidebar.js"></script>
<script src="http://static01.yiguo.com/control/jquery.scrollLoading-min.js"></script>

<script src="http://static01.yiguo.com/utaste/js/search.js?v20150427"></script>
<script src="http://static01.yiguo.com/common/global-v2.js"></script>
<script src="http://static01.yiguo.com/utaste/js/base.js"></script>
<script src="http://static01.yiguo.com/common/common.js?v=20150922"></script>
<script src="http://static01.yiguo.com/common/util.js?v=20150922"></script>

<script src="http://static01.yiguo.com/utaste/js/orderRefund.js"></script>


</body>
</html>