define('app/jsp/order/sendGoods', function (require, exports, module) {
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
    var sendPager = Widget.extend({
    	
    	Implements:SendMessageUtil,
    	//属性，使用时由类的构造函数传入
    	attrs: {
    	},
    	Statics: {
    	},
    	//事件代理
    	events: {
    		//查询
        },
    	//重写父类
    	setup: function () {
    		sendPager.superclass.setup.call(this);
    		var formValidator=this._initValidate();
			$(":input").bind("focusout",function(){
				formValidator.element(this);
			});
    	},
    	_initValidate:function(){
    		var formValidator=$("#dataForm").validate({
    			rules: {
    				flowName: {
    					regexp: /^[0-9a-zA-Z]*$/g
    				}
    			},
    			messages: {
    				flowName: {
    					regexp: "只能输入字母或数字"
    				}
    			}
    		});
    		return formValidator;
    	},
    	_confirmSendGoods:function(obj,thisObj){
    		var count = 0;
    		$("input[name='flowName']").each(function(){
    	        if ($(this).val() != ""){
    	            count++;
    	        }
    	    });
    		if(count>1 || count == 0){
    			$('#eject-mask').fadeIn(100);
    			$('#p-operation').slideDown(200);
    			return false;
	        }
    		 var id = $("#other").val();
    		 var name = $("#otherName").val();
    		 if((id=="" && name!="") || (id!="" && name=="")){
    			 $('#eject-mask').fadeIn(100);
     			$('#p-operation').slideDown(200);
     			return false; 
    		 }
    		 var _this = this;
 			var formValidator=_this._initValidate();
 			formValidator.form();
 			if(!$("#dataForm").valid()){
 				return false;
 			}
    		  var _this=thisObj;
    		  var expressCompany=$(_this).parent().prev().prev().attr("value");
    		  var expressIdValue=$(_this).parent().prev().find("input").val();
    		  var url=_base+"/deliver";
			  ajaxController.ajax({
	  	    	type: "post",
				dataType: "json",
				processing: false,
				message: "查询中，请等待...",
				url: url,
				data:{"orderId":obj,"expressId":expressCompany,"expressOddNumber":expressIdValue},
	  	        success: function (data) {
	  	        	if(data.statusCode == "1"){
	  	        	//调到订单列表页面
	  	      		var state = "16";
	  	      		window.location.href = _base+"/order/toOrderList?stateFlag="
	  	              + state
    	        	}else{
    	        		var d = Dialog({
							title: '消息',
							content:"发货失败:"+data.statusInfo,
							icon:'false',
							okValue: '确 定',
							ok:function(){
								this.close();
							}
						});
						d.show();
    	        	}
      	        },
			  });
		}
    });
    
    module.exports = sendPager
});

