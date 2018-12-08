<%@page import="model.bean.Cart"%>
<%@page import="model.bean.Book"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Xem giỏ hàng</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/styleView.css">
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="lib/css/sheet.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
</head>
<body>
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<section>
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
							<li itemprop="itemListElement"
								itemtype="http://schema.org/ListItem"><a itemprop="item"
								href="http://localhost:8080/Web_Ban_Sach/"> <span
									itemprop="name"> <i class="fa fa-home"></i> Trang chủ
								</span>
							</a> <span><i class="fa fa-angle-right"></i></span>
								<meta itemprop="position" content="1"></li>
							<li itemprop="itemListElement"
								itemtype="http://schema.org/ListItem"><a itemprop="item"
								href=""> <strong itemprop="name">Giỏ hàng</strong>
							</a>
								<meta itemprop="position" content="3"></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<article>
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
					<ul class="table-modify">
						<%
							Object carts = request.getAttribute("cart");
							if (carts == null) {
								out.println("<p class=\"error\">Giỏ hàng trống</p>");
							} else if (carts instanceof Vector) {
								Vector<Cart> v = (Vector<Cart>)carts;
								for (int i = 0; i < v.size(); i++) {
									Cart cart = (Cart)v.elementAt(i);
									Book book = cart.getBook();
									int countBook = cart.getCount();

									out.println("<li class=\"row-table\">");
									out.println("<div class=\"row\">");
									out.println("<div class=\"col-lg-3 col-md-4 col-sm-4 col-xs-12\">");

									if (book.getImages() != null)
										out.println("<div class=\"thumbnail small\"><img src=\"lib/image/"
												+ book.getImages().getDuongDan() + "\"></div></div>");
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
									out.println("<span><strong>Số lượng </strong></span>");
									out.println("<input type=\"number\" name=\"quantity\" min=\"1\" max=\"100\" value=\"" + countBook
											+ "\" id=\"count\">");
									out.println("</div></div></div><div class=\"deleteBook\" onclick=\"removeBookFromCart(" + i + ")\"><i class=\"fa fa-close\"></i></div></li>");
								}
							}
						%>
					</ul>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
					<div class="board" style="text-align: center;" id="bill">
						<span id="label" style="left: 0px;">Tổng tiền phải thanh toán: </span>
						<%
							int sum = 0;
							if (carts != null && carts instanceof Vector) {
								Vector<Cart> books = (Vector<Cart>) carts;
								for (int i = 0; i < books.size(); i++) {
									Cart cart = (Cart)books.elementAt(i);
									Book book = cart.getBook();
									int countBook = cart.getCount();
									int price = cart.getGiaBan();
									sum += price * countBook;
								}
							}
							out.println("<span id=\"price\" style=\"font-weight:bold;left: 0px;\">" + String.valueOf(sum) + "đ</span>");
						%>
					</div>
					<div class="button-modify" style="text-align: center;">
						<div class="button-rect forest">
							<a class="login-window" href="#confirm-form"><i class="fa fa-money"></i> <span
								class="content-inner">Thanh toán</span></a>
						</div>
					</div>
				</div>
			</div>
		</article>

		<div>
			<div class="dialog" id="confirm-form">Thông tin khách hàng
				<a class="close" href="#"><i class="fa fa-close" style="color: red; margin-right: 5px;"></i></a>
				<form class="dialog-content" action="#" method="post">
					<label class="name"> <span>Tên người mua</span> <input
						id="username" type="text" autocomplete="on" name="username"
						placeholder="Name..." value="" />
					</label> <label class="address"> <span>Địa chỉ giao hàng</span> <input
						id="password" type="text" name="address" placeholder="Address..."
						value="" />
					</label> <label class="phone"> <span>Số điện thoại</span> <input
						id="phone" type="text" name="phone" placeholder="Phone..."
						value="" />
					</label>
					<button class="button submit-button" type="button" onclick="addCart()">Đặt hàng</button>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../comp/Footer.jsp"%>

	<script type="text/javascript">
	
		function removeBookFromCart(index) {
			var cookies = getListCookie(); //Danh sách cookie trong web
			var countBook = cookies.pop().split("="); //Số lượng lần mua sách

			if (cookies.length > 0) {
				var book = cookies[index]; //Lấy ra thông tin lần mua sách thứ index
				deleteCookie(getNameCookie(book)); //Xóa lần mua này

				var soLuong = countBook[1] - 1;//Giảm số lượng lần mua trong biến đếm
				setCookie(countBook[0], soLuong);

				$(".cart-count").load(document.URL + " #number");
				$("#bill").load(document.URL + " #label, #price");
				if (soLuong > 0)
					$(".table-modify").load(document.URL + " .row-table");
				else
					$(".table-modify").load(document.URL + " .error");
			}
		}

		function addCart() {
			var url = window.location.href + '?action=add'
			var name = $('#username').val();
			var address = $('#address').val();
			var phone = $('#phone').val();

			$.post(url, {
				name : name,
				address : address,
				phone : phone
			}, function() {
				alert('Đặt hàng thành công');
			});
		}

		$(document).ready(
				function() {
					$('a.login-window').click(function() {
						//lấy giá trị thuộc tính href - chính là phần tử "#login-box"
						var loginBox = $(this).attr('href');

						//cho hiện hộp đăng nhập trong 300ms
						$(loginBox).fadeIn(300);

						// thêm phần tử id="over" vào sau body
						$('body').append('<div id="over">');
						$('#over').fadeIn(300);

						return false;
					});

					// khi click đóng hộp thoại
					$(document).on('click',
							"a.close, #over, button.submit-button", function() {
								$('#over, .dialog').fadeOut(300, function() {
									$('#over').remove();
								});
								return false;
							});
				});
	</script>
</body>
</html>