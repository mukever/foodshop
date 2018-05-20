
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="/foodshop/css/buyer/login-Type" /foodshop/css/buyer/login="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" /foodshop/css/buyer/login="width=device-width, initial-scale=1.0">
    <title>瑞秋易果</title>
    <link rel="shortcut icon" href="/foodshop/images/buyer/img/yiguo.ico" />
    <script src="/foodshop/js/buyer/jquery/2.1.1/jquery.min.js"></script>

    <link href="/foodshop/css/buyer/login/public.css" rel="stylesheet"/>


    <link href="/foodshop/css/buyer/login/login-v20161205.css" rel="stylesheet" type="text/css" />

    <link href="/foodshop/css/buyer/login/themes.css" rel="stylesheet"/>

</head>


<body id="body">
<!------- 顶部工具栏开始 ------->
<div class="w">

    <!------- 顶部工具栏结束 ------->


    <div class="header clearfix">
        <div class="wrap">
            <div class="logo">
                <#--<a href="http://www.yiguo.com" target="_blank"></a>-->
                    <#--<a href="index.ftl" target="_blank"></a>-->
                    <imge="/foodshop/log.png"></imge>
                <span class="h-tit">登录</span>
            </div>
        </div>
    </div>


    <form action="index" method="post">
        <div class="login">
            <div class="wrap clearfix">
                <div class="fl"><a href='index' target='_blank'><img width='666' height='418' src='http://img05.yiguoimg.com/e/others/151217/9288691196862353.jpg'></a></div>
                <div class="fr">
                    <p class="right"></p>
                    <div class="login-main">
                        <p><strong>欢迎登录</strong><span>还没有账号？<a class="green" href="register">立即注册</a></span></p>

                        <div id="msg-wrap"><div> </div></div>

                        <p>
                            <span class="input-phone-icon">&nbsp;</span><input class="input input-phone" id="UserName" name="UserName" placeholder="手机" type="text" value="" />
                        </p>
                        <p><span class="input-key-icon">&nbsp;</span><input class="input input-key" id="Pwd" name="Pwd" placeholder="密码" type="password" /></p>
                        <p> <span><a class="gray" href="findpwd"></a> </span></p>
                        <p><a id="btnLogin" href="javascript:void(0)" class="btn-green-l">登 &#160; 录</a></p>

                       </div>
                </div>
            </div>
    </div>
    </form>


</div>
<script src="/foodshop/js/buyer/login/script/o_code.js"></script>
</body>
<script type="text/javascript">

    //提交
    $("#btnLogin").click(function(){

        var username = $("#UserName").val();
        var password = $("#Pwd").val();

        if(username==""){
            $("#msg-wrap").show().html("用户名不能为空");
        }else if(password ==""){
            $("#msg-wrap").show().html("密码不能为空");
        }else {
            //check数据以后 提交到后台Controller
            $.ajax({
                url: "http://localhost:8080/foodshop/api/login",
                type: 'POST',
                async: true,
                data: {"username": username, 'password': password},
                dataType: 'json',
                success: function (data) {
                    console.log(data['code']);
                    if (data['code'] != 401) {
                        $("#msg-wrap").show().html("用户名登录失败");
                    } else {
                        self.location = 'index';

                    }
                },
                error: function () {
                    console.log("error");
                }

            });

        }
    });






</script>

</html>
