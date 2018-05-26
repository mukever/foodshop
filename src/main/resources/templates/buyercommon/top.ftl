<!------- 顶部工具栏 ------->
        <div class="site-nav">
        <div class="wrap">
            <ul class="fl">
                <li><a href="/foodshop/buyer/index">欢迎光临瑞秋易果生鲜！</a></li>

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
                            <div class="tit"><a rel="nofollow" href="#" ><i></i>我的易果<s></s></a>
                            </div>
                            <div class="con">
                            <#--<li id="_loginname" ><a rel="nofollow" href="#">${username}</a></li>-->
                                <a rel="nofollow" href="myorderlist">我的订单</a>
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



        <!------- 头部 ------->
        <div class="header clearfix">
            <div class="wrap">
                <div class="logo">
                    <a href="index.ftl"></a>
                </div>
                <!--搜索 开始-->
                <div class="search" style="position:relative;">
                    <div class="search-bar clearfix">
                        <input type="text" id="keyword" name="keyword" class="search-input" value="输入商品名／编号／拼音" onfocus=" if (this.value == '输入商品名／编号／拼音') {this.value = '';this.style.color = '#000';} " onblur=" if (this.value == '') {this.value = '输入商品名／编号／拼音';this.style.color = '#999';} " style="color: rgb(153, 153, 153);">
                        <input class="search-btn" type="submit" value="搜索">
                    </div>
                    <ul class="hide" id="shelper" style="display: none;"></ul>
                    <div class="search-keywords" id="keywords">
                        <script id="keywordstpl" type="text/x-handlebars-template">
                            {{#KeyWords}}
                            {{#equal IsImportant true}}
                            <a href="{{Link}}" class="hot" target="_blank">{{Text}}</a>
                            {{else}}
                            <a href="{{Link}}" target="_blank">{{Text}}</a>
                            {{/equal}}
                            {{/KeyWords}}
                        </script>
                    </div>
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