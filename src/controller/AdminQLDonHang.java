package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Account;
import model.bean.Banner;
import model.bean.Order;
import model.service.CtrAccount;
import model.service.CtrBanner;
import model.service.CtrOrder;

public class AdminQLDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminQLDonHang() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/QLDonHang.jsp");
		Account account = (Account)request.getSession().getAttribute("User");
		if(account.getChucVu().equals("admin"))
		{
			CtrOrder Ctr_Ord=new CtrOrder();
			Order[] danhsachdonhang=Ctr_Ord.getAllDH();
			String strSearch=request.getParameter("btnSearch");
			if(strSearch!=null)
			{
				Order[] orders=Ctr_Ord.searchDH(strSearch);
				request.setAttribute("strSearch", orders);	
			}
			else
			{
				request.setAttribute("danhsachdonhang", danhsachdonhang);
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
		Account account = (Account)request.getSession().getAttribute("User");
		if(account.getChucVu().equals("admin"))
		{
			String maHD=request.getParameter("maHD");
			CtrOrder Ctr_Ord=new CtrOrder();
			if(maHD!=null)
			{
				Ctr_Ord.duyetDon(maHD);
			}
			doGet(request, response);
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

}
