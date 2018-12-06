<%@page import="model.bean.Book"%>
<%@page import="model.bean.Cart"%>
<%@page import="model.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>

<link rel="stylesheet" type="text/css" href="../lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="../lib/css/style.css">
<link rel="stylesheet" type="text/css" href="../lib/css/BEM_Style.css">
<link rel="stylesheet" type="text/css" href="../lib/css/styleView.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="../lib/js/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/js/vu.js"></script>

</head>
<body>

	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row" style="background-color: #eeeeee;">
			<div class="categories col-md-3 col-sm-12">
				<div class="title">
					<p>Chức năng quản lý</p>
				</div>
				<ul class="detail">
					<li class="item"><a href="../Manager/BangTin">Quản lý bảng
							tin</a></li>
					<li class="item"><a href="../Manager/ThuChi">Quản lý thu
							chi</a></li>
					<li class="item active"><a href="../Manager/DonHang">Quản lý đơn
							hàng</a></li>
					<li class="item"><a href="../Manager/KhoSach">Quản lý kho
							sách</a></li>
					<li class="item"><a href="../Manager/KhachHang">Quản
							lý khách hàng</a></li>
				</ul>
			</div>

			<div class="col-md-9 col-sm-12"">
				<h3
					style="text-align: center; border-bottom: 1px groove; padding-bottom: 0.25em">Thông
					tin chi tiết đơn hàng</h3>
				<ul class="table-modify">
					<%
						Object obj = request.getAttribute("Carts");
						Cart[] carts = null;

						if (obj instanceof Cart[]) {
							carts = (Cart[]) obj;
						}
						
						for (int i = 0; i < carts.length; i++) {
							Cart cart = carts[i];
							Book book = cart.getBook();
							int countBook = cart.getCount();

							out.println("<li class=\"row-table\">");
							out.println("<div class=\"row\">");
							out.println("<div class=\"col-lg-3 col-md-4 col-sm-4 col-xs-12\">");

							if (book.getImages() != null)
								out.println("<div class=\"thumbnail small\"><img src=\"../lib/image/" + book.getImages().getDuongDan()
										+ "\"></div></div>");
							out.println("<div class=\"col-lg-7 col-md-6 col-sm-6 col-xs-8 col-ms-12\">");
							out.println("<div id=\"info\" style=\"margin-top: 0px\">");
							out.println("<ul>");
							out.println("<li><p><strong>Tên sách: </strong></p>");
							out.println("<span>" + book.getTenSach() + "</span></li>");
							out.println("<li><p><strong>Tác giả: </strong></p>");
							out.println("<span>" + book.getTacGia() + "</span></li>");
							out.println("<li><p><strong>Giá bán: </strong></p>");
							out.println("<span>" + cart.getGiaBan() + "</span></li></ul></div></div>");
							out.println("<div class=\"col-lg-2 col-md-2 col-sm-2 col-xs-4 col-ms-12\">");
							out.println("<div id=\"numberCount\">");
							out.println("<span><strong>Số lượng: </strong>" + countBook + "</span>");
							out.println("</div></div></div></li>");
						}
					%>
				</ul>
			</div>
		</div>
	</div>


	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>
</body>
</html>