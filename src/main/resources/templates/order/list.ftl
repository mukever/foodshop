<html>
<#include "../common/header.ftl">
</head>
    <body>
    <div id="wrapper" class="toggled">
       <#-- 边栏-->
           <#include "../common/nav.ftl"></include>
        <#--主要内容-->
        <div id="page-content-wrapper">
           <div class="container-fluid">
               <div class="row clearfix">
                   <div class="col-md-12 column">
                       <table class="table table-bordered table-hover table-condensed">
                           <thead>
                           <tr  bgColor=#E6E6FA>
                               <th>订单id</th>
                               <th>收货人姓名</th>
                               <th>收货人手机号</th>
                               <th>收货人地址</th>
                               <th>用户</th>
                               <th>金额</th>
                               <th>订单状态</th>
                               <#--<th>支付宝订单号</th>-->
                               <th>支付状态</th>
                               <th>创建时间</th>
                               <th colspan="2">操作</th>

                           </tr>
                           </thead>
                           <tbody>
             <#list orderDtoPage.content as orderDto>
             <tr>
                 <td>${orderDto.oid}</td>
                 <td>${orderDto.bname}</td>
                 <td>${orderDto.bphone}</td>
                 <td>${orderDto.baddress}</td>
                 <td>${orderDto.bnickname}</td>
                 <td>${orderDto.oamount}</td>
                 <td>${orderDto.getOrderStatusEnum().message}</td>
                 <#--<td>${(orderDto.trade_no)!"用户未支付"}</td>-->
                 <td>${orderDto.getOrderPayStatus().message}</td>
                 <td>${orderDto.ocreatetime}</td>
                 <td> <a href="/foodshop/seller/order/detail?oid=${orderDto.oid}"> 详情</a></td>
                 <td>
                            <#if orderDto.getOrderStatusEnum().message=="新订单">
                                <a href="/foodshop/seller/order/cancel?oid=${orderDto.oid}"> 取消</a>
                            </#if>
                 </td>
             </tr>
             </#list>
                           </tbody>
                       </table>

                   </div>
               <#--分页-->
                   <div class="col-md-12 column">
                       <ul class="pagination pull-right">
                   <#if currentPage lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                   <#else>
                        <li><a href="/foodshop/seller/order/list?page=${currentPage - 1}&size=${size}">上一页</a></li>
                   </#if>

                    <#list 1..orderDtoPage.getTotalPages() as index>
                        <#if currentPage == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/foodshop/seller/order/list?page=${index}&size=${size}">${index}</a></li>
                        </#if>
                    </#list>

                    <#if currentPage gte orderDtoPage.getTotalPages()>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/foodshop/seller/order/list?page=${currentPage + 1}&size=${size}">下一页</a></li>
                    </#if>
                       </ul>
                   </div>
               </div>
           </div>
        </div>
    </div>

</body>
</html>