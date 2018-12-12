<%@page import="model.bean.Banner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>
<link rel="icon" type="image/png" href="image/LOGO.ico"/>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="lib/css/sheet.css">
<link rel="stylesheet" type="text/css" href="lib/css/styleDialog.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
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
			<div clas="container">
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
												+ "\" style=\"width: 100%; background-repeat: no-repeat;\"> </a></div>");
										for (int i = 1; i < banners.length; i++) {
											out.println("<div class=\"item\"><a onclick=\"openNewTab('UserCT-BanTin?id=" + banners[0].getMaTin()
													+ "')\"> <img src=\"image/" + banners[i].getAnh()
													+ "\" style=\"width: 100%; background-repeat: no-repeat;\"></a></div>");
										}
									}
								%>
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
						<div class="title">Filter</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
						<div class="view-detail">
							<a href="Categories">Xem chi tiết >></a>
						</div>
					</div>
				</div>
				<div class="row content">
				<a a onclick="openNewTab('Filter?cate=type00001')"><img src="lib/image/cate.png"style="width: 100%; background-repeat: no-repeat;"></a>
				</div>
			</div>
		</article>
		<article class="container">
			<div class="bookshelf">
				<div class="row descrip">
					<div class="col-ms-12">
						<div class="title">Đầu sách</div>
					</div>
				</div>
				<div class="row content">
					
				</div>
			</div>
			<div class="bookshelf" style="margin: 1em 1em 1em 0em;">
				<div class="row descrip">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="title">Sách mới</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
						<div class="view-detail">
							<a href="Categories">Xem chi tiết >></a>
						</div>
					</div>
				</div>
				<div class="row content">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00001">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00001')">
												<a href="ViewBook?id=s00001"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00001', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00001', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00001"> <img alt="s00001"
								src="lib/image/s00001.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 1</div>
								<div class="price">20.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00002">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00002')">
												<a href="ViewBook?id=s00002"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00002', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00002', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00002"> <img alt="s00002"
								src="lib/image/s00002.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 2</div>
								<div class="price">50.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00003">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00003')">
												<a href="ViewBook?id=s00003"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00003', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00003', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00003"> <img alt="s00003"
								src="lib/image/s00003.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 3</div>
								<div class="price">35.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00004">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00004')">
												<a href="ViewBook?id=s00004"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00004', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00004', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00004"> <img alt="s00004"
								src="lib/image/s00004.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 4</div>
								<div class="price">60.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00005')">
												<a href="ViewBook?id=s00005"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00005', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00005', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00005"> <img alt="s00005"
								src="lib/image/s00005.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 5</div>
								<div class="price">45.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00006">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00006')">
												<a href="ViewBook?id=s00006"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00006', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00006', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00006"> <img alt="s00006"
								src="lib/image/s00006.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 6</div>
								<div class="price">25.000</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="bookshelf" style="margin: 1em 1em 1em 0em;">
				<div class="row descrip">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="title">Sách bán chạy</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
						<div class="view-detail">
							<a href="Categories">Xem chi tiết >></a>
						</div>
					</div>
				</div>
				<div class="row content">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00007">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00007')">
												<a href="ViewBook?id=s00007"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00007', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00007', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00007"> <img alt="s00007"
								src="lib/image/s00007.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 1</div>
								<div class="price">20.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00008">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00008')">
												<a href="ViewBook?id=s00008"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00008', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00008', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00008"> <img alt="s00008"
								src="lib/image/s00008.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 2</div>
								<div class="price">50.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00009">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00009')">
												<a href="ViewBook?id=s00009"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00009', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00009', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00009"> <img alt="s00009"
								src="lib/image/s00009.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 3</div>
								<div class="price">35.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00010">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00010')">
												<a href="ViewBook?id=s00010"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00010', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00010', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00010"> <img alt="s00010"
								src="lib/image/s00010.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 4</div>
								<div class="price">60.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00011')">
												<a href="ViewBook?id=s00011"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00011', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00011', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00011"> <img alt="s00011"
								src="lib/image/s00011.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 5</div>
								<div class="price">45.000</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00012">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right"
												onclick="gotoPage('ViewBook?id=s00012')">
												<a href="ViewBook?id=s00012"><i
													class="fa fa-info-circle"></i></a>
												<div class="content content-right">
													<span>Thông tin chi tiết</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right"
												style="transform: translateY(150%)">
												<i class="fa fa-cart-plus"
													onclick="addBookToCart('s00012', 1)"></i>
												<div class="content content-right">
													<span>Cho vào giỏ hàng</span>
												</div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc danger right"
												style="transform: translateY(300%)">
												<i class="fa fa-money" onclick="buyNow('s00012', 1)"></i>
												<div class="content content-right">
													<span>Mua ngay</span>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00012"> <img alt="s00012"
								src="lib/image/s00012.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 6</div>
								<div class="price">25.000</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</article>
	</div>

	<div>
		<div class="dialog" id="confirm-form" style="width: 60%;">
			<div class="header">
				<div class="title">Thanh toán</div>
				<a class="f-right close" href="#"><i
					class="fa fa-close"></i></a>
			</div>
			<ul class="content">
				<li class="item" style="height: 100px;">
					<span class="title">Tên người mua</span>
					<div class="detail">
						<input id="username" type="text" autocomplete="on" name="username" placeholder="Name..." value="" />
					</div>
				</li>
				<li class="item" style="height: 100px;">
					<span class="title">Địa chỉ giao hàng</span>
					<div class="detail">
						<input id="address" type="text" name="address" placeholder="Address..." value="" />
					</div>
				</li>
				<li class="item" style="height: 100px;">
					<span class="title">Số điện thoại</span>
					<div class="detail">
						<input id="phone" type="text" name="phone" placeholder="Phone..." value="" />
					</div>
				</li>
				<li class="item">
					<button class="button submit-button" onclick="addCart()">Đặt hàng</button>
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