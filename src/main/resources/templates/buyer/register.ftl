<!DOCTYPE html>
<html>
<head>

    <title>易果网</title>
    <link rel="shortcut icon" href="/foodshop/images/buyer/yiguo.ico" />
    <script src="/foodshop/js/buyer/jquery/2.1.1/jquery.min.js"></script>

    <link href="/foodshop/css/buyer/login/public.css" rel="stylesheet"/>

    
    <link href="/foodshop/css/buyer/login/themes.css" rel="stylesheet"/>

    <link href="/foodshop/css/buyer/login/register-v20161205.css" rel="stylesheet"/>

</head>


<body id="body">
    <div class="w">




<div class="header clearfix">
    <div class="wrap">
        <div class="logo">
            <a href="index" ></a>
            <span class="h-tit">注册</span>
        </div>
    </div>
</div>
<form action="#" method="post">
    <div class="register">
        <div class="wrap">
            <div class="tabbable">

                <div class="tab-content">
                    <div class="tab-pane active clearfix" id="tab1">
                        <div class="fl">

                            <p>
                                <span class="field-name">手机号</span>
                                <input class="input input-phone" id="Phone_Mobile" name="Phone_Mobile" placeholder="请输入您的手机号" type="text" value="" />
                                <span></span>
                            </p>

                            <p>
                                <span class="field-name">设置密码</span>
                                <input class="input input-key" id="Phone_Password" name="Phone_Password" placeholder="6-20位字母、符号或数字" type="password" />
                                <span></span>
                            </p>
                            <p>
                                <span class="field-name">确认密码</span>
                                <input class="input input-key" id="Phone_ConfimPassword" name="Phone_ConfimPassword" placeholder="再次输入密码" type="password" />
                                <span></span>
                            </p>

                                <span></span>
                            <p><span class="field-name"></span>
                                <a  class="btn-green-l" href="" id="PhoneReg">立即注册</a>
                            </p>
                        </div>
                        <div class="fr">
                            <div class="rimg"><img src="http://img06.yiguoimg.com/e/web/161205/01853/142855/register.png" /></div>
                           
                            
                        </div>
                    </div>
                </div>
                <div class="right">                    
                    我已经注册，现在就 <a class="orange" href="login">登录</a>
                    
                </div>
            </div>
        </div>
    </div>


</div>
</body>
<script type="text/javascript">

        var mobile = true;  //全局变量
        var psd = true;  //全局变量
        var repsd = true;  //全局变量
        //手机号验证
        $("#Phone_Mobile").on("blur",function(){
            var phone = $("#Phone_Mobile").val();
            if( /^1[3|4|5|7|8][0-9]{9}$/ig.test(phone)){

                var status = false;
                //请求后台数据库 查询用户是否已经注册
                $.ajax({
                    url:"http://localhost:8080/foodshop/api/checkusername",
                    type: 'POST',
                    async: false,
                    data: {"username":phone},
                    timeout: 3000,
                    dataType: 'json',
                    success: function(data){
                        console.log(data['code']);
                        if(data['code']=='101'){
                            status = true;
                        }
                    },
                    error:function () {
                        alert("错误")
                    }
                })
                if(status){
                    // console.log("right");
                    $("#Phone_Mobile").next().html("手机号正确").attr("class","pass-succ");
                    mobile = false;
                }else {
                    $("#Phone_Mobile").next().html("该用户已注册").attr("class","pass-error");
                }

            }else{
                $("#Phone_Mobile").next().html("请输入正确的手机号").attr("class","pass-error");
            }
        });


        //密码验证
        $("#Phone_Password").on("blur",function() {
            var pass = $("#Phone_Password").val();
            if (pass.length < 5 || pass.length > 16) {
                $("#Phone_Password").next().html("密码长度应为5-16位").attr("class", "pass-error");
            } else {
                psd = false;
                $("#Phone_Password").next().html("密码符合要求").attr("class", "pass-succ");
            }
        });


        //密码确认
        $("#Phone_ConfimPassword").on("blur",function(){
            if($("#Phone_Password").val() == ""){
                $("#Phone_ConfimPassword").next().html("请设置密码").attr("class","pass-error");
            }else if($("#Phone_Password").val() == $("#Phone_ConfimPassword").val()){
                $("#Phone_ConfimPassword").attr("isYes","true");
                repsd = false;
                $("#Phone_ConfimPassword").next().html("密码确认正确").attr("class","pass-succ");
            }else{
                $("#Phone_ConfimPassword").next().html("密码确认不正确").attr("class","pass-error");
            }
        })

        //提交
        $("#PhoneReg").click(function(){

            console.log(mobile);
            console.log(psd);
            console.log(repsd);
            if(mobile){
                $("#Phone_Mobile").next().html("请输入正确手机号").attr("class","pass-error");
                console.log("请输入正确手机号");
            }else if(psd){
                $("#Phone_ConfimPassword").next().html("请设置密码").attr("class","pass-error");
                console.log("请设置密码")
            }else if(repsd){
                $("#Phone_ConfimPassword").next().html("密码确认不正确").attr("class","pass-error");
            }else{
                var phone = $("#Phone_Mobile").val();
                var password = $("#Phone_Password").val();
                //check数据以后 提交到后台Controller
                $.ajax({
                    url:"http://localhost:8080/foodshop/api/register",
                    type: 'POST',
                    async: true,
                    data: {"username":phone,'password':password},
                    dataType: 'json',
                    success: function(data){
                        console.log(data['code']);
                        if(data['code']=='301'){
                            alert(data['message']+"正跳转登录")
                            self.location='login';
                        } else{
                            // alert(data['message'])
                        }
                    },
                    error:function () {
                        console.log("error");
                    }
                })


            }
        });

</script>

</html>
