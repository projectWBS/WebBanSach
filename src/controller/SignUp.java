package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Scanner;

import model.service.CtrAccount;


public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("comp/Header.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> users = request.getParameterMap();
		int min =8;
	    int max=30;
	    int digit=0;
	    int special=0;
	    int upCount=0;
	    int loCount=0;
	    String password=users.get("MatKhau")[0].toString();
	   // Scanner scan = new Scanner(System.in);
	   
	    //password = scan.nextLine();
	    System.out.println(password);
	    if(password.length()>=min&&password.length()<=max){
	        for(int i =0;i<password.length();i++){
	            char c = password.charAt(i);
	            if(Character.isUpperCase(c)){
	                upCount++;
	            }
	            if(Character.isLowerCase(c)){
	                loCount++;
	            }
	            if(Character.isDigit(c)){
	                digit++;
	            }
	            if(c>=33&&c<=46||c==64){
	                special++;
	            }
	        }
	        if(special>=1&&loCount>=1&&upCount>=1&&digit>=1){
	            System.out.println(" Password is good:");
	            CtrAccount ctrAccount = new CtrAccount();
				ctrAccount.SignUp(users.get("TenDangNhap")[0],users.get("MatKhau")[0], users.get("TenNguoiDung")[0],users.get("GioiTinh")[0], users.get("NgaySinh")[0], users.get("DiaChi")[0], users.get("Email")[0], users.get("SDT")[0]);
	        }

	    }
		//if(checkPassword(users.get("Matkhau").toString())) {
			
		//}
		
	}
	 public boolean checkPassword(String pass)
	 {
		 Scanner in = new Scanner(System.in);
		 pass = in.next();
	
		   if(isStrong(pass))
		   {
			   return true;
		    }
		   else{
			   return false;
		   }
	}
	private boolean isStrong(String password){
		    return password.matches("^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z])");

	}
}
