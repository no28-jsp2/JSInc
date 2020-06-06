<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>JS.Inc</title>
</head>

<body>
	<section id="container">
		<jsp:include page="../default/header.jsp" />
		<jsp:include page="../default/sidebar.jsp" />
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<h3>
					<i class="fa fa-angle-right"></i> 주소록
				</h3>
				<div class="row mb">
					<!-- page start-->
					<div class="content-panel">
						<div class="adv-table">
							<table cellpadding="0" cellspacing="0" border="0"
								class="display table table-bordered" id="hidden-table-info">
								<thead>
									<tr>
										<th>이름</th>
										<th>사번</th>
										<th>직급</th>
										<th>부서</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${mg }" var="dto_mem">
										<tr class="gradeA">
											<td><img src="resources/img${dto_mem.img}" class="img-circle" width="20">&nbsp;${dto_mem.name }</td>
											<td>${dto_mem.empNo }</td>
											<td>${dto_mem.rank }</td>
											<td>${dto_mem.dep }</td>
											<td>${dto_mem.userEmail }</td>
										</tr>
									</c:forEach>
									<c:forEach items="${dp }" var="dto_mem">
										<tr class="gradeC">
											<td><img src="resources/img${dto_mem.img}" class="img-circle" width="20">&nbsp;${dto_mem.name }</td>
											<td>${dto_mem.empNo }</td>
											<td>${dto_mem.rank }</td>
											<td>${dto_mem.dep }</td>
											<td>${dto_mem.userEmail }</td>
										</tr>
									</c:forEach>
									<c:forEach items="${at }" var="dto_mem">
										<tr class="gradeU">
											<td><img src="resources/img${dto_mem.img}" class="img-circle" width="20">&nbsp;${dto_mem.name }</td>
											<td>${dto_mem.empNo }</td>
											<td>${dto_mem.rank }</td>
											<td>${dto_mem.dep }</td>
											<td>${dto_mem.userEmail }</td>
										</tr>
									</c:forEach>
									<c:forEach items="${ql }" var="dto_mem">
										<tr class="gradeX">
											<td><img src="resources/img${dto_mem.img}" class="img-circle" width="20">&nbsp;${dto_mem.name }</td>
											<td>${dto_mem.empNo }</td>
											<td>${dto_mem.rank }</td>
											<td>${dto_mem.dep }</td>
											<td>${dto_mem.userEmail }</td>
										</tr>
									</c:forEach>
									<c:forEach items="${os }" var="dto_mem">
										<tr class="gradeA">
											<td><img src="resources/img${dto_mem.img}" class="img-circle" width="20">&nbsp;${dto_mem.name }</td>
											<td>${dto_mem.empNo }</td>
											<td>${dto_mem.rank }</td>
											<td>${dto_mem.dep }</td>
											<td>${dto_mem.userEmail }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- page end-->
				</div>
				<!-- /row -->
			</section>
			<!-- /wrapper -->
		</section>
		<!-- /MAIN CONTENT -->
		<!--main content end-->
		<jsp:include page="../default/footer.jsp"/>
	</section>
	<!-- js placed at the end of the document so the pages load faster -->
	<script src="resources/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript" language="javascript" src="resources/lib/advanced-datatable/js/jquery.js"></script>
	<script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
	<script src="resources/lib/jquery.scrollTo.min.js"></script>
	<script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript" src="resources/lib/advanced-datatable/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="resources/lib/advanced-datatable/js/DT_bootstrap.js"></script>
	<!--common script for all pages-->
	<script src="resources/lib/common-scripts.js"></script>
	
	<!--script for this page-->
	<script type="text/javascript">
		/* Formating function for row details 
		function fnFormatDetails(oTable, nTr) {
			var aData = oTable.fnGetData(nTr);
			var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
			sOut += '<tr><td>Rendering engine:</td><td>' + aData[2] + '</td></tr>';
			sOut += '</table>';
			return sOut;
		}
		*/
		$(document).ready(
			function() {
				var nCloneTh = document.createElement('th');
				var nCloneTd = document.createElement('td');
				/*
				nCloneTd.innerHTML = '<img src="resources/lib/advanced-datatable/images/details_open.png">';
				nCloneTd.className = "center";
				*/
				
				$('#hidden-table-info thead tr').each(
					function() {
						this.insertBefore(nCloneTh,this.childNodes[0]);
					}
				);

				$('#hidden-table-info tbody tr').each(
					function() {
						this.insertBefore(nCloneTd.cloneNode(true),this.childNodes[0]);
					}
				);
				
				/*
				 * Initialse DataTables, with no sorting on the 'details' column
				 */
				 
				var oTable = $('#hidden-table-info').dataTable({
					"aoColumnDefs" : [ {"bSortable" : false, "aTargets" : [ 0 ]} ], "aaSorting" : [ [ 1, 'asc' ] ]
				});

				/* Add event listener for opening and closing details
				 * Note that the indicator for showing which row is open is not controlled by DataTables,
				 * rather it is done here
				 */
				
				 /*
				$('#hidden-table-info tbody td img').live('click',
					function() {
						var nTr = $(this).parents('tr')[0];
						if (oTable.fnIsOpen(nTr)) {
							this.src = "resources/lib/advanced-datatable/images/details_open.png";
							oTable.fnClose(nTr);
						} else {
							this.src = "resources/lib/advanced-datatable/images/details_close.png";
							oTable.fnOpen(nTr,fnFormatDetails(oTable,nTr),'details');
						}
					}
				);*/
			}
		);
	</script>
</body>

</html>
