package control;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

import database.DBConnection;
import model.Image;

public class CtrImage {
	
	private DBConnection connection;
	
	public CtrImage() {
		connection = new DBConnection();
	}
	
	public String addImage(String maSach, String path) {
		//Thêm ảnh mới vào bảng
		Vector<Object[]> paramsIn = connection.createParams(new int[] {2, 3}, new Object[] {maSach, path});
		Vector<Object[]> paramsOut = connection.createParams(new int[] {1}, new Object[] {Types.VARCHAR});
		String maAnh = "";
		connection.connect();
		
		try {
			Object[] result = connection.executeProcedure("sp_ThemAnh", paramsIn, paramsOut, null);
			if (result != null && result.length > 0)
				maAnh = result[0].toString();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
		return maAnh;
	}
	
	public void updateImage(Image image) {
		//Thay đổi đường dẫn của ảnh hiện tại
		Vector<Object[]> paramsIn = connection.createParams(new int[] {1, 2, 3}, new Object[] {image.getMaAnh(), image.getMaSach(), image.getDuongDan()});
		connection.connect();
		
		try {
			connection.executeProcedure("sp_ChinhSuaAnh", paramsIn, null, null);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}
	}
	
	public Image[] getImageById(String idImage, String idBook){
		//Trả về danh sách ảnh đọc từ bảng
		Vector<Image> result = new Vector<>();
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] { 1, 2 }, new Object[] { idImage, idBook });
			ResultSet resultSet;
			resultSet = connection.executeTableFunction("fc_getImageById", paramsIn);

			while (resultSet.next() && result.size() <= 4) {
				Image image = new Image();
				
				image.setMaAnh(resultSet.getString(1));
				image.setDuongDan(resultSet.getString(2));
				result.addElement(image);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}

		return result.toArray(new Image[0]);
	}
	
	public Image getImageById(String idImage, String idBook, int index){
		//Trả về ảnh thứ index trong danh sách ảnh đọc được từ bảng
		Vector<Image> result = new Vector<>();
		connection.connect();
		
		try {
			Vector<Object[]> paramsIn = connection.createParams(new int[] { 1, 2 }, new Object[] { idImage, idBook });
			ResultSet resultSet;
			resultSet = connection.executeTableFunction("fc_getImageById", paramsIn);

			while (resultSet.next() && result.size() <= 4) {
				Image image = new Image();
				
				image.setMaAnh(resultSet.getString(1));
				image.setDuongDan(resultSet.getString(2));
				result.addElement(image);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			connection.close();
		}

		if (result.size() <= index) return null;
		return result.elementAt(index);
	}
	
}
