package view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CtrBook;
import model.Book;

public class ViewBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewBook() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("public/ViewBook.jsp");
		CtrBook control_Book = new CtrBook();
		
		String id = (String)request.getParameter("id");
		if (id != null) {
			Book book = control_Book.getBookById(id);
			if (book != null) {
				request.setAttribute("book", book);
			} else {
				request.setAttribute("book", null);
			}
		}
		
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	
	
	
}
