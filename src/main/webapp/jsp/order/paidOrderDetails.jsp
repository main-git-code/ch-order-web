<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>查询列表</title>
<%@include file="/inc/inc.jsp" %>
<script type="text/javascript">
	var pager;
	(function () {
		seajs.use('app/jsp/order/paidOrderDetails', function (demopagePager) {
			pager = new demopagePager({element: document.body});
			pager.render();
		});
	})();
</script>
<STYLE TYPE="text/css">   
	body {
    	padding-right:0!important;
	}  
</STYLE>  
</head>
<body>
 	<input type="hidden" value="0" id="whetherPrint">
 	<input type="hidden" value="0" id="printType">
      		  <div class="row"><!--外围框架-->
            <div class="col-lg-12"><!--删格化-->
                <div class="row"><!--内侧框架-->
                    <div class="col-lg-12"><!--删格化-->
                        <div class="main-box clearfix"><!--白色背景-->
                        	<div class="main-box-body clearfix">	<!--padding20-->
	                     		 <!--  <div class="form-label">
	                     				<p class="word" ><a id="backPage" href="javascript:void(0)">返回上一级</a>&nbsp;&nbsp;&nbsp;当前位置：订单详细</p>
	                     		</div>-->
							<div class="form-label">
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">订单来源：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.chlidname}</p>
					                </li>
					               	<li  class="col-md-6">
					                    <p class="word">订单类型：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.ordertypename}</p>
					                </li> 
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">仓库ID：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.routeid}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">仓库信息：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.routename }</p>
					                </li>  
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">父订单号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.parentorderid}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">子订单号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.orderid }</p>
					                </li>  
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">支付方式：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.paystylename}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">支付流水号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.externalid }</p>
					                </li>  
					            </ul>
					  	</div>
	                <!--步骤结束-->
					  	 	<!--table表格-->
                                <div class="table-responsive">
                                    <table class="table table-hover table-border table-bordered">
                                        <thead>
                                            <tr>
                                            	<th>商品</th>
                                                <th>单价/数量</th>
                                                <th>售后</th>
                                                <th>下单时间</th>
                                                <th>订单状态</th>
                                                <th>优惠券</th>
                                                <th>消费积分</th>
                                                <th>赠送积分</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>                                                                                                
                                    <tbody>
						              <c:forEach var="prod" items="${orderDetail.prodList}" varStatus="status">
							          <tr>
							                 <td class="sp"  width="45%">
							                      <table width="100%" border="0">
							                         <tr>
							                             <td><img src="${prod.imageUrl}"></td>
							                             <td class="word"><a href="#">${prod.prodName}</a></td>	
							                         </tr>
							                      </table>
							                 </td>
							                <td>${prod.prodSalePrice}元/${prod.buySum }件</td>
							                <td>${orderDetail.busicodename }</td>
							                <td><fmt:formatDate value="${orderDetail.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							                <td>${orderDetail.statename }</td>
							                <td>${prod.prodCouponFee }</td>
							                <td>${prod.jfFee }</td>
							                <td>${prod.giveJF}</td>
							                <td>
							                	<c:choose>
											       <c:when test="${prod.cusServiceFlag eq 'Y'}">
											  		  <button class="biu-btn btn-blue btn-small  radius"  data-toggle="modal" onclick="pager._afterorderdetail('${orderDetail.orderid }','${prod.skuId}')">售后详情</button>
											       </c:when>
											       <c:otherwise>
													 <button class="biu-btn btn-blue btn-small  radius"  data-toggle="modal" data-target="#myModal${status.index}">售后</button>
											       </c:otherwise>
												</c:choose>
							                </td>
						              </tr> 
						              
				 <!-- 模态框（Modal） -->
				 <div class="modal fade" id="myModal${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							 <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								 <h4 class="modal-title" id="myModalLabel${status.index}">
									售后处理
								</h4>
							</div>  
							 <div class="modal-body text-center">
							 <br/>
						  		 <button class="biu-btn btn-blue btn-small  radius" data-dismiss="modal"
						  		 data-toggle="modal" data-target="#backModal${status.index}">退货</button> 
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="biu-btn btn-blue btn-small  radius" data-dismiss="modal" 
								data-toggle="modal" data-target="#refundModal${status.index}">退款</button>
								<br/><br/>
							</div> 
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div> 
				
				
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="backModal${status.index}" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="backModalLabel${status.index}">
							退货提示
						</h4>
					</div>
					<div class="modal-body">
						 <p class="center">
							<h5 class="word">确定进行退货处理吗?</h5> 
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal"
						onclick="pager._backOrder('${prod.prodDetalId}','${prod.buySum }')">
							确认
						</button>
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal">取消
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="refundModal${status.index}" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h5 class="modal-title" id="refundModalLabel${status.index}">
							退款提示
						</h5>
					</div>
					 <div class="modal-body">
						<p class="center">
							<h5 class="word">确认进行退款处理吗?</h5> 
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal"
						onclick="pager._refundOrder('${prod.prodDetalId}','${prod.buySum }')">
							确认
						</button>
						<button type="button" class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" data-dismiss="modal">取消
						</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
						
			 </c:forEach>
                                    </tbody>
                                    </table>
                               
                                </div>
                            <!--/table表格结束-->
                             <div class="text-r right">
                            	<ul class="mt-20">
                            		<li>
                            			 <p class="word">总优惠金额：<span class="red">${orderDetail.ordDiscountFee}</span></p>
                            		</li>
                            		<li>
                            			 <p class="word">运费：<span class="red">${orderDetail.ordFreight}</span></p>
                            		</li>
                            		<li>
                            			 <p class="word">订单应付金额：<span class="red">${orderDetail.ordAdjustFee}</span></p>
                            		</li>
                            	</ul>
                            </div>
                            <div class="nav-tplist-title bd-bottom pb-10  pt-15">
				                  <ul>
				                    <li>买家信息</li>
				                  </ul>
				       		</div>
                            <div class="form-label">
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">买家账号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.username}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">收货人：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.contactname}</p>
					                </li>
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">手机号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.contacttel }</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">收货地址：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.provincecode}${orderDetail.citycode }${orderDetail.countycode}
					                    ${orderDetail.address }&nbsp;${orderDetail.contactname}&nbsp;${orderDetail.contacttel}</p>
					                </li>
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">买家留言：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.remark }</p>
					                </li>
					            </ul>
					  	</div>
					  	<div class="nav-tplist-title bd-bottom pb-10  pt-15">
		                  <ul>
		                    <li>发票信息</li>
		                  </ul>
				       	</div>
					  	  <div class="form-label">
					  	  		<ul>
					                <li  class="col-md-6">
					                    <p class="word">发票类型：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.invoicetypename }</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">发票类目：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.invoicecontent }</p>
					                </li>
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">发票抬头：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.invoicetitle }</p>
					                </li>
					            </ul>
					  	</div>
					  	
					  		 <div class="bc-ang mb-10">
					  		 <input type="hidden" id="orderId" value="${orderDetail.orderid }">
					  		 <input type="hidden" id="orderUserId" value="${orderDetail.userid }">
					  		 <input type="hidden" id="pOrderId" value="${orderDetail.parentorderid }">
					  		 <input type="hidden" id="state" value="${orderDetail.state}">
								 <input type="button" id="but" class="btn btn-primary"
					  		 onclick="pager._queryDeliveryOrder('${orderDetail.orderid}','${orderDetail.parentorderid }','${orderDetail.state}','${orderDetail.busicode}','1');"  value="打印提货单">
					  		 </div>
							</div>	
                        	</div>	
                        </div>
                </div>
              </div> 
            </div>
    </div>
      
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModaltakeGoods" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button><br/>
            <!-- <h2 class="modal-title text-c" id="myModalLabel">
             	  提货单清单
            </h2> -->
         </div>
         <input id="deliveryModal_orderId" type="hidden" value="" />
         <input id="deliveryModal_parentOrderId" type="hidden" value="" />
         <input id="deliveryModal_state" type="hidden" value="" />
         <input id="deliveryModal_busiCode" type="hidden" value="" />
         <input id="deliveryModal_flag" type="hidden" value="" />
         
         <div class="modal-body" id="deliveryModal"> </div>
      </div>
