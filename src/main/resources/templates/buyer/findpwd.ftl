<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>易果网</title>
    <link rel="shortcut icon" href="Content/img/yiguo.ico" />
    <script src="Content/jquery.js"></script>

    <link href="Content/public.css" rel="stylesheet"/>

    
    <link href="Content/themes.css" rel="stylesheet"/>

    <script src="Content/tab.js"></script>

    <script src="Content/FormValidate.js"></script>

    <script type="text/javascript">
        $(function () {
            //手机易果
            $('.mobile .mobile-tit').wrap('<div class="mobile-tit-w"></div>');
            $('.mobile').hover(function () {
                $(this).addClass('mobile-hover');
            }, function () {
                $(this).removeClass('mobile-hover');
            });

            Form.VC = '有无效字符，请重新输入'
        });
    </script>

    <!--IE6png兼容-->
    <!--[if IE 6]>
    <script src="/Content/DD_belatedPNG.js"></script>
    <script src="/Content/IE6png.js"></script>
    <![endif]-->
    <script src="Content/script/topdsp.js"></script>
</head>


<body id="body">
    <!------- 顶部工具栏开始 ------->
    <div class="w">

        <!------- 顶部工具栏结束 ------->
        <link href="Content/ForgetPw.css" rel="stylesheet"/>


<script type="text/javascript">

    $(function () {

        $("#UserName").blur(function () {
            return UserNameValited();
        })

        $("#VerifyCode").blur(function () {
            return VerifyCodeValited();
        })

        $("#btnSubmit").click(function () {

            if (UserNameValited() == false)
                return false;

            if (VerifyCodeValited() == false)
                return false;

            $("form").submit();
        })

        $(".gray").click(function () {
            $("#imgcode").attr("src", "/verifycode" + "?_t=" + new Date().getTime());
        })
    })

    function UserNameValited() {
        $("#UserName").next("span").removeClass();

        if ($.trim($("#UserName").val()) == '') {
            $("#UserName").next("span").addClass("pass-tip").html("<i></i>请输入您的手机号或邮箱");
            return false;
        }
        else {
            $("#UserName").next("span").html("");
        }

        if (Form.Validate($("#UserName").val())) {
            $("#UserName").next("span").addClass("pass-tip").html("<i></i>" + Form.VC);
            return false;
        }

        return true;
    }

    function VerifyCodeValited() {
        $("#VerifyCode").nextAll("span").removeClass();

        if ($.trim($("#VerifyCode").val()) == '') {
            $("#VerifyCode").nextAll("span").addClass("pass-tip").html("<i></i>请输入验证码");
            return false;
        }
        else {
            $("#VerifyCode").nextAll("span").html("");
        }

        if (Form.Validate($("#VerifyCode").val())) {
            $("#VerifyCode").nextAll("span").addClass("pass-tip").html("<i></i>" + Form.VC);
            return false;
        }

        return true;
    }

    function ShowErrorTip(key, content) {
        $(key).nextAll("span").removeClass().addClass("pass-error").html("<i></i>" + content);
    }



</script>

<form action="FindPwd.html" method="post">    <div class="header clearfix">
        <div class="wrap">
            <div class="logo">
                <a href="http://www.yiguo.com" target="_blank"></a>
                <a href="#body" target="_blank" class="l2 goTop"></a>
                <span class="h-tit">账号安全验证</span>
            </div>
        </div>
    </div>
    <div class="forget-pwd">
        <div class="wrap clearfix">

            <h2 class="f-step f-step1">输入账号</h2>

            <p>
                <span class="field-name">手机号或邮箱</span>

                    <input type="text" id="UserName" name="UserName" class="input input-user" placeholder="请输入您的手机号或邮箱" value="" />

                <span></span>
            </p>
            <p>
                <span class="field-name">验证码</span>

                <input type="text" id="VerifyCode" name="VerifyCode" class="input input-yzm" placeholder="验证码" />
                <img src='verifycode-_t=636620754993777972.gif' id="imgcode" onclick="this.src=this.src" />
                <a href="javascript:void(0)" class="gray">换一张</a>
                <span></span>
            </p>
            <div class="center">
                <a id="btnSubmit" href="javascript:void(0)" class="btn-green btn-green-l">下一步</a>
            </div>
        </div>
    </div>
</form>


        <!------- 页尾开始 ------->
        <div class="footer">
            <div class="wrap">
                <dl class="col1">
                    <dt>新手指南</dt>
                    <dd>
                        <p><a href="http://www.yiguo.com/help/registersteps.html">账户注册</a></p>
                        <p><a href="http://www.yiguo.com/help/gouwuliucheng.html">购物流程</a></p>
                        <p><a href="http://www.yiguo.com/help/ordering.html">订购方式</a></p>
                        <p><a href="http://www.yiguo.com/help/ubremark.html">悠币说明</a></p>
                                <p><a href="http://www.yiguo.com/activity/sale/2999">会员等级</a></p>

                    </dd>
                </dl>
                <dl class="col2">
                    <dt>付款方式</dt>
                    <dd>
                        <p><a href="http://www.yiguo.com/help/payment.html">支付方式</a>/<a href="http://www.yiguo.com/help/invoiceremark.html">发票说明</a></p>
                        <p><a href="http://www.yiguo.com/help/chongzhiliucheng.html">充值说明</a>/<a href="http://www.yiguo.com/help/usechuzhika.html">储值卡说明</a></p>
                        <p><a href="http://www.yiguo.com/help/usegiftcard.html">优惠代码/礼品卡说明</a></p>
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
                    <p>沪ICP备09008015号 Copyright © 2005-2018 <a href="http://www.yiguo.com/">上海易果电子商务有限公司</a>版权所有</p>
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
        <!------- 页尾结束 ------->

    </div>
    <script src="Content/script/o_code.js"></script>
</body>

<script type="text/javascript">
    $(document).ready(function () {
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
    });
</script>

</html>
