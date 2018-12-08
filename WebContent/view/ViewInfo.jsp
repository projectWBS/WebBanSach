<%@page import="model.bean.Account"%>
<%@page import="model.bean.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="lib/css/sheet.css">
<link rel="stylesheet" type="text/css" href="lib/css/BEM_Style.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12">
				<div class="board">


					<%
						Object result = request.getAttribute("userProfile");
						Account userPro = (Account) result;
						if (result != null && result instanceof Account) {

							String TenDangNhap = userPro.getTenDangNhap();
							String TenTaiKhoan = userPro.getTenTaiKhoan();
							String ChucVu = userPro.getChucVu();
							String GioiTinh = userPro.getGioiTinh();
							String NgaySinh = userPro.getNgaySinh();
							String DiaChi = userPro.getDiaChi();
							String SDT = userPro.getSdt();
							String Email = userPro.getEmail();
							out.println(
									"<div class=\"board__header\"><i class=\"fa fa-user-circle\" style=\"font-size: 30px !important;\"></i> <span class=\"title\" style=\"position: relative; bottom: 5px; margin: 0em 1em;\">"
											+ TenDangNhap + "</span></div>");
							out.println("<ul class=\"board__main\">");
							out.println("<li class=\"board__main__title\"><span>Thông tin cá nhân</span></li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Họ tên:</span> <span class=\"board__main__detail__content\">"
											+ TenTaiKhoan + "</span></li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Chức năng người dùng:</span> <span class=\"board__main__detail__content\">"
											+ ChucVu + "</span></li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Giới tính:</span> <span class=\"board__main__detail__content\">"
											+ GioiTinh + "</span> </li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Ngày sinh:</span> <span class=\"board__main__detail__content\">"
											+ NgaySinh + "</span> </li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Địa chỉ:</span> <span class=\"board__main__detail__content\">"
											+ DiaChi + "</span> </li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Liên hệ:</span> <span class=\"board__main__detail__content\">"
											+ SDT + "</span></li>");
							out.println(
									"<li class=\"board__main__detail\"><span class=\"board__main__detail__lable\">Email:</span> <span class=\"board__main__detail__content\">"
											+ Email + "</span></li>");
						}
					%>
					<!--
						<div class="board__header">
						<i class="fa fa-user-circle" style="font-size: 30px !important;"></i>
						<span class="title"
							style="position: relative; bottom: 5px; margin: 0em 1em;">Username</span>
							
						</div>
						
								<ul class="board__main"> 
						<li class="board__main__title"><span>Thông tin cá nhân</span></li>
						<li class="board__main__detail"><span
							class="board__main__detail__lable">Họ tên:</span> <span
							class="board__main__detail__content">Tên người dùng</span></li>
						<li class="board__main__detail"><span
							class="board__main__detail__lable">Giới tính:</span> <span
							class="board__main__detail__content">Giới tính người dùng</span>
						</li>
						<li class="board__main__detail"><span
							class="board__main__detail__lable">Ngày sinh:</span> <span
							class="board__main__detail__content">Ngày sinh người dùng</span>
						</li>
						<li class="board__main__detail"><span
							class="board__main__detail__lable">Địa chỉ:</span> <span
							class="board__main__detail__content">Địa chỉ người dùng</span></li>
						<li class="board__main__detail"><span
							class="board__main__detail__lable">Liên hệ:</span> <span
							class="board__main__detail__content">SDT người dùng</span></li>
						<li class="board__main__detail"><span
							class="board__main__detail__lable">Email:</span> <span
							class="board__main__detail__content">Địa chỉ Email người
								dùng</span></li> -->
					</ul>
					<div class="button-modify"
						style="margin: 1em 0em; text-align: center;">
						<div class="button-rect forest" onclick="">
							<i class="fa fa-edit"></i> <span class="content-inner">Chỉnh
								sửa</span>
						</div>
					</div>

					<div class="button-modify"
						style="margin: 1em 0em; text-align: center;">
						<div class="button-rect cool" onclick="">
							<i class="fa fa-lock"></i> <span class="content-inner">Đổi
								mật khẩu</span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
				<div class="board QLDH_tbDonHang">
					<p
						style="font-size: medium; font-weight: bold; color: #ff5301; border-bottom: 1px groove; padding-bottom: 1em; margin: 0.5em 0em;">
						Lịch sử mua hàng</p>
					<table id="table">
						<tr style="font-weight: bold;">
							<th>Mã hóa đơn</th>
							<th>Thời gian mua</th>
							<th>Tình trạng</th>
							<th>Chi tiết</th>
							<th>Thao tác</th>
						</tr>
						<%
							Object resultOrder = request.getAttribute("userOrder");
							Order[] orders = (Order[]) resultOrder;
							if (resultOrder != null && resultOrder instanceof Order[]) {
								for (int i = 0; i < orders.length; i++) {
									String MaDonHang = orders[i].getMaHoaDon();
									String NgayIn = orders[i].getNgayIn();
									String TinhTrang = orders[i].getTinhTrang();
									String ThaoTac = "";
									boolean isChangeState = false;
									if (TinhTrang.equalsIgnoreCase("Chờ Duyệt")) {
										ThaoTac = "Hủy";
										isChangeState = true;
									}
									out.println("<tr><td>" + MaDonHang + "</td>");
									out.println("<td>" + NgayIn + "</td>");
									out.println("<td>" + TinhTrang + "</td>");
									out.println("<td><a onclick=\"openNewTab('UserCT-DonHang?id=" + MaDonHang
											+ "')\" style=\"cursor: pointer;\">Xem chi tiết</a></td>");
									out.println("<td><a onclick=\"changeStateOrder('"+ MaDonHang +"', "+ isChangeState +")\" style=\"cursor: pointer;\">" + ThaoTac + "</a></td></tr>");
								}
							}
						%>
						<!-- <tr>
							<td>HD0001</td>
							<td>11-20-2018</td>
							<td>Đang vận chuyển</td>
							<td><a onclick="" style="cursor: pointer;">Xem chi tiết</a></td>
						</tr> -->
					</table>
				</div>
			</div>
		</div>

		<!-- Phần footer cho trang Web -->
		<%@ include file="../comp/Footer.jsp"%>
		<script>
			function openNewTab(url) {
				window.open(url, '_blank');
			}
			function changeStateOrder(maHD, bool){
				if (bool){
					var url = window.location.href;
					$(".QLDH_tbDonHang").load(url + " #table", {
						maHD: maHD
					});
				}
			}
			function reloadKH() 
			{
				var URL = window.location.href;
				var searchU = document.getElementById("btnSearch").value;
				document.getElementById("btnSearch").value=searchU;

			}
			function refreshPage()
			{
				window.location.href=window.location.href
			} 
		</script>
</body>
</html>