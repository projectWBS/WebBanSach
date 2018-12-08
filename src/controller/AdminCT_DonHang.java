package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Cart;
import model.service.CtrCart;

public class AdminCT_DonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminCT_DonHang() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/CT_DonHang.jsp");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
