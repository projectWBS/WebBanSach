package model.service;

import java.sql.ResultSet;
import java.sql.Types;
import java.util.Vector;

import model.bean.Account;
import model.dao.DBConnection;
import model.util.MD5;

public class CtrAccount {
	private DBConnection connection;

	public CtrAccount() {
		super();
		connection = new DBConnection();
	}
	
	public boolean Login(String userId, String password) {		
		//�?ăng nhập
		
		connection.connect();
		String passwordNew= MD5.encode(password)  ;
		boolean result = false;
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] {2, 3}, new Object[] {userId, passwordNew});
			Vector<Object[]> paramsOut = connection.createParams(new int[] {1}, new Object[] {Types.BIT});
			result = (boolean)connection.executeScalarFunction("fc_Login", paramsIn, paramsOut);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		
		return result;
	}
	public void SignUp(String TenDangNhap,String MatKhau,String TenNguoiDung,String GioiTinh,String NgaySinh,String DiaChi,String SDT,String Email) {
		connection.connect();
		String MatKhauMoi= MD5.encode(MatKhau)  ;
		try {
			boolean check=CheckTK(TenDangNhap);
			if(check) {
				Vector<Object[]> paramsIn=connection.createParams(new int[] {1,2,3,4,5,6,7,8}, 
						new Object[] {TenDangNhap,MatKhauMoi,TenNguoiDung,GioiTinh,NgaySinh,DiaChi,SDT,Email});
				connection.executeProcedure("InsertAccount", paramsIn, null, null);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		
	}
	private boolean CheckTK(String NameID) {
		boolean result = false;
		try {
			Vector<Object[]> paramsIn=connection.createParams(new int[] {2}, new Object[] {NameID});
			Vector<Object[]> paramOut=connection.createParams(new int[] {1}, new Object[] {Types.INTEGER});
			int temp=(int)connection.executeScalarFunction("CheckID", paramsIn, paramOut);
			result= (temp==0);
		} catch (Exception e) {
			System.out.println(e.getMessage());
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
}