</div><!-- /.modal -->
</div>

	<!-- Modal -->
    <div class="modal fade" id="mergeQueryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="myModalLabel">提示</h4>
                </div>
                 <div class="modal-body" style="padding:27px">
                    	<h5>此订单存在合并的订单,是否合并打印?</h5>
                </div>
               <div class="modal-footer">
                    <button type="button" onclick="pager._displayDeliveryOrder('${orderDetail.orderid}','${orderDetail.parentorderid }','${orderDetail.state}','${orderDetail.busicode}','1');" class="btn btn-primary" data-dismiss="modal">是</button>
                    <button type="button" onclick="pager._noMergeDisplayDeliveryOrder('${orderDetail.orderid}','${orderDetail.parentorderid }','${orderDetail.state}','${orderDetail.busicode}','1');" class="btn btn-default" data-dismiss="modal">否</button>
                 </div>
             </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	
	
	
	<!--提示弹出框 操作-->	
	<div class="eject-big">
		<div class="prompt-samll" id="prompt">
		<div class="eject-medium-title">
				<p>提示</p>
				<p class="img"><i class="fa fa-times"></i></p>
		</div>
		<!--确认删除-->
		<div class="prompt-samll-confirm">
			<ul>
			<li class="word">确定要删除已选联系人吗？</li>
			<li>
				<input type="button"  class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" value="确认">
				<input id="prompt-close" type="button"  class="biu-btn  btn-primary btn-blue btn-small ml-15 mt-20 radius" id="closebtn" value="取消"></li>		
			</ul>
		</div>
		</div>	
	<div class="mask" id="eject-mask"></div>
	</div>
