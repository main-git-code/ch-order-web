package com.ai.ch.order.web.model;

import com.ai.slp.order.api.warmorder.param.ProductInfo;

public class ProductVo extends ProductInfo {
	private static final long serialVersionUID = 1L;
	//单价
	private String prodSalePrice;
	//折扣金额
	private String prodDiscountFee;
	//支付金额
	private String prodAdjustFee;

	public String getProdSalePrice() {
		return prodSalePrice;
	}

	public void setProdSalePrice(String prodSalePrice) {
		this.prodSalePrice = prodSalePrice;
	}

	public String getProdDiscountFee() {
		return prodDiscountFee;
	}

	public void setProdDiscountFee(String prodDiscountFee) {
		this.prodDiscountFee = prodDiscountFee;
	}

	public String getProdAdjustFee() {
		return prodAdjustFee;
	}

	public void setProdAdjustFee(String prodAdjustFee) {
		this.prodAdjustFee = prodAdjustFee;
	}

}
