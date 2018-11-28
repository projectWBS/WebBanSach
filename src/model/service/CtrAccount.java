package model.service;

import java.sql.ResultSet;
import java.sql.Types;
import java.util.Vector;

import model.bean.Account;
import model.dao.DBConnection;

public class CtrAccount {
	private DBConnection connection;

	public CtrAccount() {
		super();
		connection = new DBConnection();
	}
	
	public boolean Login(String userId, String password) {		
		//�?ăng nhập
		
		connection.connect();
		boolean result = false;
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {2, 3}, new Object[] {userId, password});
			Vector<Object[]> paramsOut = connection.createParams(new int[] {1}, new Object[] {Types.BIT});
			result = (boolean)connection.executeScalarFunction("fc_Login", paramsIn, paramsOut);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		
		return result;
	}
	
	public Account getInformation(String userId) {
		//Lấy thông tin của tài khoản
		
		connection.connect();
		Account result = new Account();
		result.setTenDangNhap(userId);

		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {1}, new Object[] {userId});
			ResultSet resultSet = connection.executeTableFunction("fc_GetInformation", paramsIn);
			while(resultSet.next()) {
				result.setTenTaiKhoan(resultSet.getString(1));
				result.setChucVu(resultSet.getString(2));
				break;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		
		return result;
	}
	
	public void signUp(String userId, String password, String username ,String email) {
		//�?ăng ký tài khoản mới
		
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {1, 2, 3, 4}, new Object[] {userId, password, username, email});
			connection.executeProcedure("sp_SignUp", paramsIn, null, null);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
	}
	
	public boolean checkAccount(String userId) {
		//Kiểm tra tài khoản hợp lệ, không trùng
		
		boolean result = false;
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {2}, new Object[] {userId});
			Vector<Object[]> paramsOut = connection.createParams(new int[] {1}, new Object[] {Types.BIT});
			Object[] objects = (Object[])(connection.executeScalarFunction("fc_CheckAccount", paramsIn, paramsOut));
			result = (boolean)objects[0];
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		return result;
	}
}
