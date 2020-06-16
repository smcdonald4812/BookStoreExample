package com.mcdonald.conns;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mcdonald.cls.Books;
import com.mcdonald.cls.PayOrder;
import com.mcdonald.cls.Sellers;
import com.mcdonald.cls.Users;

public class Connect {
	public boolean checkLogin(String u, String p) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement("SELECT * FROM bookshopbasic.user WHERE username=? and password=?");
			ps.setString(1, u);
			ps.setString(2, p);
			return ps.executeQuery().next();
		} catch (SQLException e) {
			System.out.println("something went wrong with connection");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("problem with class forName");
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkUserName(String u) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement("SELECT * FROM bookshopbasic.user WHERE username=?");
			ps.setString(1, u);
			return ps.executeQuery().next();
		} catch (SQLException e) {
			System.out.println("something went wrong with connection");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("problem with class forName");
			e.printStackTrace();
		}
		return false;
	}
	public boolean checkEmail(String email) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement("SELECT * FROM bookshopbasic.user WHERE email=?");
			ps.setString(1, email);
			return ps.executeQuery().next();
		} catch (SQLException e) {
			System.out.println("something went wrong with connection");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("problem with class forName");
			e.printStackTrace();
		}
		return false;
	}

	public List<Books> getAllBooks() {
		List<Books> ls = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			ResultSet rs = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root").createStatement()
					.executeQuery("SELECT * FROM bookshopbasic.books");
			while (rs.next()) {
				Books b = new Books();
				b.setId(rs.getInt(1));
				b.setTitle(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPublisher(rs.getString(4));
				b.setYear(rs.getInt(5));
				b.setInfo(rs.getString(6));
				b.setCost(rs.getFloat(7));
				b.setIsbn(rs.getString(8));
				ls.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ls;
	}

	public List<Sellers> getAllSellers() {
		List<Sellers> ls = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			ResultSet rs = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root").createStatement()
					.executeQuery("SELECT * FROM bookshopbasic.bookseller");
			while (rs.next()) {
				Sellers s = new Sellers();
				s.setId(rs.getInt(1));
				s.setName(rs.getString(2));
				s.setAddress(rs.getString(3));
				s.setMobile(rs.getString(4));
				s.setEmail(rs.getString(5));
				ls.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ls;
	}

	public List<Users> getAllUsers() {
		List<Users> ls = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			ResultSet rs = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root").createStatement()
					.executeQuery("SELECT * FROM bookshopbasic.user");
			while (rs.next()) {
				Users u = new Users();
				u.setId(rs.getInt(1));
				u.setNfirst(rs.getString(2));
				u.setNlast(rs.getString(3));
				u.setAddress(rs.getString(4));
				u.setMobile(rs.getString(5));
				u.setRegDate((Date) rs.getTimestamp(6));
				u.setAccessed((Date) rs.getTimestamp(7));
				u.setUsername(rs.getString(8));
				u.setPassword(rs.getString(9));
				if (rs.getBoolean(10)) {
					u.setSubscribed(rs.getBoolean(10));
				} else {
					u.setSubscribed(rs.getBoolean(10));
				}
				ls.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return ls;
	}
	public Users getUser(String uname) {
		Users u = new Users();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement(
							"SELECT * FROM bookshopbasic.user WHERE username=?");
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u.setId(rs.getInt(1));
				u.setNfirst(rs.getString(2));
				u.setNlast(rs.getString(3));
				u.setAddress(rs.getString(4));
				u.setMobile(rs.getString(5));
				u.setRegDate((Date) rs.getTimestamp(6));
				u.setAccessed((Date) rs.getTimestamp(7));
				u.setUsername(rs.getString(8));
				u.setPassword(rs.getString(9));
				if (rs.getBoolean(10)) {
					u.setSubscribed(rs.getBoolean(10));
				} else {
					u.setSubscribed(rs.getBoolean(10));
				}
				u.setEmail(rs.getString(11));
			}
			return u;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return u;
	}
	public int setNewPayOrder(PayOrder pay) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement(
							"INSERT INTO bookshopbasic.payOrder (userName, total, address, city, state, zip, firstName, lastName)VALUES(?,?,?,?,?,?,?,?)");
			ps.setString(1, pay.getUserName());
			ps.setFloat(2, pay.getTotal());
			ps.setString(3, pay.getAddress());
			ps.setString(4, pay.getCity());
			ps.setString(5, pay.getState());
			ps.setString(6, pay.getZip());
			ps.setString(7, pay.getNfirst());
			ps.setString(8, pay.getNlast());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public PayOrder getPayOrder(String userName) {
		PayOrder p = new PayOrder();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement(
							"SELECT * FROM bookshopbasic.payorder WHERE userName=? ORDER BY id ASC LIMIT 1");
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(rs.getInt(1));
				p.setUserName(rs.getString(2));
				p.setTotal(rs.getFloat(3));
				p.setAddress(rs.getString(4));
				p.setCity(rs.getString(5));
				p.setState(rs.getString(6));
				p.setZip(rs.getString(7));
				p.setPurchaseDate((Date)rs.getTimestamp(8));
				p.setNfirst(rs.getString(9));
				p.setNlast(rs.getString(10));
			}
			return p;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return p;
	}
	public Books getBook(int id) {
		Books u = new Books();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement(
							"SELECT * FROM bookshopbasic.books WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u.setId(rs.getInt(1));
				u.setTitle(rs.getString(2));
				u.setAuthor(rs.getString(3));
				u.setPublisher(rs.getString(4));
				u.setYear(rs.getInt(5));
				u.setInfo(rs.getString(6));
				u.setCost(rs.getFloat(7));
				u.setIsbn(rs.getString(8));
			}
			return u;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return u;
	}
	public Sellers getSeller(int id) {
		Sellers u = new Sellers();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement(
							"SELECT * FROM bookshopbasic.bookseller WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setAddress(rs.getString(3));
				u.setMobile(rs.getString(4));
				u.setEmail(rs.getString(5));
				u.setInfo(rs.getString(6));
			}
			return u;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return u;
	}
	public List<Books> getStock(int id) {
		List<Books> b = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshopbasic", "root", "root")
					.prepareStatement(
							"SELECT " +
							"		 `bookseller`.`name`," +
							"        `books`.`id`," + 
							"        `books`.`title`," + 
							"        `books`.`author`," + 
							"        `books`.`publisher`," + 
							"        `books`.`printYear`," + 
							"        `books`.`info`," + 
							"        `books`.`cost`," + 
							"        `books`.`isbn`," + 
							"        `bookcondition`.`condition`," + 
							"        `bookstock`.`stock`" + 
							"    FROM" + 
							"        ((`bookstock`" + 
							"        JOIN `bookseller` ON ((`bookstock`.`sellerid` = `bookseller`.`id`)))" + 
							"        JOIN `books` ON ((`books`.`id` = `bookstock`.`title`))" +
							"		 JOIN `bookcondition` ON ((`bookstock`.`conditionid` = `bookcondition`.`conditionid`)))"+
							"    WHERE" + 
							"        (`bookstock`.`sellerid` = ?)");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Books u = new Books();
				u.setSeller(rs.getString(1));
				u.setId(rs.getInt(2));
				u.setTitle(rs.getString(3));
				u.setAuthor(rs.getString(4));
				u.setPublisher(rs.getString(5));
				u.setYear(rs.getInt(6));
				u.setInfo(rs.getString(7));
				u.setCost(rs.getFloat(8));
				u.setIsbn(rs.getString(9));
				u.setCondition(rs.getString(10));
				u.setStock(rs.getInt(11));
				b.add(u);
			}
			return b;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return b;
	}
	public int setNewUser(Users user) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement(
							"INSERT INTO bookshopbasic.user (firstName, lastName, address, email, mobile, username, password, subscribed)VALUES(?,?,?,?,?,?,?,?)");
			ps.setString(1, user.getNfirst());
			ps.setString(2, user.getNlast());
			ps.setString(3, user.getAddress());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getMobile());
			ps.setString(6, user.getUsername());
			ps.setString(7, user.getPassword());
			ps.setBoolean(8, user.isSubscribed());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int editUser(Users user) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			PreparedStatement ps = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root")
					.prepareStatement(
							"UPDATE bookshopbasic.users firstName = ?, lastName = ?, address = ?, mobile = ? WHERE id=?");
			ps.setString(1, user.getNfirst());
			ps.setString(2, user.getNlast());
			ps.setString(3, user.getAddress());
			ps.setString(4, user.getMobile());
			ps.setInt(4, user.getId());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
