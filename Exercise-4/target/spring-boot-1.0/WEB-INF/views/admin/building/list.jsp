<%--
  Created by IntelliJ IDEA.
  User: kasiz
  Date: 31/10/2024
  Time: 3:57 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingListUrl" value ="/admin/building-list"/>
<c:url var="buildingAPI" value ="/api/building"/>
<html style="font-family: inherit !important;">
<head>

    <title>Danh sách tòa nhà</title>

</head>
<body style="font-family: inherit;">
<div class="main-content">
  <div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
      <script type="text/javascript">
        try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
      </script>

      <ul class="breadcrumb">
        <li>
          <i class="ace-icon fa fa-home home-icon"></i>
          <a href="#">Home</a>
        </li>
        <li class="active">Building</li>
      </ul><!-- /.breadcrumb -->

      <div class="nav-search" id="nav-search">
        <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
        </form>
      </div><!-- /.nav-search -->
    </div>

    <div class="page-content">
      <div class="ace-settings-container" id="ace-settings-container">
        <div class="btn btn-app btn-xs btn-warning ace-settings-btn"
             id="ace-settings-btn">
          <i class="ace-icon fa fa-cog bigger-130"></i>
        </div>

        <div class="ace-settings-box clearfix" id="ace-settings-box">
          <div class="pull-left width-50">
            <div class="ace-settings-item">
              <div class="pull-left">
                <select id="skin-colorpicker" class="hide">
                  <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                  <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                  <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                  <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                </select>
              </div>
              <span>&nbsp; Choose Skin</span>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-navbar" />
              <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-sidebar" />
              <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-breadcrumbs" />
              <label class="lbl" for="ace-settings-breadcrumbs"> Fixed
                Breadcrumbs</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-rtl" />
              <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-add-container" />
              <label class="lbl" for="ace-settings-add-container">
                Inside
                <b>.container</b>
              </label>
            </div>
          </div><!-- /.pull-left -->

          <div class="pull-left width-50">
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-hover" />
              <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-compact" />
              <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2"
                     id="ace-settings-highlight" />
              <label class="lbl" for="ace-settings-highlight"> Alt. Active
                Item</label>
            </div>
          </div><!-- /.pull-left -->
        </div><!-- /.ace-settings-box -->
      </div><!-- /.ace-settings-container -->

      <div class="page-header">
        <h1>
          Danh sách tòa nhà
          <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            list building
          </small>
        </h1>
      </div><!-- /.page-header -->

      <!-- content building list -->
      <div class="row">
        <div class="col-xs-12 widget-container-col ui-sortable"
             >
          <div class="widget-box ui-sortable-handle" >
            <div class="widget-header" >
              <h5 class="widget-title">Tìm kiếm</h5>

              <div class="widget-toolbar" >

                <a href="#" data-action="fullscreen" class="orange2">
                  <i class="ace-icon fa fa-expand"></i>
                </a>

                <a href="#" data-action="reload">
                  <i class="ace-icon fa fa-refresh"></i>
                </a>

                <a href="#" data-action="collapse">
                  <i class="ace-icon fa fa-chevron-up"></i>
                </a>
              </div>
            </div>

            <div class="widget-body"  style="display: block;">
              <div class="widget-main" >
                <div>
                   <form:form id="listForm" action="${buildingListUrl}" method="GET" modelAttribute="modelSearch" >
                                      <form class="form-horizontal" role="form" >
                    <div class="form-group" >
                      <div class="col-xs-12">
                        <div class="row">
                          <div class="col-xs-6">
                            <label class="control-label"
                                   for="name"> Tên tòa nhà </label>
                            <form:input path="name" type="text" id="name" name="name"
                                   placeholder="Tên tòa nhà: "
                                   class="form-control"
                                   value="${modelSearch.name}"/>
                          </div>
                          <div class="col-xs-6">
                            <label class="control-label"
                                   for="floorArea">Diện tích sàn </label>

                            <form:input path="floorArea" type="number" id="floorArea" name="floorArea"
                                   placeholder="Diện tích sàn: "
                                   class="form-control" value ="${modelSearch.floorArea}"/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-4">
                            <div>
    <label for="district">Chọn quận</label>
    <form:select path="district" id="district" class="form-control">
        <form:option value="">Chọn quận</form:option> <!-- Placeholder option -->
        <form:options items="${districtCode}"></form:options>
    </form:select>
