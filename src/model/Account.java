package model;

public class Account {
	private String tenDangNhap, tenTaiKhoan, chucVu;

	public Account() {
		super();
	}

	public Account(String tenDangNhap, String tenTaiKhoan, String chucVu) {
		super();
		this.tenDangNhap = tenDangNhap;
		this.tenTaiKhoan = tenTaiKhoan;
		this.chucVu = chucVu;
	}

	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}

	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}

	public String getChucVu() {
		return chucVu;
	}

	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}
}
