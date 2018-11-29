package model.service;

import java.sql.Types;
import java.util.Vector;

import model.bean.Cart;
import model.dao.DBConnection;

public class CtrCart {

	private DBConnection connection;
	
	public CtrCart() {
		super();
		connection = new DBConnection();
	}
	
	public void addNewCart(String maKhachHang, String tenKhachHang, String diaChi, String sdt, Cart[] carts) {
		connection.connect();
		try {
			//Tạo hóa đơn mới
			Vector<Object[]> paramsIn  = connection.createParams(new int[] {2, 3, 4, 5}, new Object[] {maKhachHang, tenKhachHang, diaChi, sdt});
			Vector<Object[]> paramsOut = connection.createParams(new int[] {1}, new Object[] {Types.VARCHAR});
			Object[] result = connection.executeProcedure("sp_AddCart", paramsIn, paramsOut, null);
			
			//Thêm sách đã mua vô hóa đơn
			addBookToCart(result[0].toString(), carts);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
	}

	private void addBookToCart(String maHoaDon, Cart[] carts) {
		try {
			for (Cart cart : carts) {
				Vector<Object[]> paramsIn = connection.createParams(new int[] {1, 2, 3, 4}, 
						new Object[] {cart.getBook().getMaSach(), maHoaDon, cart.getCount(), cart.getGiaBan()});
				connection.executeProcedure("sp_AddBookToCart", paramsIn, null, null);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
