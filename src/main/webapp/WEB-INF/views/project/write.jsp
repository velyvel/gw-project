<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
<%@page import="com.gw.dto.DeptDto"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Project Add</title>


  <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
  <!-- DatePicker -->
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<!-- Site wrapper -->
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/gw-project/resources/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>
  
  <!-- Navbar -->
  <jsp:include page="/WEB-INF/views/modules/navbar.jsp" />	
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <jsp:include page="/WEB-INF/views/modules/sidebar.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Project Add</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/gw-project/">Home</a></li>
              <li class="breadcrumb-item active"><a href="/gw-project/project/list">List</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <form id="projectAddForm" action="write" method="post" enctype="multipart/form-data">
    <input type="hidden" name="sche_writer" value="${ loginuser.mem_id_no }">
    
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">PROJECT</h3>

            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="sche_title">???????????? ??????(?????? ??????)</label>
                <input type="text" style="background: lightgray" name="sche_title" id="sche_title" class="form-control" placeholder="???????????? ??????" autocomplete="off">
              </div>
              <div class="form-group">
                <label for="sche_content">???????????? ??????(?????? ??????)</label>
                <textarea style="background: lightgray" name="sche_content" id="sche_content" class="form-control" rows="6" placeholder="??????????????? ?????? ??????"></textarea>
              </div>
              <div class="form-group">
                <label for="sche_status">???????????? ?????? ??????</label>
                <select name="sche_status" id="sche_status" class="form-control custom-select">
                  <option>On Hold</option>
                  <option selected>In Progress</option>
                  <option>Success</option>
                </select>
              </div>
              <div class="form-group">
                <label for="sche_client">?????? ???</label>
                <input type="text" name="sche_client" id="sche_client" class="form-control" placeholder="?????? ?????? ???????????????." autocomplete="off">
              </div>
              <div class="form-group">
                <label for="sche_client_phone">?????? ?????????</label>
                <input type="text" name="sche_client_phone" id="sche_client_phone" class="form-control" placeholder="?????? ???????????? ???????????????." maxlength="13" autocomplete="off">
              </div>
              <div class="form-group">
                <label for="sche_client_email">?????? ?????????</label>
                <input type="text" name="sche_client_email" id="sche_client_email" class="form-control" placeholder="?????? ???????????? ???????????????." autocomplete="off">
              </div>
              
              <div class="form-group">
                <label for="sche_start_date">???????????? ?????? ??????</label>
                <input type="text" name="sche_start_date" id="sche_start_date" class="form-control" readonly="readonly" placeholder="???????????? ??????" autocomplete="off">
              </div>
              <div class="form-group">
                <label for="sche_end_date">???????????? ?????? ??????</label>
                <input type="text" name="sche_end_date" id="sche_end_date" class="form-control" readonly="readonly" placeholder="???????????? ??????" autocomplete="off">
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <div class="col-md-6">
          <div class="card card-secondary">
            <div class="card-header">
              <h3 class="card-title">BUDGET</h3>

			<!-- ???????????? ?????? ?????? input??? ???????????? ?????? ????????? ?????? -->
            </div>
            <div class="card-body">
              <div class="form-group">
                <label for="sche_leader">???????????? ?????????(?????? ??????)</label>
              	<input type="hidden" name="dept_id_no" id="dept_id_no" class="form-control">
                <input type="hidden" name="sche_leader" id="sche_leader" class="form-control">
                <input type="text" name="sche_leader_text" id="sche_leader_text" class="form-control" readonly="readonly" placeholder="???????????? ???????????????" autocomplete="off">
              </div>
              <div class="form-group">
                <label for="sche_team">???????????? ??????(?????? ??????)</label>
                <input type="hidden" name="sche_team" id="sche_team" class="form-control">
                <input type="text" name="sche_team_text" id="sche_team_text" class="form-control" readonly="readonly" placeholder="???????????? ???????????????." autocomplete="off">
              </div>
              <div class="form-group">
                <label for="sche_estimated_budget">?????????(?????? ?????? ??????)</label>
                <input type="number" name="sche_estimated_budget" id="sche_estimated_budget" class="form-control" step="1" value="0">
              </div>
              <div class="form-group">
                <label for="sche_spent_budget">?????? ??? ??????(?????? ?????? ??????)</label>
                <input type="number" name="sche_spent_budget" id="sche_spent_budget" class="form-control" step="1" value="0">
              </div>
              <div class="form-group">
                <label for="sche_estimated_duration">???????????? ?????? ??????(??? ?????? ??????)</label>
                <input type="number" name="sche_estimated_duration" id="sche_estimated_duration" class="form-control" step="1" value="0">
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">Files</h3>
			  
            </div>
            <div class="card-body p-0">
              <table class="table">
                <thead>
                  <tr>
                    <th>?????? ??????</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>

                  <tr>
                  <td>
                    <input type="file" name="attach" class="btn btn-block btn-default btn-flat float-right" multiple>
                  </td>
                  </tr>
                  

                </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <a id="cancel_tolist" class="btn btn-secondary float-right">Cancel</a>
          <!-- ADD PROJECT -->
          <button type="button" class="btn btn-primary float-right" id="project_add_button" >???????????? ??????</button>
        </div>
      </div>
      
      
      <!-- ????????? dept member modal -->
      <div class="modal fade" id="modal-leader">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">???????????? ?????????</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              	<div class="col-3">
	                <div class="form-group">
	                    <select name="sche_dept" class="select-dept" style="width: 100%;">
	                        <option hidden="" disabled="disabled" selected="selected" value="">??????</option>
	                        <c:forEach var="dept" items="${ depts }">
	                        <option value="${ dept.dept_id_no }">${ dept.dept_name }</option>
	                        </c:forEach>
	                    </select>
	                </div>
	            </div>
	            <div class="col-3">
	                <div class="form-group">
	                    <select name="sche_leader" class="select-leader" id="select_sche_leader" style="width: 200px;">	                       
	                    </select>
	                </div>
	            </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" name="input-leader" data-dept_id_no="${ dept.dept_id_no }">??????</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <!-- ?????? dept member modal -->
      <div class="modal fade" id="modal-team">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">???????????? ??????</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="col-3">
	                <div class="form-group">
	                    <!-- <label>??????&nbsp;:</label> -->
	                    <select name="sche_dept2" class="select-dept2" style="width: 100%;">
	                        <option hidden="" disabled="disabled" selected="selected" value="">??????</option>
	                        <c:forEach var="dept" items="${ depts }">
	                        <option value="${ dept.dept_id_no }">${ dept.dept_name }</option>
	                        </c:forEach>
	                    </select>
	                </div>
	            </div>
	            <div class="col-3">
	                <div class="form-group">
	                    <!-- <label>??????&nbsp;:</label> -->
	                    <select name="sche_team" class="select-team" id="select_sche_team" style="width: 200px;">
	                    </select>
	                </div>
	            </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" name="input-team">??????</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
      	<!-- PRIMARY MODAL -->
	  <div class="modal fade" id="modal-primary" data-bs-backdrop="static">
        <div class="modal-dialog">
          <div class="modal-content bg-primary">
            <div class="modal-header">
              <h4 class="modal-title">Project Add</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>??????????????? ?????????????????????????</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-outline-light">Add Project</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
    </section>
    </form>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


	<!-- WARNING MODAL 1 -->
	  <div class="modal fade" id="modal-warning1" data-bs-backdrop="static">
        <div class="modal-dialog">
          <div class="modal-content bg-warning">
            <div class="modal-header">
              <h4 class="modal-title">Warning</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>????????????????????? ?????? ???????????????.</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Return</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <!-- WARNING MODAL 2 -->
	  <div class="modal fade" id="modal-warning2" data-bs-backdrop="static">
        <div class="modal-dialog">
          <div class="modal-content bg-warning">
            <div class="modal-header">
              <h4 class="modal-title">Warning</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>???????????? ?????? ??????????????? ???????????????.</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Return</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <!-- WARNING MODAL 3 -->
	  <div class="modal fade" id="modal-warning3" data-bs-backdrop="static">
        <div class="modal-dialog">
          <div class="modal-content bg-warning">
            <div class="modal-header">
              <h4 class="modal-title">Warning</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>????????? ???????????????.</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-outline-dark" data-dismiss="modal" name="date_null">Return</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <!-- WARNING MODAL 4 -->
	  <div class="modal fade" id="modal-warning4" data-bs-backdrop="static">
        <div class="modal-dialog">
          <div class="modal-content bg-warning">
            <div class="modal-header">
              <h4 class="modal-title">Warning</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>????????? ?????????????????????.</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Return</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      <!-- WARNING MODAL 5 -->
	  <div class="modal fade" id="modal-warning5" data-bs-backdrop="static">
        <div class="modal-dialog">
          <div class="modal-content bg-warning">
            <div class="modal-header">
              <h4 class="modal-title">Warning</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>????????? ???????????????.</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Return</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
  <!-- footer -->
  <jsp:include page="/WEB-INF/views/modules/footer.jsp" />
  <!-- /.footer -->

  <!-- Control Sidebar -->
  <jsp:include page="/WEB-INF/views/modules/control-sidebar.jsp" />
  <!-- /.control-sidebar -->
  