</div>
                          </div>
                          <div class="col-xs-3">
                            <label class="control-label"
                                   for="ward"> Phường </label>

                            <form:input path="ward" type="text" id="ward" name="ward"
                                   placeholder="Ward"
                                   class="form-control"
                                   value="${modelSearch.ward}"

                                   />

                          </div>
                          <div class="col-xs-5">
                            <label class="control-label"
                                   for="street"> Đường </label>

                            <form:input path="street" type="text" id="street" name="street"
                                   placeholder="Street"
                                   class="form-control"
                                   />

                          </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-4">
                            <label class="control-label"
                                   for="areaFrom"> Diện tích từ </label>

                            <form:input path="areaFrom" type="number" id="areaFrom" name="areaFrom"
                                   placeholder="Rent Area From: "
                                   class="form-control"
                                   value="${modelSearch.areaFrom}"
                                   />

                          </div>
                          <div class="col-xs-4">
                            <label class="control-label"
                                   for="areaTo"> Diện tích đến </label>

                            <form:input path="areaTo" type="number" id="areaTo" name="areaTo"
                                   placeholder="Rent Area To: "
                                   class="form-control"
                                   value="${modelSearch.areaTo}"/>

                          </div>
                          <div class="col-xs-4">
                            <label class="control-label"
                                   for="level"> Hạng </label>

                            <form:input path="level" type="number" id="level" name="level"
                                   placeholder="Level: "
                                   class="form-control"
                                   value="${modelSearch.level}"/>

                          </div>

                        </div>
                        <div class="row">
                          <div class="col-xs-3">
                            <label class="control-label"
                                   for="rentPriceFrom"> Giá thuê từ </label>

                            <form:input path="rentPriceFrom" type="number" id="rentPriceFrom" name="rentPriceFrom"
                                   placeholder="Rent Price From: "
                                   class="form-control"
                                   value="${modelSearch.rentPriceFrom}"
                                   />

                          </div>
                          <div class="col-xs-3">
                            <label class="control-label"
                                   for="rentPriceTo"> Giá thuê đến </label>

                            <form:input path="rentPriceTo" type="number" id="rentPriceTo" name="rentPriceTo"
                                   placeholder="Rent Price To: "
                                   class="form-control"
                                   value="${modelSearch.rentPriceTo}"
                                   />

                          </div>
                          <div class="col-xs-3">
                            <label class="control-label"
                                   for="numberOfBasement"> Số tầng hầm </label>

                            <form:input type="number" id="numberOfBasement"
                                   name="numberOfBasement"
                                   placeholder="Number Of Basement: "
                                   class="form-control"
                                   value="${modelSearch.numberOfBasement}"
                                   path="numberOfBasement"
                                   />

                          </div>
                          <div class="col-xs-3">
                            <label class="control-label"
                                   for="direction"> Hướng </label>

                            <form:input path="direction" type="text" id="direction" name="direction"
                                   placeholder="Direction: "
                                   class="form-control"
                                   value="${modelSearch.direction}"/>

                          </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-4">
                            <label class="control-label"
                                   for="managerName">Tên quản lý </label>

                            <form:input path="managerName" type="text" id="managerName" name="managerName"
                                   placeholder="Manager's name "
                                   class="form-control"
                                   value="${modelSearch.managerName}"
                                   />

                          </div>
                          <div class="col-xs-4">
                            <label class="control-label"
                                   for="managerPhone"> Số điện thoại quản lý </label>

                            <form:input path="managerPhone" type="text" id="managerPhone" name="managerPhone"
                                   placeholder="Manager's Phone Number: "
                                   class="form-control"
                                   value="${modelSearch.managerPhone}"/>

                          </div>
                          <div class="col-xs-4">
                            <div>
    <label for="staffId">Chọn nhân viên phụ trách</label>
    <form:select path="staffId" id="staffId" class="form-control">
        <form:option value="">Chọn nhân viên</form:option> <!-- Placeholder option -->
        <form:options items="${listStaffs}"/>
    </form:select>
</div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-12">
                            <div class="checkbox-group">
                            <form:checkboxes items="${typeCodes}" path="typeCode"/>
