package cn.tea.pojo;

import lombok.Data;

@Data
public class OrderDetails {
	private int odid;
	private int pid;
	private int oid;
	private int comAmount;
	private String comName;
	private double comPrice;
	private String comImage;
	private Product product;
	private Order order;
	public int getOdid() {
		return odid;
	}
	public void setOdid(int odid) {
		this.odid = odid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getComAmount() {
		return comAmount;
	}
	public void setComAmount(int comAmount) {
		this.comAmount = comAmount;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public double getComPrice() {
		return comPrice;
	}
	public void setComPrice(double comPrice) {
		this.comPrice = comPrice;
	}
	public String getComImage() {
		return comImage;
	}
	public void setComImage(String comImage) {
		this.comImage = comImage;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
}