</div>
<!-- ./wrapper -->
      

<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
	
	$(function() {
		
		// date
		$.datepicker.setDefaults({
  			dateFormat: 'yy-mm-dd',
  			prevText: '?????? ???',
  			nextText: '?????? ???',
  			monthNames: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
  			monthNamesShort: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
  			dayNames: ['???', '???', '???', '???', '???', '???', '???'],
  			dayNamesShort: ['???', '???', '???', '???', '???', '???', '???'],
  			dayNamesMin: ['???', '???', '???', '???', '???', '???', '???'],
  			showMonthAfterYear: true,
  			yearSuffix: '???'
		});
		
		$('#sche_start_date').datepicker();
		$('#sche_end_date').datepicker();
		
		// var date
		var startDate;
		var endDate;
		var change = /[^0-9]/g;
		var startDateChanged;
		var endDateChanged;
		var today = new Date();   

		// startDate var
		$('#sche_start_date').on('change', function(event) {
				
			event.preventDefault();
			
			startDate = $(this).val();
			startDateChanged = startDate.replace(change, "");
		});
		
		// endDate var??? startDate??? ???????????? ???????????? ?????? ???????????? ?????? ?????? & today ???????????? ???????????? ?????? endDate ?????? ??????
		$('#sche_end_date').on('change', function(event) {
			
			event.preventDefault();
			
			endDate = $(this).val();
			endDateChanged = endDate.replace(change, "");
			
			var year = today.getFullYear(); 
			var month = today.getMonth() + 1; 
			var date = today.getDate();  
			var regDate = year + '/' + month + '/' + date;
			var regDateChanged = regDate.replace(change, "");
			
			if (startDateChanged > endDateChanged || endDateChanged < regDateChanged) {
				$('#modal-warning3').modal('show');
			}
		});
		
		// ????????? input ??????????????? ????????? ?????? ?????????
		$('button[name=date_null]').on('click', function(event) {

			event.preventDefault();
			
			document.getElementById("sche_end_date").value = "";
		});
		
		// input ?????? value ??????
		$('input[name=sche_client_phone]').on('keyup', function(event) {
			
			event.preventDefault();
			
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
		
		// ????????? ????????? ????????? ?????? warning-modal
		$('input[name=sche_client_phone]').on('blur', function(evnet) {
			
			event.preventDefault();
			
			var phoneNum = $(this).val();
			if (phoneNum.length < 9 && phoneNum.length > 0) {
				
				$('#modal-warning4').modal('show');
			};
		});
		
		// list show
		$("a[id=cancel_tolist]").on("click", function(event) {
			
			event.preventDefault();
			
			$('#modal-warning1').modal('hide');
			$('#modal-warning2').modal('hide');
			
			setTimeout(() => location.href='list?pageNo=1', 200);
		});
		
		// ???????????? ?????? ??? ?????? ?????? ??????
		$('#project_add_button').on("click", function(event) {
			
			event.preventDefault();
			
			var scheTitle = $('input[name=sche_title]').val();
			var scheContent = $('textarea[name=sche_content]').val();
			var scheNo1 = $('input[name=sche_estimated_budget]').val();
			var scheNo2 = $('input[name=sche_spent_budget]').val();
			var scheNo3 = $('input[name=sche_estimated_duration]').val();
			var inputLeader = $('input[name=sche_leader_text]').val();
			var inputTeam = $('input[name=sche_team_text]').val();
			
			if (scheTitle.length == 0 || scheContent.length == 0 || inputLeader.length == 0 || inputTeam.length == 0) {
				
				$('#modal-warning1').modal('show');
				
			} else if (isNaN(scheNo1) == true || isNaN(scheNo2) == true || isNaN(scheNo3) == true) {
				
				$('#modal-warning2').modal('show');
			
			} else {
				
				$('#modal-primary').modal('show');
			}
		});
		
		// var Leader
		var leaderMemberId;
		var leaderMemberName;
		var deptNo;
		
		// ????????? : ?????? ?????? ?????? modal show
		$('#projectAddForm').on('click', 'input[id=sche_leader_text]', function(event) {
			
			event.preventDefault();
			
			$('#modal-leader').modal('show');
		});
		
		// ????????? : ?????? ?????? ?????? modal function
		$('select[name=sche_dept]').on('change', function(event) {
			
			event.preventDefault();
			
			deptNo = $(this).val();
			
			$.ajax({
				"url": "member_list_by_dept_id_no",
				"method": "get",
				"data" : "deptNo=" + deptNo,
				"success": function(data, status, xhr) {
					$('.select-leader').empty();
					$('.select-leader').append('<option value="" selected disabled="disabled">????????? ???</option>');
					$.each(data, function(idx, member) {
						$('.select-leader').append('<option value="' + member.mem_id_no + '">' + member.memberDetail.mem_detail_name + '</option>');
					});
				},
				"error": function(xhr, status, data) {
					alert('??????');
				}
			});
		});
		
		// option??? ???????????? ?????? ?????? ??????
		$('select[name=sche_leader]').on('change', function(event) {
			
			event.preventDefault();
			
			leaderMemberId = $(this).val();
			leaderMemberName = $('#select_sche_leader option[value=' + leaderMemberId + ']').text();
			
		});
		
		// ????????? : ?????? ?????? ?????? input
		$('button[name=input-leader]').on('click', function(event) {
			
			event.preventDefault();
			
			if (leaderMemberName == null) {
				$('#modal-warning5').modal('show');
			} else {
				$('input[name=sche_leader]').val(leaderMemberId);
				$('input[name=sche_leader_text]').val(leaderMemberName);
				$('input[name=dept_id_no]').val(deptNo);
				$('#modal-leader').modal('hide');		
			}
		});
		
		////////////////////////////////////////////////
		// ????????? ?????? ??????
		// 1. DB??? pro_schedule ???????????? ?????? ????????? ??????
		// 2. DB??? ????????? ????????? ???????????? ????????????
		
		// var Team
		var teamMemberId;
		var teamMemberName;
		
		// ?????? : ?????? ?????? ?????? modal show
		$('#projectAddForm').on('click', 'input[id=sche_team_text]', function(event) {
			
			event.preventDefault();
			
			$('#modal-team').modal('show');
		});
		
		// ?????? : ?????? ?????? ?????? modal function
		$('select[name=sche_dept2]').on('change', function(event) {
			
			event.preventDefault();
			
			const deptNo = $(this).val();
			
			$.ajax({
				"url": "member_list_by_dept_id_no",
				"method": "get",
				"data" : "deptNo=" + deptNo,
				"success": function(data, status, xhr) {
					$('.select-team').empty();
					$('.select-team').append('<option value="" selected disabled="disabled">?????? ???</option>');
					$.each(data, function(idx, member) {
						$('.select-team').append('<option value="' + member.mem_id_no + '">' + member.memberDetail.mem_detail_name + '</option>');
					});
				},
				"error": function(xhr, status, err) {
					alert('??????');
				}
			});
		});

		// option??? ???????????? ?????? ?????? ??????
		$('select[name=sche_team]').on('change', function(event) {
			
			event.preventDefault();
			
			teamMemberId = $(this).val();
			teamMemberName = $('#select_sche_team option[value=' + teamMemberId + ']').text();
		});
		
		// ?????? : ?????? ?????? ?????? input
		$('button[name=input-team]').on('click', function(event) {
			
			event.preventDefault();
			
			if (teamMemberName == null) {
				$('#modal-warning5').modal('show');
			} else {
				$('input[name=sche_team]').val(teamMemberId);
				$('input[name=sche_team_text]').val(teamMemberName);
				$('#modal-team').modal('hide');
			}
		});
		
		

		
		
		
		
		
	}); 


	
</script>
</body>
</html>
