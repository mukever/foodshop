


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
    <script type="text/javascript">
        var _bdhm_top = 0;
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        var _bdhm_tim = new Image(1, 1);
        _bdhm_tim.id = "bdhmPerimg";
        _bdhm_tim.src = _bdhmProtocol + "hm.baidu.com/_tt.gif?si=36a486fbdec46fc52ca666dd2e98f260&rnd=" + Math.round(Math.random() * 2147483647);
        _bdhm_tim.onload = function () { _bdhm_top = 1; }
    </script>
    <script type="text/javascript">
        yg_x = new Date();
    </script>
    <!-- start Dplus -->
    <script type="text/javascript">!function (a, b) { if (!b.__SV) { var c, d, e, f; window.dplus = b, b._i = [], b.init = function (a, c, d) { function g(a, b) { var c = b.split("."); 2 == c.length && (a = a[c[0]], b = c[1]), a[b] = function () { a.push([b].concat(Array.prototype.slice.call(arguments, 0))) } } var h = b; for ("undefined" != typeof d ? h = b[d] = [] : d = "dplus", h.people = h.people || [], h.toString = function (a) { var b = "dplus"; return "dplus" !== d && (b += "." + d), a || (b += " (stub)"), b }, h.people.toString = function () { return h.toString(1) + ".people (stub)" }, e = "disable track track_links track_forms register unregister get_property identify clear set_config get_config get_distinct_id track_pageview register_once track_with_tag time_event people.set people.unset people.delete_user".split(" "), f = 0; f < e.length; f++) g(h, e[f]); b._i.push([a, c, d]) }, b.__SV = 1.1, c = a.createElement("script"), c.type = "text/javascript", c.charset = "utf-8", c.async = !0, c.src = "//w.cnzz.com/dplus.php?token=1915ef989c5aence66fa", d = a.getElementsByTagName("script")[0], d.parentNode.insertBefore(c, d) } }(document, window.dplus || []), dplus.init("1915ef989c5aence66fa");</script><!-- end Dplus -->
    <script src="http://static01.yiguo.com/common/topdsp.js"></script>
</head>
<body id="body">


