
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
   <#include "../buyercommon/header.ftl">
    <link href="/foodshop/css/buyer/detail/product_detail.css?v20161110" rel="stylesheet" type="text/css">
</head>
<body id="body">
<div class="w">

   <#include "../buyercommon/top.ftl">


    <div class="header-nav">
        <div class="wrap">
                <#include "../buyercommon/wrap.ftl">

        </div>
    </div>


    <div class="wrap">
        
        <!--产品详情-->
        <div class="content clearfix">
            <div class="product-intro clearfix j_product">
                <!--预览图-->
                <div class="pic-preview">
                    <div class="pic-big">
                        <img class="j_product_img" width="500" height="500" src="${(foodInfo.fimage)!""}" style="display:  block;">

                    </div>

                </div>
                <div class="product-info">
                    <div class="summary-name">
                        <h1>${foodInfo.fname}</h1>
                        <p>${(foodInfo.fdescription)!""}</p>
                    </div>
                    <div class="summary-price clearfix">
                        <div class="pro-price">
                            <div>
                                <span>价格：</span>
                                <span><em>¥</em><strong>${(foodInfo.fprice)!""}</strong></span>
                            </div>
                        </div>
                    </div>
                    <div class="summary-other clearfix">
                        <div class="left">
                            <div class="pro-amount clearfix">
                                <div class="dt">数量：</div>
                                <div class="dd">
                                    <div class="spinner">
                                        <button class="decrease">-</button>
                                        <input type="text" class="spinner value" id="p_number" maxlength="2",value="1">
                                        <button class="increase">+</button>
                                    </div>
                                    <div class="addcart"><a class="btn-gn"  id="addToCarD"><i></i>加入购物车</a></div>
                                    <input type="input" hidden id="fid" name="fid" value="${foodInfo.fid}" >

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
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

<script src="/foodshop/js/buyer/jquery.cookie.js?v20150427"></script>
<script src="/foodshop/js/buyer/handlebars-v3.0.1.js"></script>
<script src="/foodshop/js/buyer/utaste.js"></script>
<script src="/foodshop/js/buyer/base.js"></script>
<script src="/foodshop/js/buyer/jquery.superslide.js"></script>
<script src="/foodshop/js/buyer/sidebar.js"></script>
<script src="/foodshop/js/buyer/global-v2.js"></script>
<script src="/foodshop/js/buyer/search.js?v20150427"></script>
<script src="/foodshop/js/buyer/app.js?v20160816"></script>
<script src="/foodshop/js/buyer/common.js?v20150427"></script>
<script src="/foodshop/js/buyer/util.js?v20150427"></script>


<script src="/foodshop/js/buyer/detail/product_detail.js?v20170410"></script>
<script src="/foodshop/js/buyer/detail/jquery.spinner.js?v20150427"></script>

<script src="/foodshop/js/buyer/detail/jquery.lazyload.min.js"></script>


<script src="/foodshop/js/buyer/stats.js?v20170410"></script>

<script type="text/javascript">

    $("#p_number").val(1);
    $("#fid").val(${foodInfo.fid});


    //添加购物车
    $("#addToCarD").click(function () {

        var number = parseInt($("#p_number").val());
        var fid_ = GetQueryString('fid');
        console.log(fid_);
        $.ajax({
            url:"/foodshop/api/addtocart",
            method:"post",
            data:{'fid':fid_,'number':number},
            success:function(data){
               console.log(data);
               if(data['code']==601){
                   self.location='login';
               }else {
                   self.location.reload()
               }
            },
            error:function () {
                self.location='login';
            }
        })
    });


    $(".increase").click(function(){
        var valnum = parseInt($("#p_number").val())+ 1;
        $("#p_number").val(valnum);
    });
    $(".decrease").click(function(){
        var valnum = parseInt($("#p_number").val()) - 1;
        if(valnum >= 1){
            $("#p_number").val(valnum);
        }
    });

    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
</script>
</body>
</html>