<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="uedroot" value="${pageContext.request.contextPath}/template/default"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>已关闭详情</title>
<%@include file="/inc/inc.jsp" %>
<script type="text/javascript">
	var pager;
	(function () {
		seajs.use('app/jsp/order/closeOrder', function (demopagePager) {
			pager = new demopagePager({element: document.body});
			pager.render();
		});
	})();
</script>
</head>
<body>
      <div class="row"><!--外围框架-->
            <div class="col-lg-12"><!--删格化-->
                <div class="row"><!--内侧框架-->
                    <div class="col-lg-12"><!--删格化-->
                        <div class="main-box clearfix"><!--白色背景-->
                        	<div class="main-box-body clearfix">	<!--padding20-->
							<div class="form-label">
					           	<ul>
					               
					                <li  class="col-md-6">
					                    <p class="word">订单类型：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.ordertypename}</p>
					                </li>  
					                 <li  class="col-md-6">
					                    <p class="word">订单来源：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.chlidname}</p>
					                </li>
					            </ul>  
					               <ul>
					                <li  class="col-md-6">
					                    <p class="word">父订单号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.orderid}</p>
					                </li>
					            </ul> 
					  	</div>
					  	 <!--table表格-->
                                <div class="table-responsive">
                                    <table class="table table-hover table-border table-bordered">
                                        <thead>
                                            <tr>
                                            	<th>商品</th>
                                                <th>单价/数量</th>
                                                <th>下单时间</th>
                                                <th>订单状态</th>
                                            </tr>
                                        </thead>                                                                                                
                                    <tbody>
						               <c:forEach items="${orderDetail.prodList}" var="sp">
								          <tr>
								                 <td class="sp"  width="45%">
								                      <table width="100%" border="0">
								                         <tr>
								                             <td><img src="${sp.imageUrl}"></td>
								                             <td class="word"><a href="#">${sp.prodName}</a></td>	
								                         </tr>
								                      </table>
								                 </td>
								                <td>${sp.prodSalePrice}元/${sp.buySum}件</td>
								                <td><fmt:formatDate value="${orderDetail.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								                <td>${orderDetail.statename}</td>
							              </tr>
							            </c:forEach> 							           						       						           
                                    </tbody>
                                    </table>
                                </div>
                            <!--/table表格结束-->
                            <div class="nav-tplist-title bd-bottom pb-10  pt-15">
			                  <ul>
			                    <li>买家信息</li>
			                  </ul>
				            </div>
                            <div class="form-label">
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">买家：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.username}
					                    	<input type="hidden" id="userId" value="${orderDetail.userid}"/>
					                    </p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">手机号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.contacttel}</p>
					                </li>
					            </ul>  
					            <ul>
					             	<li  class="col-md-6">
					                    <p class="word">配送方式：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.logisticstype}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">收货地址：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.address}&nbsp;${orderDetail.contactname}&nbsp;${orderDetail.contacttel}</p>
					                </li>
					            </ul>
					            <ul>
					            	 <li  class="col-md-6">
					                    <p class="word">买家留言：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.remark}</p>
					                </li>
					            </ul>
					  		</div>
                        </div>	
                     </div>
                </div>
              </div> 
          </div>
    </div>
</body>
</html>