<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>进口水果_优质新鲜进口水果在线购买_新鲜水果网上订购_易果生鲜Yiguo官网</title>

    <link rel="shortcut icon" href="/foodshop/images/buyer/yiguo.ico" />
    <link href="/foodshop/css/buyer/public.css" rel="stylesheet" type="text/css">
    <link href="/foodshop/css/buyer/index/customer.css" rel="stylesheet" type="text/css">
    <link href="/foodshop/css/buyer/index/pageguide.css" rel="stylesheet" type="text/css">

    <link href="/foodshop/css/buyer/list/goods_list.css?v20150427" rel="stylesheet" type="text/css">
    <link href="/foodshop/css/buyer/list/product_detail.css?v20150427" rel="stylesheet" type="text/css">
    <link href="/foodshop/css/buyer/list/yiguo.css?v20150427" rel="stylesheet" type="text/css">


    <script src="/foodshop/js/buyer/jquery.js"></script>
</head>
<body id="body">
    <div class="w">
       <#include "../buyercommon/top.ftl">
        


<div class="header-nav">
    <div class="wrap">
        <!--商品分类 开始-->
          <#--<#include "../buyercommon/wrap.ftl">-->
        <!--商品分类 结束-->

    </div>
</div>

<div class="wrap">

    <!--筛选-->
    <div class="select">

    <div class="all clearfix">
        <div class="tit">►所有分类</div>
        <ul>
            <#list allcatagory as catagory>
                <li class=" "><a href="/foodshop/buyer/foodlist?ctype=${catagory.ctype}">${catagory.cname}</a></li>

            </#list>
        </ul>
    </div>



    </div>

    <div class="filter_space"></div>
    <!--商品列表-->
    <div class="goods_list clearfix" _category="01_channelhome" _page="2" _end="false" _maxpage="3">
        <ul>
            <#list foodInfos as foodInfo>
                    <li class="product_item j_product" _type="0" _productid="${foodInfo.fid}">
                        <div class="p_img clearfix">
                            <a href="fooddetail?fid=${foodInfo.fid}">
                                    <img src="${(foodInfo.fimage)!""}" width="290" height="290" class="j_product_img">

                            </a>
                        </div>
                        <div class="p_info clearfix">
                            <div class="p_name"><a href="#">${foodInfo.fname}</a></div>
                            <div class="p_price">
                                <span class="price">
                                    <strong>${foodInfo.fprice}</strong>
                                </span>
                            </div>
                        </div>
                        <div class="p-buy">
                            <span>${foodInfo.fdescription}</span>
                             <a class="btn-buy" href="javascript:;" onclick="G.app.cart.module.addToCart(this,'1391239',1,app.referCart);">加入购物车</a>
                        </div>
                    </li>
            </#list>
        </ul>
    </div>
</div>



        <div class="footer_service">
    <div class="wrap">
        <ul>
            <li class="s1">
                <b>全球精选</b>
                <span>一站式生鲜购物方案</span>
            </li>
            <li class="s2">
                <b>多仓直发</b>
                <span>特有次日达配送服务</span>
            </li>
            <li class="s3">
                <b>源头直采</b>
                <span>精选正宗品质好食材</span>
            </li>
            <li class="s4">
                <b>天天底价</b>
                <span>会员专属优惠购不停</span>
            </li>
        </ul>
    </div>
</div>



    </div>

    <script src="http://static01.yiguo.com/control/jquery.cookie.js?v20150427"></script>
    <script src="http://static01.yiguo.com/utaste/js/handlebars-v3.0.1.js"></script>
    <script src="http://static01.yiguo.com/utaste/js/utaste.js"></script>
    <script src="http://static01.yiguo.com/www/js/base.js"></script>
    <script src="http://static01.yiguo.com/www/js/jquery.superslide.js"></script>
    <script src="http://static01.yiguo.com/www/js/sidebar.js"></script>
    <script src="http://static01.yiguo.com/www/js/floor-guide.js"></script>
    <script src="http://static01.yiguo.com/common/global-v2.js"></script>
    <script src="http://static01.yiguo.com/www/js/search.js?v20150427"></script>
    <script src="http://static01.yiguo.com/www/js/city.js?v20160816"></script>
    <script src="http://static01.yiguo.com/www/js/app.js?v20160816"></script>
    <script src="http://static01.yiguo.com/common/common.js?v20150427"></script>
    <script src="http://static01.yiguo.com/common/util.js?v20150427"></script>

    
</body>
</html>