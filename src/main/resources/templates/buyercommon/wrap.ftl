<!--商品分类 开始-->

            <div class="catalogs">

                <div class="catalogs-title"><a href="javascript:;">全部商品分类▼</a></div>
                <div class="catalogs-list" style="display:none">

                        <#list catagoryBeanList as catagoryBean>

                            <div class="item">
                                <h3 class="t01_channelhome"><a href="/foodshop/buyer/foodlist?ctype=${catagoryBean.ctype}"><i></i>${catagoryBean.cname}</a></h3>
                                <div class="sub-item">
                                    <h4><a href="/foodshop/buyer/">${catagoryBean.cname}</a></h4>
                                    <div class="sub-list">
                                        <if (catagoryBean.foodInfos)??>
                                                <#list catagoryBean.foodInfos as food>
                                                      <a href="/foodshop/buyer/fooddetail?fid=${food.fid}" target="_blank">${food.fname}</a>
                                                </#list>
                                        </if>

                                    </div>


                                </div>
                            </div>
                        </#list>
                </div>
                <!--商品分类 结束-->
            </div>