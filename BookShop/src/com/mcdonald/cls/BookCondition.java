package com.mcdonald.cls;

public class BookCondition {
	public String getCondition(int i) {
		switch(i) {
			case 1:
				return new String("new");
			case 2:
				return new String("like new");
			case 3:
				return new String("used");
			case 4:
				return new String("worn");
			case 5:
				return new String("damaged");
			default:
				return new String("not specified");
		}
	}
}
