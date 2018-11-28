package model.bean;

public class Cart {
	private Book book; //Thông tin sách mua
	private int count; //Số lượng mua
	
	public Cart(Book book, int count) {
		super();
		this.book = book;
		this.count = count;
	}

	public Cart() {
		super();
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