<!--/提示弹出框操作结束-->
		
</body>
<script id="deliveryOrderTempalte" type="text/x-jsrender">
					<div id="realPrint">
								<br/>
							   <h3 class="modal-title text-c" id="myModalLabel">
             	  提货单清单
            </h3>
			<br/>
					<div class="bj-f3">
						<p>
							<span>客户订单号:</span>
							<span id="orignOrderId">{{:orderId}}</span><br/>
						</p>
						<p>
							<span>收货人姓名:</span>
							<span id="contactId">{{:contactName}}</span>
						</p>
					</div>
               		 <div class="table-responsive clearfix">
                                    <table class="table table-hover table-border table-bordered">
                                        <thead>
                                            <tr>
                                            	<th>序号</th>
                                                <th>商品编号</th>
                                                <th>商品名称</th>
                                                <th>规格</th>
                                                <th>数量</th>
                                            </tr>
                                        </thead>                                                                                                
                                    <tbody id="orderDisPlay">
									 {{for deliveryProdPrintVos}}  
							          <tr>
							                <td>{{:#index+1}}</td>
							                <td id="{{:#index}}_skuId">{{:skuId}}</td>
							                <td id="{{:#index}}_prodName">{{:prodName}}</td>
							                <td id="{{:#index}}_extendInfo">{{:extendInfo}}</td>
							                <td id="{{:#index}}_buySum">{{:buySum}}</td>
											<td id="{{:#index}}_horOrderId" style="display:none">{{:horOrderId}}</td>
											<td id="{{:#index}}_salePrice" style="display:none">{{:salePrice}}</td>
						              </tr> 
									 {{/for}}
                                    </tbody>
                             </table>
                    </div>
					<div class="bj-f3 text-r">
						<p>
							<span>合计:</span>
							<span>{{:sum}}</span><br/>
						</p>
					</div>
			</div>
         <div class="modal-footer">
			<input type="button"  onclick="pager._truePrint('${orderDetail.orderid}','${orderDetail.parentorderid }','${orderDetail.state}','${orderDetail.busicode}','1')" value="打印" class="btn btn-primary" data-dismiss="modal"/>
            <button type="button" onclick="pager._printDeliveryOrder();" class="btn btn-primary" data-dismiss="modal">
               	确认
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">取消
            </button>
         </div>
</script>
</html>