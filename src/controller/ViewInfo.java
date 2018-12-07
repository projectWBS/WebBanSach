package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Account;
import model.bean.Book;
import model.bean.Order;
import model.service.CtrAccount;
import model.service.CtrBook;
import model.service.CtrComment;
import model.service.CtrOrder;

public class ViewInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/ViewInfo.jsp");
		CtrAccount control_Acc = new CtrAccount();
		CtrOrder control_Order=new CtrOrder();
		String MaKH=((Account)request.getSession().getAttribute("User")).getTenDangNhap();
		if (MaKH != null) 
		{
			Account userProfile = control_Acc.UserProfile(MaKH);
			Order[] userOrder=control_Order.getDHById(MaKH);
			request.setAttribute("userProfile", userProfile);
			request.setAttribute("userOrder", userOrder);
		}
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maHD=request.getParameter("maHD");
		CtrOrder Ctr_Ord=new CtrOrder();
		if(maHD!=null)
		{
			Ctr_Ord.huyDon(maHD);
		}
		doGet(request, response);
	}

}
