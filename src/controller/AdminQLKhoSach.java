package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Account;
import model.bean.Book;
import model.service.CtrAccount;
import model.service.CtrBook;

public class AdminQLKhoSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminQLKhoSach() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/QLKhoSach.jsp");
		Account account = (Account)request.getSession().getAttribute("User");
		if(account.getChucVu().equals("admin"))
		{
			if (request.getParameter("action") == null) {
				CtrBook control_Book = new CtrBook();
				Book[] danhSachSach = control_Book.getAllBook();
				request.setAttribute("danhSachSach", danhSachSach);
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
			String action = request.getParameter("action");
			if (action.equalsIgnoreCase("searchBook")) {
				CtrBook ctrBook = new CtrBook();
				Book[] books = ctrBook.getSearchBook(request.getParameter("strSearch"));
				request.setAttribute("danhSachSach", books);
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
