<%@page import="model.bean.Comment"%>
<%@page import="model.bean.Image"%>
<%@page import="model.bean.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Thông tin chi tiết</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css" data-minify="1"/>
<link rel="stylesheet" type="text/css" href="lib/css/styleView.css"/>
<link rel="stylesheet" type="text/css" href="lib/css/style.css" />
<link rel="stylesheet" type="text/css" href="lib/css/BEM_Style.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
<script type="text/javascript" src="lib/js/ActionBook.js"></script>

</head>
<body>
	<%@ include file="../comp/Header.jsp" %>
	
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
								href=""> <strong itemprop="name">Xem chi tiết</strong>
							</a>
								<meta itemprop="position" content="3"></li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-9 col-sm-8 col-xs-12">
					<article>
						<div class="row">
							<div class="board">
								<div class="col-lg-1 col-md-1 hidden-sm hidden-xs hidden-ms" style="padding: 0px;">
									<div class="mini-image-bar">
										<div class="mini-image active" 
											onclick="zoomImage(this, 'zoom-image', 's00001.jpeg')"
											onmouseover="mouseHoverImage(this)"
											onmouseout="mouseOutImage(this)">
												<img alt="s00001" src="lib/image/s00001.jpeg">
										</div>
										<div class="mini-image" 
											onclick="zoomImage(this, 'zoom-image', 's00002.jpeg')"
											onmouseover="mouseHoverImage(this)"
											onmouseout="mouseOutImage(this)">
												<img alt="s00002" src="lib/image/s00002.jpeg">
										</div>
										<div class="mini-image" 
											onclick="zoomImage(this, 'zoom-image', 's00003.jpeg')"
											onmouseover="mouseHoverImage(this)"
											onmouseout="mouseOutImage(this)">
												<img alt="s00003" src="lib/image/s00003.jpeg">
										</div>
										<div class="mini-image" 
											onclick="zoomImage(this, 'zoom-image', 's00004.jpeg')"
											onmouseover="mouseHoverImage(this)"
											onmouseout="mouseOutImage(this)">
												<img alt="s00004" src="lib/image/s00004.jpeg">
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
									<div class="thumbnail">
										<%
											Object book = request.getAttribute("book");
											String pathImage = "";
											if (book != null && book instanceof Book) {
												Image pathsImage = ((Book)book).getImages();
												if (pathsImage != null){
													pathImage = "lib/image/" + pathsImage.getDuongDan();
												}
											}
											out.println("<img src=\"" + 
												pathImage + "\" id=\"zoom-image\" style=\"content: url('" + 
												pathImage + "');\">");
										%>
									</div>
								</div>
								<div class="col-lg-7 col-md-5 col-sm-6 col-xs-12">
									<div id="info">
									
										<%
											if (book == null) {
												out.println("<p class=\"error\">Mã sách không hợp lệ</p>");
											} else if (book instanceof Book) {
												out.println("<ul>");

												out.println("<li>");
												out.println("<div class=\"row\">");
												out.println("<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Tên sách: </strong></p></div>");
												out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book)book).getTenSach() + "</span></div>");
												out.println("</div>");
												out.println("</li>");

												out.println("<li>");
												out.println("<div class=\"row\">");
												out.println("<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Tác giả: </strong></p></div>");
												out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book)book).getTacGia() + "</span></div>");
												out.println("</div>");
												out.println("</li>");

												out.println("<li>");
												out.println("<div class=\"row\">");
												out.println("<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Giá bán: </strong></p></div>");
												out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span>" + ((Book)book).getGiaBan() + "</span></div>");
												out.println("</div>");
												out.println("</li>");
												
												out.println("<li>");
												out.println("<div class=\"row\">");
												out.println("<div class=\"col-lg-3 col-md-4 col-sm-5 col-xs-3\"><p><strong>Đánh giá: </strong></p></div>");
												out.println("<div class=\"col-lg-9 col-md-8 col-sm-7 col-xs-9\"><span style=\"margin: 5px 0px;\" id=\"rating\">");
												
												//Đánh giá sản phẩm
												int danhGia = Integer.parseInt(request.getAttribute("rate").toString());
												int temp = danhGia;
												for (int i = 0; i<5; i++){
													if (temp > 0){
														out.println("<i class=\"fa fa-star\" style=\"display: inline-block; color:gold; cursor:default;\" id=\"star\"></i>");
														temp--;
													} else {
														out.println("<i class=\"fa fa-star\" style=\"display: inline-block; cursor: default;\" id=\"star\"></i>");
													}
												}
												out.println("<span>(" + danhGia + "/5 sao)</span>");
												out.println("</span></div></div></li></ul>");
											}
										%>
									</div>

									<div class="row" style="margin-top: 20px;">
										<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12" id="countInput">
											<input type="number" name="quantity" min="1" max="100" value="1" id="count">
										</div>
										<div class="col-lg-10 col-md-5 col-sm-8 col-xs-12">
											<div class="button-modify">
												<%
													if (book != null){
														String maSach = ((Book)book).getMaSach();
														out.println("<div class=\"button-rect forest\" onclick='addBookToCart(\""  + maSach + "\", getNumberBuy());'>");
														out.println("<i class=\"fa fa-cart-plus\"></i>");
														out.println("<span class=\"content content-inner\">Cho vào giỏ</span></div>");
													}
												%>
											</div>
										</div>
										<div class="col-lg-12 col-md-4 col-sm-1 hidden-xs"></div>
									</div>
								</div>

								<div class="col-ms-12 figureBook">
									<p class="header">Giới thiệu tác phẩm</p>
									<%
										if (book != null && book instanceof Book) {
											String figure = ((Book)book).getMoTa();
											if (figure.length() > 0) out.println("<p class=\"content\">" + figure + "</p>");
											else out.println("<p class=\"content\">Đang cập nhật nội dung</p>");
										}
									%>
								</div>
							</div>
						</div>
					</article>
				</div>
			
				<div class="col-md-3 col-sm-4 col-xs-12">
					<div class="board mini-board">
						<div class="title">Sản phẩm tương tự</div>
						<ul class="content">
							<li class="item">
								<img src="lib/image/s00002.jpeg"></img>
								<span>Sách số 2</span>
							</li>
							<li class="item">
								<img src="lib/image/s00003.jpeg"></img>
								<span>Sách số 3</span>
							</li>
							<li class="item">
								<img src="lib/image/s00004.jpeg"></img>
								<span>Sách số 4</span>
							</li>
							<li class="item">
								<img src="lib/image/s00005.jpeg"></img>
								<span>Sách số 5</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="board" id="board_comment">
					<p class="board__title">Đánh giá</p>
					<%
						Object comments = request.getAttribute("comment");
						if (comments != null){
							Comment[] c = (Comment[])comments;
							int danhGia = Integer.parseInt(request.getAttribute("rate").toString());
							for(int i=0; i<c.length; i++){
								Comment comment = c[c.length - 1 - i];
								
								out.println("<ul class=\"comment\">");
								out.println("<li class=\"comment__item\">");
								out.println("<span class=\"comment__item__icon\"><i class=\"fa fa-user\" style=\"cursor: default;\"></i></span>");
								out.println("<span class=\"comment__item__name\">" + comment.getTenNguoiDung() + "</span>");
								out.println("<span class=\"comment__item__time\">" + comment.getThoiGian() + "</span>");
								out.println("<span class=\"comment__item__rate\">Đã đánh giá: " + comment.getDanhGia() + "/5 sao</span>");
								out.println("<span class=\"comment__item__content\">" + comment.getNoiDung() + "</span>");
								out.println("</li>");
								out.println("</ul>");
							}
						}
					%>
				</div>

				<div class="board">
					<p class="board__title">Thêm đánh giá</p>
					<div class="comment__new">
						<%
							Account account = null;
							if ((account = (Account)request.getSession().getAttribute("User")) != null){
								out.println("<input type=\"text\" value=\"" + account.getTenTaiKhoan() + "\" placeholder=\"Tên của bạn...\" class=\"comment__new__name\" id=\"name\" disabled=\"disabled\"></input>");
							} else {
								out.println("<input type=\"text\" value=\"\" placeholder=\"Tên của bạn...\" class=\"comment__new__name\" id=\"name\"></input>");
							}
							
							out.println("<div class=\"comment__new__rate\">");
							out.println("<span style=\" margin: 0em 1em; font-weight: bold;\">  Đánh giá của bạn:</span>");
							out.println("<span id=\"danhGia\" style=\"margin: 5px 0px;\">");
							for (int i=0; i<5; i++){
								out.println("<i class=\"fa fa-star\" style=\"display: inline-block; color:gold; cursor:default;\" onclick=\"setUserRate("+ (i + 1) +")\"></i>");
							}
							out.println("</span></div>");
						%>
						
						<textarea rows="5" placeholder="Nội dung bình luận..." class="comment__new__content" id="comment"></textarea>
						<div class="comment__new__button button-modify">
							<div class="button-rect cool" style="cursor: pointer;" onclick="sendCommentOfUser(false)">
								<i class="fa fa-send"></i>
								<span class="content-inner">Gửi đánh giá</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<%@ include file="../comp/Footer.jsp" %>
</body>
</html>