package view;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CtrBook;
import model.Book;
import model.Cart;

public class ViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewCart() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("public/ViewCart.jsp");
		CtrBook control_Book = new CtrBook();
		
		Cookie[] cookies = request.getCookies();
		Vector<Cart> cart = new Vector<Cart>(); //Kết quả gửi về client
		for (int i = 0; i<cookies.length; i++) {
			Cookie cookie = cookies[i];
			String name = cookie.getName();
			if (name.length() <= 4) continue;
			if (name.substring(0, 4).equalsIgnoreCase("book")) {
				String[] value = cookie.getValue().split("-");
				String id = getValueInCookie(value[0]);
				int count = Integer.parseInt(getValueInCookie(value[1]));
				Book book = control_Book.getBookById(id); //Thông tin của sách
				cart.addElement(new Cart(book, count));
			}
		}
		
		if (cart.size() > 0)
			request.setAttribute("cart", cart);
		else
			request.setAttribute("cart", null);
		
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	private int getCountBuy(Cookie[] cookies) {
		int count = 0;
		for (Cookie cookie : cookies) {
			String name = cookie.getName();
			if (name.equalsIgnoreCase("countBook")) {
				count = Integer.parseInt(cookie.getValue());
			}
		}
		return count;
	}
	
	private String getValueInCookie(String cookie){
		String string[] = cookie.split(":");
		return string[1];
	}
}
