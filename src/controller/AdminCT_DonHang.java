package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Account;
import model.bean.Cart;
import model.service.CtrAccount;
import model.service.CtrCart;

public class AdminCT_DonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCT_DonHang() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/CT_DonHang.jsp");
		Account account = (Account)request.getSession().getAttribute("User");
		if(account.getChucVu().equals("admin"))
		{
			String maHoaDon = request.getParameter("id");
			if (maHoaDon != null) {
				CtrCart ctrCart = new CtrCart();
				Cart[] carts = ctrCart.getCart(maHoaDon);
				request.setAttribute("Carts", carts); //Gửi dữ liệu về Client
			} else {//Mã đơn hàng lỗi
				request.setAttribute("Carts", "error");
			}
			dispatcher.forward(request, response);
		}
		else
		{
			PrintWriter out = response.getWriter();

		
	        String title = "Sorry, you are not allowed to access this page!";
	        String docType = "<!doctype html public \"-//w3c//dtd html 4.0 "
	                + "transitional//en\">\n";
	 
	        out.println(docType + "<html>\n" +
	                "<head><title>" + title + "</title></head>\n"+
	                "<body bgcolor = \"#f0f0f0\">\n" +
	                "<h1 align = \"center\">" + title + "</h1>\n" );

			
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