</div>

                          </div>
                        </div>
                        <button class="search-button" id="btnSearchBuilding">
                          <span class="search-icon"></span>
                          Search
                        </button>
                      </div>
                    </div>
                  </form>
                </form:form>
                </div>
            </div>
          </div>

        </div>
        <div class="row">

          <div class="col-xs-12" >
            <div class="buttonGroupAddAndDelete" style="margin: 8px 0;">
              <a href="/admin/building-edit">
                <button class="btn btn-white btn-info btn-bold">
                  <i class="ace-icon fa  fa-pencil-square-o bigger-120 blue"></i>
                  ADD
                </button>
              </a>
              <button class="btn btn-white btn-warning btn-bold" id="btnDeleteBuilding">
                <i class="ace-icon fa fa-trash-o bigger-120 orange"></i>
                Delete
              </button>
            </div>
            <table id="tableList"
                   class="table table-striped table-bordered table-hover">
              <thead>
              <tr>
                <th class="center">
                  Chọn tòa nhà
                </th>
                <th>Tên tòa nhà</th>
                <th>Địa chỉ</th>
                <th>Số tầng hầm</th>

                <th>
                  Tên quản lý
                </th>
                <th>Số diện thoại quản lý</th>
                <th>D.Tích sàn</th>
                <th>D.Tích trống</th>
                <th>D.Tích thuê</th>
                <th>Phí môi giới</th>
                <th>Thao tác</th>
              </tr>
              </thead>

              <tbody>
              <c:forEach var="item" items="${buildingList}">
              <tr >
                <td class="center">
                  <label class="pos-rel">
                    <input type="checkbox" class="ace" value="${item.id}">
                    <span class="lbl"></span>
                  </label>
                </td>
                 <td>${item.name}</td>
                <td>
                  <a href="#">${item.address}</a>
                </td>
                <td>${item.numberOfBasement}</td>
                <td class="hidden-480">${item.managerName}</td>
                <td>${item.managerPhone}</td>
                <td>${item.floorArea}</td>
                <td class="hidden-480">${item.emptyArea}</td>
                <td>${item.rentArea}</td>
                <td>${item.brokerageFee}</td>
                <td>
                  <div class="hidden-sm hidden-xs btn-group">
                    <button class="btn btn-xs btn-success" title="Giao tòa nhà"
                            onclick="assignmentBuilding(${item.id})">
                      <i class="ace-icon fa fa-key bigger-120"></i>
                    </button>

                    <a href="/admin/building-edit-${item.id}">
                      <button class="btn btn-xs btn-info" title="Sửa tòa nhà">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                      </button>
                    </a>

                    <a>
                    <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                      <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    </button>
                    </a>

                    <button class="btn btn-xs btn-warning">
                      <i class="ace-icon fa fa-flag bigger-120"></i>
                    </button>
                  </div>

                  <div class="hidden-md hidden-lg" >
                    <div class="inline pos-rel" >
                      <button class="btn btn-minier btn-primary dropdown-toggle"
                              data-toggle="dropdown" data-position="auto">
                        <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                      </button>

                      <ul
                              class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                        <li>
                          <a href="#" class="tooltip-info" data-rel="tooltip" title
                             data-original-title="View">
																					<span class="blue">
																						<i class="ace-icon fa fa-search-plus bigger-120"></i>
																					</span>
                          </a>
                        </li>

                        <li>
                          <a href="#" class="tooltip-success" data-rel="tooltip" title
                             data-original-title="Edit">
																					<span class="green">
																						<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																					</span>
                          </a>
                        </li>

                        <li>
                          <a href="#" class="tooltip-error" data-rel="tooltip" title
                             data-original-title="Delete">
																					<span class="red">
																						<i class="ace-icon fa fa-trash-o bigger-120"></i>
																					</span>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </td>
              </tr>
              </c:forEach>

              </tbody>
            </table>
          </div><!-- /.span -->
        </div>
      </div>
    </div><!-- /.page-content -->
  </div>
</div><!-- /.main-content -->
<div class="modal fade" id="buildingModal" tabindex="-1"
     aria-labelledby="assignmentBuildingModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="assignmentBuildingModal">Giao tòa nhà cho
          nhân viên</h5>
      </div>
      <div class="modal-body">
        <table class="table table-bordered" id="staffList">
          <thead>

          <th class="center">Chọn</th>
          <th class="center">Tên nhân viên</th>

          </thead>
          <tbody>

          </tbody>
        </table>
        <input type="hidden" name="Building" id="buildingId" >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"
                data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary"
                id="btn-assignment-building">Giao tòa nhà</button>
      </div>
    </div>
  </div>
