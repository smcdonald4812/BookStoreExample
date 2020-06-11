package com.mcdonald.cls;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Books> cartList;
	private int i;
	public Cart() {
		this.cartList = new ArrayList<>();
		this.i = 0;
	}
	public List<Books> getCartList() {
		return cartList;
	}
	public void addToCart(Books book) {
		this.cartList.add(book);
		i++;
	}
	public void removeFromCart(Books book) {
		this.cartList.remove(book);
		i--;
	}
	public void removeFromCart(int a) {
		this.cartList.remove(a);
		i--;
	}
	public int getBookCount() {
		return i;
	}
}
