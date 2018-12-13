<%@page import="model.bean.Book"%>
<%@page import="model.bean.Banner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>
<link rel="icon" type="image/png" href="image/LOGO.ico" />

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="lib/css/sheet.css">
<link rel="stylesheet" type="text/css" href="lib/css/styleDialog.css">
<link rel="stylesheet" type="text/css" href="lib/css/styleHome.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body class="common-home">

	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<section>
			<div clas="container"
				style="width: 80%; transform: translateX(11.5%); margin: 1.5em 0em;">
				<div class="row khung">
					<div class="col-xs-12">
						<div id="my-carousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#my-carousel" data-slide-to="0" class="active"></li>
								<li data-target="#my-carousel" data-slide-to="1" class=""></li>
								<li data-target="#my-carousel" data-slide-to="2" class=""></li>
							</ol>
							<div class="carousel-inner">
								<%
									Object result = request.getAttribute("danhsachbantin");
									Banner[] banners = (Banner[]) result;
									if (result != null && result instanceof Banner[]) {
										out.println("<div class=\"item active\"><a onclick=\"openNewTab('UserCT-BanTin?id="
												+ banners[0].getMaTin() + "')\"> <img src=\"image/" + banners[0].getAnh()
												+ "\" style=\"width: 100%; background-repeat: no-repeat; cursor:pointer;\"> </a></div>");
										for (int i = 1; i < banners.length; i++) {
											out.println("<div class=\"item\"><a onclick=\"openNewTab('UserCT-BanTin?id=" + banners[0].getMaTin()
													+ "')\"> <img src=\"image/" + banners[i].getAnh()
													+ "\" style=\"width: 100%; background-repeat: no-repeat; cursor:pointer;\"></a></div>");
										}
									}
								%>
								<a class="left carousel-control" href="#my-carousel"
									data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span></a> <a
									class="right carousel-control" href="#my-carousel"
									data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<article class="container">
			<div class="bookshelf" style="margin: 1em 1em 1em 0em;">
				<div class="row descrip">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="title">Danh mục</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6"></div>
				</div>
				<ul class="row content listView">
					<li class="col-lg-3 col-md-4 col-sm-6 col-xs-12 listView-item">
						<div class="thumbnail" onclick="gotoPage('Filter?cate=type00001')">
							<img src="lib/image/categories/type00001.jpeg"></img>
							<div class="detail">Kinh Nghiệm Sống</div>
						</div>
					</li>
					<li class="col-lg-3 col-md-4 col-sm-6 col-xs-12 listView-item">
						<div class="thumbnail" onclick="gotoPage('Filter?cate=type00002')">
							<img src="lib/image/categories/type00002.jpeg"></img>
							<div class="detail">Sách Văn Học</div>
						</div>
					</li>
					<li class="col-lg-3 col-md-4 col-sm-6 col-xs-12 listView-item">
						<div class="thumbnail" onclick="gotoPage('Filter?cate=type00004')">
							<img src="lib/image/categories/type00004.jpeg"></img>
							<div class="detail">Sách Kinh Tế</div>
						</div>
					</li>
					<li class="col-lg-3 col-md-4 col-sm-6 col-xs-12 listView-item">
						<div class="thumbnail" onclick="gotoPage('Filter?cate=type00005')">
							<img src="lib/image/categories/type00005.jpeg"></img>
							<div class="detail">Tiểu Thuyết</div>
						</div>
					</li>
					<li class="col-lg-3 col-md-4 col-sm-6 col-xs-12 listView-item">
						<div class="thumbnail" onclick="gotoPage('Filter?cate=type00007')">
							<img src="lib/image/categories/type00007.jpeg"></img>
							<div class="detail">Trinh Thám</div>
						</div>
					</li>
					<li class="col-lg-3 col-md-4 col-sm-6 col-xs-12 listView-item">
						<div class="thumbnail" onclick="gotoPage('Filter?cate=type00009')">
							<img src="lib/image/categories/type00009.jpeg"></img>
							<div class="detail">Văn học nước ngoài</div>
						</div>
					</li>
					<li class="col-lg-3 col-md-4 col-sm-6 col-xs-12 listView-item">
						<div class="thumbnail" onclick="gotoPage('Filter?cate=type00010')">
							<img src="lib/image/categories/type00010.jpeg"></img>
							<div class="detail">Truyện tranh</div>
						</div>
					</li>
					<li class="col-lg-3 col-md-4 col-sm-6 col-xs-12 listView-item">
						<div class="thumbnail" onclick="gotoPage('Filter?cate=type00013')">
							<img src="lib/image/categories/type00013.jpeg"></img>
							<div class="detail">Khoa Học Viễn Tưởng</div>
						</div>
					</li>
				</ul>
			</div>
		</article>
		<article class="container">
			<div class="bookshelf" style="margin: 1em 1em 1em 0em;">
				<div class="row descrip">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="title">Sách yêu thích</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
						<div class="view-detail">
							<a href="Categories?danhMuc=yeuthich">Xem chi tiết >></a>
						</div>
					</div>
				</div>
				<div class="row content">
					<%
						Object objYeuThich = request.getAttribute("topYeuThich");
						Book[] topYeuThich = null;
						if (objYeuThich != null && objYeuThich instanceof Book[]) {
							topYeuThich = (Book[]) objYeuThich;
						}
						if (topYeuThich != null) {
							for (int i = 0; i < topYeuThich.length; i++) {
								Book book = topYeuThich[i];
								out.println("<div class=\"col-lg-3 col-md-4 col-sm-6 col-xs-12\">");
								out.println(
										"<div class=\"book\" id=\"" + book.getMaSach() + "\"><div class=\"icon-bar vertical\">");
								out.println("<ul><li><div class=\"button-modify\">");
								out.println("<div class=\"button-arc forest right\" onclick=\"gotoPage('ViewBook?id="
										+ book.getMaSach() + "')\">");
								out.println("<i class=\"fa fa-info-circle\" onclick=\"gotoPage('ViewBook?id=" + book.getMaSach()
										+ "')\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Thông tin chi tiết</span></div></div></div></li>");
								out.println(
										"<li><div class=\"button-modify\"><div class=\"button-arc cool right\" style=\"transform: translateY(150%)\">");
								out.println("<i class=\"fa fa-cart-plus\" onclick=\"addBookToCart('" + book.getMaSach()
										+ "', 1)\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Cho vào giỏ hàng</span></div></div></div></li>");
								out.println(
										"<li><div class=\"button-modify\"><div class=\"button-arc danger right\" style=\"transform: translateY(300%)\">");
								out.println("<i class=\"fa fa-money\" onclick=\"buyNow('" + book.getMaSach() + "', 1)\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Mua ngay</span></div></div></div></li></ul></div>");
								out.println("<div class=\"thumbnail\">");
								out.println("<img onclick=\"gotoPage('ViewBook?id=" + book.getMaSach()
										+ "')\" style=\"cursor:pointer\" alt=\"s00001\" src=\"lib/image/"
										+ book.getImages().getDuongDan() + "\"></div>");
								out.println("<div class=\"info-book\"><div class=\"title\">" + book.getTenSach() + "</div>");
								out.println("<div class=\"price\">" + book.getGiaBan() + "</div></div></div></div>");
							}
						}
					%>
				</div>
			</div>

			<div class="bookshelf" style="margin: 1em 1em 1em 0em;">
				<div class="row descrip">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="title">Sách bán chạy</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
						<div class="view-detail">
							<a href="Categories?danhMuc=banchay">Xem chi tiết >></a>
						</div>
					</div>
				</div>
				<div class="row content">
					<%
						Object objBanChay = request.getAttribute("topBanChay");
						Book[] topBanChay = null;
						if (objBanChay != null && objBanChay instanceof Book[]) {
							topBanChay = (Book[]) objBanChay;
						}
						if (topBanChay != null) {
							for (int i = 0; i < topBanChay.length; i++) {
								Book book = topBanChay[i];
								out.println("<div class=\"col-lg-3 col-md-4 col-sm-6 col-xs-12\">");
								out.println(
										"<div class=\"book\" id=\"" + book.getMaSach() + "\"><div class=\"icon-bar vertical\">");
								out.println("<ul><li><div class=\"button-modify\">");
								out.println("<div class=\"button-arc forest right\" onclick=\"gotoPage('ViewBook?id="
										+ book.getMaSach() + "')\">");
								out.println("<i class=\"fa fa-info-circle\" onclick=\"gotoPage('ViewBook?id=" + book.getMaSach()
										+ "')\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Thông tin chi tiết</span></div></div></div></li>");
								out.println(
										"<li><div class=\"button-modify\"><div class=\"button-arc cool right\" style=\"transform: translateY(150%)\">");
								out.println("<i class=\"fa fa-cart-plus\" onclick=\"addBookToCart('" + book.getMaSach()
										+ "', 1)\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Cho vào giỏ hàng</span></div></div></div></li>");
								out.println(
										"<li><div class=\"button-modify\"><div class=\"button-arc danger right\" style=\"transform: translateY(300%)\">");
								out.println("<i class=\"fa fa-money\" onclick=\"buyNow('" + book.getMaSach() + "', 1)\"></i>");
								out.println(
										"<div class=\"content content-right\"><span>Mua ngay</span></div></div></div></li></ul></div>");
								out.println("<div class=\"thumbnail\">");
								out.println("<img style=\"cursor:pointer\" alt=\"s00001\" src=\"lib/image/"
										+ book.getImages().getDuongDan() + "\"></div>");
								out.println("<div class=\"info-book\"><div class=\"title\">" + book.getTenSach() + "</div>");
								out.println("<div class=\"price\">" + book.getGiaBan() + "</div></div></div></div>");
							}
						}
					%>
				</div>
			</div>
		</article>
	</div>

	<div>
		<div class="dialog" id="confirm-form" style="width: 60%;">
			<div class="header">
				<div class="title">Thanh toán</div>
				<a class="f-right close" href="#"><i class="fa fa-close"></i></a>
			</div>
			<ul class="content">
				<li class="item" style="height: 100px;"><span class="title">Tên
						người mua</span>
					<div class="detail">
						<input id="username" type="text" autocomplete="on" name="username"
							placeholder="Name..." value="" />
					</div></li>
				<li class="item" style="height: 100px;"><span class="title">Địa
						chỉ giao hàng</span>
					<div class="detail">
						<input id="address" type="text" name="address"
							placeholder="Address..." value="" />
					</div></li>
				<li class="item" style="height: 100px;"><span class="title">Số
						điện thoại</span>
					<div class="detail">
						<input id="phone" type="text" name="phone" placeholder="Phone..."
							value="" />
					</div></li>
				<li class="item">
					<button class="button submit-button" onclick="addCart()">Đặt
						hàng</button>
				</li>
			</ul>
		</div>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			// khi click đóng hộp thoại
			$(document).on('click', "a.close, #over", function() {
				$('#over, .dialog').fadeOut(300, function() {
					$('#over').remove();
					var url = location.href;
					if (url.indexOf('ViewCart') == -1) {
						deleteAllCookie();

						var button = $('.cart-count')[0];
						$(button).find('#number').text(0);
					}
				});
				return false;
			});

			$(document).on('click', "button.submit-button", function() {
				$('#over, .dialog').fadeOut(300, function() {
					$('#over').remove();
					deleteAllCookie();
				});
				return false;
			});
		});

		function openNewTab(url) {
			window.open(url, '_blank');
		}
		function changeStateOrder(maHD, bool) {
			if (bool) {
				var url = window.location.href;
				$(".QLDH_tbDonHang").load(url + " #table", {
					maHD : maHD
				});
			}
		}
		function reloadKH() {
			var URL = window.location.href;
			var searchU = document.getElementById("btnSearch").value;
			document.getElementById("btnSearch").value = searchU;

		}
		function refreshPage() {
			window.location.href = window.location.href
		}
	</script>
</body>
</html>