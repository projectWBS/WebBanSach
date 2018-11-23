package view.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CtrBook;
import model.Book;

public class AdminQLKhoSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminQLKhoSach() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../admin/QLKhoSach.jsp");
		CtrBook control_Book = new CtrBook();
		
		Book[] danhSachSach = control_Book.getAllBook();
		request.setAttribute("danhSachSach", danhSachSach);
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
