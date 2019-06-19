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
import model.service.CtrAccount;
import model.service.CtrBanner;

public class AdminQLBangTin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminQLBangTin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/QLBangTin.jsp");
		Account account = (Account)request.getSession().getAttribute("User");
		if(account.getChucVu().equals("admin"))
		{
			CtrBanner ctr_Ban = new CtrBanner();
			Banner[] danhsachbantin = ctr_Ban.getAllBT();
			request.setAttribute("danhsachbantin", danhsachbantin);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Account account = (Account)request.getSession().getAttribute("User");
		if(account.getChucVu().equals("admin"))
		{
			String action = request.getParameter("action");
			System.out.println(action);
			String contentBT = request.getParameter("contentBT");
			String inputImage = request.getParameter("inputImage");
			String titleBT = request.getParameter("titleBT");
			CtrBanner ctr_ban = new CtrBanner();
			if (action.equals("add")) {
				ctr_ban.addBT(contentBT, inputImage, titleBT);
			} else {
				if (action.equals("update")) {
					String MaTin = request.getParameter("id");
					ctr_ban.upBT(MaTin, contentBT, inputImage, titleBT);
				} else {
					if (action.equals("delete")) {
						String MaTin = request.getParameter("id");
						ctr_ban.delBT(MaTin);
					}
				}
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