</div>
</div>
<script>
  //gan buildingid cho hidden input
  function assignmentBuilding(buildingId){
    $('#buildingModal').modal();
    loadStaff(buildingId);
    $('#buildingId').val(buildingId);
  }
  function deleteBuilding(data){
    let buildingId = [data];
    deleteBuildings(buildingId);
  }
  $('#btnDeleteBuilding').click(e=>{
    e.preventDefault();
    let buildingIds = $('#tableList').find('tbody input[type=checkbox]:checked').map(function() {
      return $(this).val();
    }).get();
    deleteBuildings(buildingIds);
  })
  function deleteBuildings(data){
    $.ajax(
                    {
                      type:"DELETE",
                      url:"${buildingAPI}"+data,
                      data : JSON.stringify(data),
                      contentType:"application/json",
                      dataType:"JSON",
                      success: function(respond){
                        console.log("Success");

                      },
                      error: function(respond){
                        console.log("Failed");
                        console.log(respond )
                      }
                    }
            )
  }
</script>

<script>

    function loadStaff(buildingId){
         $.ajax(
                    {
                      type:"GET",
                      url: "${buildingAPI}/" + buildingId + "/staffs",

                      dataType:"JSON",
                      // contentType:"application/json",
                      // data : JSON.stringify(data),
                      success: function(response){
                        console.log(response);
                        let row ="";
                        $.each(response.data, function (index, item) {
                              row += '<tr class="center">';
                              row += '<td><input type="checkbox" id="checkBox' + item.staffId + '" value="' + item.staffId + '" class ="check-box-element"' + item.checked + '></td>';
                              row += '<td>' + item.fullName + '</td>';
                              row += '</tr>';
                          });
                        $('#staffList tbody').html(row);
                        console.info("Success");

                      },
                      error: function(response){
                        console.log("Failed");
                        window.location.href ="<c:url value="/admin/building-list?message=erorr" />";
                        console.log(response )
                      }
                    }
            )
    }


  $('#btn-assignment-building').click(e=>{
    e.preventDefault();
    let data = {};
    data['buildingId'] = $('#buildingId').val();
    let staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function() {
      return $(this).val();
    }).get();
    console.log(staffs);
    data['staffs'] = staffs;
    if(data['staffs']!=""){
        assignment(data);
    }
  })
  function assignment(data){
         $.ajax(
                    {
                      type:"POST",
                      url: "${buildingAPI}/" + "/asignment",

                      dataType:"JSON",
                      contentType:"application/json",
                      data : JSON.stringify(data),
                      success: function(response){
                        console.log(response);
                        console.info("Success");

                      },
                      error: function(response){
                        console.log("Failed");
                        window.location.href ="<c:url value="/admin/building-list?message=erorr" />";
                        console.log(response )
                      }
                    }
            )
    }

</script>

<%--<script>--%>
<%--  $('#btnSearchBuilding').click(function(e){--%>
<%--            console.log(e);--%>
<%--            e.preventDefault();--%>
<%--            let data = {};--%>
<%--            let typeCode =[];--%>
<%--            let formEditData = $('#listForm').serializeArray();--%>
<%--            $.each(formEditData,function(i,v){--%>
<%--              if(v.name!="typeCode[]"){--%>
<%--                data[`${v.name}`] = v.value;--%>
<%--              }--%>
<%--              else{--%>
<%--                typeCode.push(v.value);--%>
<%--              }--%>
<%--            })--%>
<%--            data['typeCode'] = typeCode;--%>
<%--            console.log(data);--%>
<%--            $.ajax(--%>
<%--                    {--%>
<%--                      type:"POST",--%>
<%--                      url:"",--%>
<%--                      data : JSON.stringify(data),--%>
<%--                      contentType:"application/json",--%>
<%--                      dataType:"JSON",--%>
<%--                      success: function(respond){--%>
<%--                        console.log("Success");--%>

<%--                      },--%>
<%--                      error: function(respond){--%>
<%--                        console.log("Failed");--%>
<%--                        console.log(respond )--%>
<%--                      }--%>
<%--                    }--%>
<%--            )--%>
<%--          }--%>


<%--  )--%>
<%--</script>--%>
<script>
  $('#btnSearchBuilding').click(function (e){
    console.log(e);
    e.preventDefault();
    $('#listForm').submit();
  })
</script>
</body>
</html>