<div class="w">
    <!------- 顶部工具栏 ------->



    <div class="site-nav">
        <div class="wrap">
            <ul class="fl">
                <li>欢迎光临易果生鲜！</li>
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
            <div class="logo">
                <a href="http://www.yiguo.com"></a>
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
                                <li><a href="myorder">我的订单</a></li>
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

                                    <div>


                                </td>
                                <td class="amount" width="140">${orderDto.oamount}</td>
                                <td width="140">

                                    ${orderDto.getOrderStatusEnum().message}

                                </td>
                                <td width="140" class="operate">
                                    <#if orderDto.getOrderPayStatus().code == 0>
                                        <div>
                                            <a class="btn-org" href="pay?oid=${orderDto.oid}">立即支付</a>
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

            <!--选择取消原因弹框-->
            <div class="popup popup1" style="display:none;">
                <div class="popup-wrap popup-middle">
                    <div class="popup-con">
                        <div class="title">取消订单申请 <a href="#" class="close">×</a></div>
                        <div class="con">
                            <div class="reason">
                                <span>取消原因</span>

                                <select name="refundreason" id="refundreason">
                                    <option value="订单信息错误">订单信息错误</option>
                                    <option value="我不想买了">我不想买了</option>
                                    <option value="忘记使用U币/优惠券">忘记使用U币/优惠券</option>
                                    <option value="订单中有商品买错">订单中有商品买错</option>
                                </select>
                                <p class="text"><i class="hint"></i>订单被成功取消后不可恢复，同时该笔订单所使用的优惠券可能将一并取消。</p>
                            </div>
                            <div class="btnbox"><a class="confirm" id="step1" href="javascript:void(0);">下一步</a><a class="cancel close" href="javascript:void(0);">暂不取消</a></div>
                        </div>
                    </div>
                </div>
                <div class="popup-bg">&nbsp;</div>
            </div>

            <!--网银支付宝支付,部分预付款-->
            <div class="popup popup3" style="display:none;">
                <div class="popup-wrap popup-middle">
                    <div class="popup-con">
                        <div class="title">取消订单申请 <a href="#" class="close">×</a></div>
                        <div class="con">
                            <div class="refundbeforeinfo"></div>
                            <div class="btnbox"><a class="confirm" id="step2" href="javascript:void(0);">提交申请</a><a class="cancel close" href="javascript:void(0);">暂不取消</a></div>
                            <div class="explain">
                                <h3>极速退款说明：</h3>
                                <p>
                                    1. 极速退款仅限网银、支付宝在线方式支付，即时退款至预付款余额，目前暂不支持其他支付方式；<br>
                                    2. 极速退款已退至账户余额后的金额，目前暂不支持退款；<br>
                                    3. 账户内金额不可用于购买储值卡、提货券等虚拟卡券类商品；<br>
                                    4. 如需开具发票，请完善发票开具信息；开票金额为您实际支付充值金额，不包含赠送金额；<br>
                                    5. 预付款余额有效期：自充值日起至用完即止；<br>
                                    6. 若有其他疑问，可拨打客服电话400-000-7788进行咨询。
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="popup-bg">&nbsp;</div>
            </div>

            <!--等待审核-->
            <div class="popup popup4" style="display:none;">
                <div class="popup-wrap popup-middle">
                    <div class="popup-con">
                        <div class="title">取消订单申请 <a href="#" class="close">×</a></div>
                        <div class="con">
                            <div class="refundstateinfo"></div>
                            <table>

                            </table>
                            <div class="btnbox"><a class="confirm close" href="javascript:void(0);">好，我知道了</a><a href="http://www.yiguo.com/help/quicknessrefund.html" class="know">了解极速退款</a></div>
                        </div>
                    </div>
                </div>
                <div class="popup-bg">&nbsp;</div>
            </div>

            <script id="OrderRefundBefore" type="text/x-handlebars-template">
                <p class="txt1">您当前的订单已支付总额：<span class="price">{{totalAmunt}}</span>元</p>
                <p class="txt2">合计退款总额：<span>{{totalAmunt}}</span>元</p>
                {{#if isHasBalanceRefund}}
                <p class="txt3">预付款余额：<span>{{balanceRefundAmunt}}</span>元</p>
                <p class="txt5">退款方式：原支付方式退回，审核通过后即时到账！</p>
                {{/if}}
                {{#if isOnlineRefund}}
                <p class="txt3">{{onlinePayName}}：<span>{{onlineRefundAmunt}}</span>元</p>
                <p class="txt4" onclick="$(this).find('i').addClass('active'); $(this).siblings('.txt4').find('i').removeClass('active');"><i class="active" title="0"></i>原支付方式退回，审核成功后约1-15个工作日到账！</p>
                {{#compare totalAmunt '<=' 3000}}
                <p class="txt4" onclick="$(this).find('i').addClass('active');$(this).siblings('.txt4').find('i').removeClass('active');"><i title="1"></i>极速退款至预付款余额，即时到帐！ <span class="rec">[推荐]</span></p>
                {{/compare}}
                {{/if}}

            </script>

            <script id="OrderRefundState_Info" type="text/x-handlebars-template">
                {{#equal State 1}}
                <p class="txt1">您的取消订单申请已提交，预计2个工作日内完成审核，请耐心等待！</p>
                {{/equal}}
                {{#equal State 2}}
                <p class="txt"><i></i>您的退款申请已审核通过！</p>
                <p class="txt1">网银/支付宝退款预计1~15个工作日到账，具体以支付渠道的退款到账为准！</p>
                {{/equal}}
                {{#if isOnlineRefund}}
                <div class="information clearfix">
                    <p class="infor1">退款编号：<span class="num">{{RefundOrderNumber}}</span></p>
                    <p class="infor2">订单编号：<span class="num">{{SerialNumber}}</span></p>
                </div>
                <div class="information clearfix">
                    <p class="infor1">申请时间：<span class="num">{{ApplyDate}}</span></p>
                    <p class="infor2">退款原因：<span class="num">{{RefundReasons}}</span></p>
                </div>
                {{else}}
                <div class="information clearfix">
                    <p class="infor1">订单编号：<span class="num">{{SerialNumber}}</span></p>
                </div>
                <div class="information clearfix">
                    <p class="infor1">申请时间：<span class="num">{{ApplyDate}}</span></p>
                </div>
                {{/if}}
            </script>

            <script id="RefundAmunt_Info" type="text/x-handlebars-template">
                <tr>
                    <th>支付方式</th>
                    <th>退款方式</th>
                    <th>退款金额</th>
                    <th>合计退款金额</th>
                </tr>
                {{#if isHasBalanceRefund}}
                <tr>
                    <td>账户余额</td>
                    <td>原支付方式退回</td>
                    <td><span>￥{{balanceRefundAmunt}}</span></td>
                    <td rowspan="2"><span>￥{{TotalAmunt}}</span></td>
                </tr>
                {{/if}}
                {{#if isOnlineRefund}}
                <tr>
                    <td>{{onlinePayName}}</td>
                    <td>{{RefundTypeName}}</td>
                    <td>
                        <span>￥{{onlineRefundAmunt}}</span>
                    </td>
                    {{#unless isHasBalanceRefund}}
                    <td rowspan="2"><span>￥{{TotalAmunt}}</span></td>
                    {{/unless}}
                </tr>
                {{/if}}
            </script>





        </div>

    </div>

    <!------- 页尾 ------->
    <style>
        i {
            background-image: none;
        }
    </style>
    <div class="footer">
        <div class="wrap">
            <dl class="col1">
                <dt>新手指南</dt>
                <dd>
                    <p><a href="http://www.yiguo.com/help/registersteps.html">账户注册</a></p>
                    <p><a href="http://www.yiguo.com/help/gouwuliucheng.html">购物流程</a></p>
                    <p><a href="http://www.yiguo.com/help/ordering.html">订购方式</a></p>
                    <p><a href="http://www.yiguo.com/help/ubremark.html">悠币说明</a></p>
                    <p><a href="http://www.yiguo.com/activity/sale/2998">会员等级<i class="ml5"><img src="http://img06.yiguoimg.com/e/web/170315/00941/154425/icon-new.png"></i></a></p>

                </dd>
            </dl>
            <dl class="col2">
                <dt>付款方式</dt>
                <dd>
                    <p><a href="http://www.yiguo.com/help/payment.html">支付方式</a></p>
                    <p><a href="http://www.yiguo.com/help/chongzhiliucheng.html">充值说明</a></p>
                    <p><a href="http://www.yiguo.com/help/usegiftcard.html">优惠代码/礼品卡说明</a>
                    <p><a href="http://www.yiguo.com/help/cardbuynotes.html">卡券购买章程</a></p>
                </dd>
            </dl>
            <dl class="col3">
                <dt>配送方式</dt>
                <dd>
                    <p><a href="http://www.yiguo.com/help/sendyuefei.html">配送运费</a></p>
                    <p><a href="http://www.yiguo.com/help/sendquyu.html">配送范围</a></p>
                    <p><a href="http://www.yiguo.com/help/sendtime.html">配送时间</a></p>
                </dd>
            </dl>
            <dl class="col4">
                <dt>售后服务</dt>
                <dd>
                    <p><a href="http://www.yiguo.com/help/tuihuanhuoshuoming.html">退换货政策</a></p>
                    <p><a href="http://www.yiguo.com/help/huanhuolc.html">退换货流程</a></p>
                    <p><a href="http://www.yiguo.com/help/qa.html">常见问题</a></p>
                    <p><a href="http://home.yiguo.com/Trade/Advice">投诉与建议</a></p>
                    <p><a href="http://www.yiguo.com/help/quicknessrefund.html">极速退款</a></p>
                </dd>
            </dl>
            <dl class="col5">
                <dt>关于我们</dt>
                <dd>
                    <p><a href="http://www.yiguo.com/help/introduction.html">公司介绍</a></p>
                    <p><a href="http://www.yiguo.com/help/contact.html">联系我们</a></p>
                    <p><a href="http://www.yiguo.com/help/procooperation.html">业务合作</a></p>
                    <p><a href="http://www.yiguo.com/help/chengxinjubao.html">诚信举报</a></p>
                    <p><a href="http://yiguo.zhiye.com/home" target="_blank" rel="nofollow">人才招聘</a></p>

                </dd>
            </dl>
            <div class="service"><span>客服热线 400-000-7788</span><span>周一至周日 9:00-21:00</span></div>
            <div class="copyright">
                <p>所有图片均受著作权保护，未经许可任何单位与个人不得使用、复制、转载、摘编，违者必究法律责任。</p>
                <p>版权所有<a href="http://www.yiguo.com/">上海易果电子商务有限公司</a>  2005-2018 Copyright @ 2005-2018 _www.yiguo.com, All rights reserved 沪ICP备09008015号<br><br></p>
                <p class="authentication">
                    <a href="http://www.yiguo.com/legal" target="_blank" rel="nofollow"><img src="http://img07.yiguoimg.com/d/web/171208/00652/173249/153685368061665897_121x29.png"></a>
                    <a href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110512114405424" target="_blank"><img src="http://img03.yiguo.com/images/footer_copy.gif" width="47px" height="47px"></a>
                    <a href="https://180.169.127.46:9090/?sn=310100102001">
                        <img src="http://img02.yiguo.com/e/web/150623/00841/170532/picp_bg.png" alt="»¦¹«θ±¸" border="0">
                        <span>310100102001</span>
                    </a>
                </p>
            </div>
        </div>
    </div>






    <!--yiguoStats-->
    <script type="text/javascript">
        var _yaq = _yaq || [];
        _yaq.push(['_operate', 'view']);
        _yaq.push(['_site', 'Utaste']);
        _yaq.push(['categoryid', '']);
        _yaq.push(['behaviorid', '']);
        _yaq.push(['behavior', '']);

        (function () {
            var ya = document.createElement('script'); ya.type = 'text/javascript'; ya.async = true;
            ya.src = "http://tracker.yiguo.com/Scripts/yiguoStats.min.js";
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ya, s);
        })();

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
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-20131478-1']);
        _gaq.push(['_setDomainName', 'yiguo.com']);
        _gaq.push(['_setSiteSpeedSampleRate', 50]);
        _gaq.push(['_addOrganic', 'baidu', 'word']);
        _gaq.push(['_addOrganic', 'soso', 'w']);
        _gaq.push(['_addOrganic', 'youdao', 'q']);
        _gaq.push(['_addOrganic', 'so.360.cn', 'q']);
        _gaq.push(['_addOrganic', 'sogou', 'query']);
        _gaq.push(['_setCampNameKey', 'n']);
        _gaq.push(['_setCampSourceKey', 's']);
        _gaq.push(['_setCampMediumKey', 'm']);
        _gaq.push(['_setCampTermKey', 'k']);
        _gaq.push(['_setCampContentKey', 'c']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
    <div style="display: none">
        <script type="text/javascript">
            var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
            document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F36a486fbdec46fc52ca666dd2e98f260' type='text/javascript'%3E%3C/script%3E"));
        </script>
    </div>
    <!------- 侧边悬浮 ------->
    <div class="sidebar" id="sidebar">
        <a href="javascript:void(0);"></a>
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
<script src="http://static01.yiguo.com/www/js/app.js?v20160816"></script>
<script src="http://static01.yiguo.com/common/common.js?v=20150922"></script>
<script src="http://yunwang.yiguo.com/Scripts/static/js/chat.js"></script>

<script src="http://static01.yiguo.com/common/util.js?v=20150922"></script>
<script src="http://static01.yiguo.com/www/js/city.js?v20160816"></script>


<script src="http://static01.yiguo.com/utaste/js/myorder.js"></script>
<script src="http://static01.yiguo.com/utaste/js/orderRefund.js"></script>

<script>
    $(function () {
        app.initLayout("/Handler/InitLayOut");
        // app.changecity();
        app.referCart();
        app.logout(".logout");
    });
</script>

</body>
</html>