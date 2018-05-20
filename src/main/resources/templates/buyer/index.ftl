<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <#include "../buyercommon/header.ftl">



</head>
<body id="body">
    <div class="w">

  <#include "../buyercommon/top.ftl">


    <div class="header-nav">
        <div class="wrap">
                <#include "../buyercommon/wrap.ftl">

        </div>
    </div>

    <!------- 轮播广告 ------->

    <div class="banner-slider">
        <ul class="b-slider">
                    <li style="background:#efefef;" >
                        <a href="index" >
                            <div class="slider-wrap">
                                <span class="banner-text">
                                    <img height="500" />
                                </span>
                            </div>
                            <div class="banner-main" style="background:url('http://img06.yiguoimg.com/d/others/180515/9288723024258223.jpg')"></div>
                        </a>
                    </li>
                    <li style="background:#efefef;"  _title="自古美人爱荔枝（华北）">
                        <a href="http://www.yiguo.com/activity/sale/fruit083" target="_blank">
                            <div class="slider-wrap">
                                <span class="banner-text">
                                    <img height="500" />
                                </span>
                            </div>
                            <div class="banner-main" style="background:url('http://img05.yiguoimg.com/d/others/180423/9288722026341527.jpg')"></div>
                        </a>
                    </li>

        </ul>
        <div class="b-btn">
            <a class="prev" href="javascript:void(0)"></a>
            <a class="next" href="javascript:void(0)"></a>
        </div>
        <div class="b-dot">
            <ul></ul>
        </div>
    </div>

    <!------- 商品楼层 ------->

    <div class="floor wrap 01_channelhome clearfix loadfloor" id="t01_channelhome">

        <div class="floor-title ">
            <h2>最新上架</h2>
            <span class="keyword">
    </span>
        </div>
        <div class="floor-con floor-layout2">
            <div>
                <ul>
                    <if (catagoryBean.foodInfos)??>
                        <#list hotfoods as food>
                            <li>
                                <a href="fooddetail?fid=${food.fid}">
                                    <img src="${(food.fimage)!""}"
                                         width="230" height="230">
                                </a>
                            </li>
                        </#list>
                    </if>
                </ul>
            </div>
        </div>
    </div>
    <!------- 底部 ------->
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

    <!------- 页尾 ------->
    <div class="footer">
        <div class="wrap">
            <div class="copyright">
                <p>所有图片均受著作权保护，未经许可任何单位与个人不得使用、复制、转载、摘编，违者必究法律责任。</p>
                <p class="authentication">
                    <a href="http://www.yiguo.com/legal" target="_blank" rel="nofollow"><img src="http://img07.yiguoimg.com/d/web/171208/00652/173249/153685368061665897_121x29.png"></a>
                    <a href="http://shwg.dianping.com/index.html" target="_blank" rel="nofollow"><img src="http://img05.yiguoimg.com/e/web/160420/01632/141253/2517491005058doc.png" height="47"></a>
                </p>
            </div>
        </div>
    </div>


    <script src="/foodshop/js/buyer/jquery.cookie.js?v20150427"></script>
    <script src="/foodshop/js/buyer/handlebars-v3.0.1.js"></script>
    <script src="/foodshop/js/buyer/utaste.js"></script>
    <script src="/foodshop/js/buyer/base.js"></script>
    <script src="/foodshop/js/buyer/jquery.superslide.js"></script>
    <script src="/foodshop/js/buyer/sidebar.js"></script>
    <script src="/foodshop/js/buyer/floor-guide.js"></script>
    <script src="/foodshop/js/buyer/global-v2.js"></script>
    <script src="/foodshop/js/buyer/search.js"></script>
    <script src="/foodshop/js/buyer/city.js"></script>
    <script src="/foodshop/js/buyer/app.js"></script>
    <script src="/foodshop/js/buyer/common.js"></script>
    <script src="/foodshop/js/buyer/util.js"></script>
    <script src="/foodshop/js/buyer/stats.js"></script>
    
    
</body>
</html>