define('app/jsp/order/stasticOrder', function (require, exports, module) {
    'use strict';
    var $=require('jquery'),
    Widget = require('arale-widget/1.2.0/widget'),
    Dialog = require("optDialog/src/dialog"),
    Paging = require('paging/0.0.1/paging-debug'),
    AjaxController = require('opt-ajax/1.0.0/index');
    require("jsviews/jsrender.min");
    require("jsviews/jsviews.min");
    require("bootstrap-paginator/bootstrap-paginator.min");
    require("app/util/jsviews-ext");
    
    require("jquery-validation/1.15.1/jquery.validate");
	require("app/util/aiopt-validate-ext");
	
    require("opt-paging/aiopt.pagination");
    require("twbs-pagination/jquery.twbsPagination.min");
    require('bootstrap/js/modal');
    var SendMessageUtil = require("app/util/sendMessage");
    //实例化AJAX控制处理对象
    var ajaxController = new AjaxController();
    //定义页面组件类
    var stasticOrderPager = Widget.extend({
    	
    	Implements:SendMessageUtil,
    	//属性，使用时由类的构造函数传入
    	attrs: {
    	},
    	Statics: {
    		DEFAULT_PAGE_SIZE: 5
    	},
    	//事件代理
    	events: {
    		//查询
            "click #search":"_highSearch"
        },
    	//重写父类
    	setup: function () {
    		stasticOrderPager.superclass.setup.call(this);
    		// 初始化执行搜索
			this._highSearch();
    	},
		//获取高级查询参数
		_getHignQueryParams:function(){
			var _this = this;
				return{
				    "startTime":function () {
				    	_this.startTime = jQuery.trim($("#orderTimeBegin").val());
				        return _this.startTime;
				    },
				    "endTime":function () {
				    	_this.endTime = jQuery.trim($("#orderTimeEnd").val());
				        return _this.endTime;
				    },
				    "ordParenOrderId":function () {
				    	_this.ordParenOrderId = jQuery.trim($("#parentOrderId").val());
				        return _this.ordParenOrderId;
				    },
				      "prodName":function () {
				    	_this.prodName = jQuery.trim($("#productName").val());
				        return _this.prodName;
				    },
				    "state":function(){
				    	_this.state =jQuery.trim($("#state option:selected").val());
				    	 return _this.state;
				    },
				    "supplierName":function(){
				    	_this.supplierName =jQuery.trim($("#supplierName").val());
				    	 return _this.supplierName;
				    },
				    "userName":function(){
				    	_this.userName =jQuery.trim($("#userName").val());
				    	 return _this.userName;
				    }
				}
		},
		//高级搜索
		_highSearch:function(){
			var _this = this;
//			var queryParams = this._getHignQueryParams();
			
			var startTime = $("#orderTimeBegin").val().trim();
			var endTime = $("#orderTimeEnd").val().trim();
			var ordParenOrderId = $("#parentOrderId").val().trim();
			var prodName = $("#productName").val().trim();
			var state = $("#state").val().trim();
			var supplierName = $("#supplierName").val().trim();
			var userName = $("#userName").val().trim();
			
			$("#pagination").runnerPagination({
				url: _base+"/getStasticOrderData",
				method: "POST",
				dataType: "json",
				data: {"startTime":startTime,"endTime":endTime,"ordParenOrderId":ordParenOrderId,"prodName":prodName,"state":state,"supplierName":supplierName,"userName":userName},
//				data : queryParams,
				pageSize: stasticOrderPager.DEFAULT_PAGE_SIZE,
				visiblePages:5,
				messageId:"showMessageDiv",
				renderId:"stasticData",
				render: function (data) {
					if(data != null && data != 'undefined' &&data.length>0){
						var template = $.templates("#stasticTemple");
						var htmlOut = template.render(data);
						$("#stasticData").html(htmlOut);
					}
				},
			});
		},
		_detail:function(orderid,state,pOrderId,busiCode){
			 window.location.href = _base+"/orderDetail?orderId="
	            + orderid+"&state="+state+"&pOrderId="+pOrderId+"&busiCode="+busiCode
		}
		
    });
    
    module.exports = stasticOrderPager
});

