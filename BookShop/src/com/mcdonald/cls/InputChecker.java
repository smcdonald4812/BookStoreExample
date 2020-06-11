package com.mcdonald.cls;

import com.mcdonald.conns.Connect;

public class InputChecker {
	public boolean checkNames(String... params) {
		for(String s : params) if(!s.matches("[A-Za-z]+")) return false;
		return true;
	}
	public boolean checkAddress(String... params) {
		if(!params[0].matches("[0-9]+ [a-zA-Z .]+")) return false;
		if(!params[1].matches("[A-Za-z ]+")) return false;
		if(!params[2].matches("[0-9]{5}")) return false;
		return true;
	}
	public boolean checkUnameSignup(String name) {
		Connect conn = new Connect();
		if(conn.checkUserName(name)) return false;
		if(name.trim().contains(" ")) return false;
		if(name.length()<6) return false;
		return true;
	}
	public boolean checkLogin(String name, String pass) {
		Connect conn = new Connect();
		if(conn.checkLogin(name, pass)) return true;
		return false;
	}
	public boolean checkEmail(String email) {
		Connect conn = new Connect();
		if(conn.checkEmail(email)) return false;
		return true;
	}
	public boolean checkNewPassword(String a, String b) {
		if(!a.matches(b)) return false;
		if(a.length()<10) return false;
		return true;
	}
}
