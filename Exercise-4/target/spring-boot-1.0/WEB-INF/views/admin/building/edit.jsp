<%--
  Created by IntelliJ IDEA.
  User: kasiz
  Date: 31/10/2024
  Time: 3:57 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingAPI" value ="/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
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
                                    <input type="text" placeholder="Search ..."
                                           class="nav-search-input"
                                           id="nav-search-input"
                                           autocomplete="off" />
                                    <i
                                            class="ace-icon fa fa-search nav-search-icon"></i>
                                </span>
        </form>
      </div><!-- /.nav-search -->
    </div>

    <div class="page-content">

      <div class="page-header">
        <h1>
          Thêm tòa nhà
          <small>
            <i
                    class="ace-icon fa fa-angle-double-right"></i>
            add building
          </small>
        </h1>
      </div><!-- /.page-header -->

      <!-- content building list -->
      <div class="row">
        <div
                class="col-xs-12 widget-container-col ui-sortable"
                bis_skin_checked="1">
          <div class="widget-box ui-sortable-handle"
               bis_skin_checked="1">

            <div class="widget-body"
                 bis_skin_checked="1"
                 style="display: block;">
              <div class="widget-main"
                   bis_skin_checked="1">
                <div>
                  <form:form modelAttribute="buildingEdit" method="GET" id="listForm">
                    <form class="form-horizontal"
                        role="form" id="form-edit">
                    <div class="form-group"
                         bis_skin_checked="1">
                      <div class="col-xs-12">
                        <div class="row">
                          <div
                                  class="col-xs-6">
                            <label
                                    class="control-label"
                                    for="name">
                              Tên tòa
                              nhà
                            </label>
                            <form:input
                                    path="name"
                                    type="text"
                                    id="name"
                                    placeholder="Tên tòa nhà: "
                                    class="form-control"
                                    name="name"
                                     value=""/>
                          </div>
                          <div
                                  class="col-xs-6">
                            <label
                                    class="control-label"
                                    for="floorArea">Diện
                              tích sàn
                            </label>

                            <form:input path="floorArea"
                                    type="number"
                                    id="floorArea"
                                    placeholder="Diện tích sàn: "
                                    class="form-control"
                                    name="floorArea"
                                     value=""/>
                          </div>
                        </div>
                        <div class="row">
                          <div
                                  class="col-xs-4">
                            <div>
                                  <label for="district">Chọn quận</label>
                                   <form:select path="district" id="district" class="form-control">
                                    <form:option value="">Chọn quận</form:option> <!-- Placeholder option -->
                                    <form:options items="${districtCode}"></form:options>
                                   </form:select>
                            </div>
                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="ward">
                              Phường
                            </label>

                            <form:input path="ward"
                                    type="text"
                                    id="ward"
                                    placeholder="Ward"
                                    class="form-control"
                                    name="ward"
                                     value=""/>

                          </div>
                          <div
                                  class="col-xs-5">
                            <label
                                    class="control-label"
                                    for="street">
                              Đường
                            </label>

                            <form:input path="street"
                                    type="text"
                                    id="street"
                                    placeholder="Street"
                                    class="form-control"
                                    name="street"
                                     value=""/>

                          </div>
                        </div>
                        <div class="row">
                          <div
                                  class="col-xs-4">
                            <label
                                    class="control-label"
                                    for="rentArea">
                              Diện
                              tích
                              Thuê
                            </label>

                            <form:input path="rentArea"
                                    type="number"
                                    id="rentArea"
                                    placeholder="Rent Area: "
                                    class="form-control"
                                    name="rentArea"  value=""/>

                          </div>
                          <div
                                  class="col-xs-4">
                            <label
                                    class="control-label"
                                    for="level">
                              Hạng
                            </label>

                            <form:input path="level"
                                    type="number"
                                    id="level"
                                    placeholder="Level: "
                                    class="form-control"
                                    name="level" value=""/>

                          </div>
                          <div
                                  class="col-xs-4">
                            <label
                                    class="control-label"
                                    for="rentPrice">
                              Giá thuê
                            </label>

                            <form:input path="rentPrice"
                                    type="number"
                                    id="rentPrice"
                                    placeholder="Rent Price: "
                                    class="form-control"
                                    name="rentPrice" value=""/>

                          </div>
                        </div>
                        <div class="row">

                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="numberOfBasement">
                              Số tầng
                              hầm
                            </label>

                            <form:input path="numberOfBasement"
                                    type="number"
                                    id="numberOfBasement"
                                    placeholder="Number Of Basement: "
                                    class="form-control"
                                    name="numberOfBasement"  value=""/>

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="structure">
                              Kết cấu
                            </label>

                            <form:input path="structure"
                                    type="text"
                                    id="structure"
                                    placeholder="Structure: "
                                    class="form-control"
                                    name="structure"  value=""/>

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="direction">
                              Hướng
                            </label>

                            <form:input path="direction"
                                    type="text"
                                    id="direction"
                                    placeholder="Direction: "
                                    class="form-control"
                                    name="direction"  value=""/>

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="motorFee">
                              Phí
                              motor
                            </label>

                            <input
                                    type="text"
                                    id="motorFee"
                                    placeholder="motorFee: "
                                    class="form-control"
                                    name="motorFee"  value="">

                          </div>
                        </div>
                        <div class="row">

                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="otoFee">
                              Phí ô tô
                            </label>

                            <input
                                    type="number"
                                    id="otoFee"
                                    placeholder="Car Fee: "
                                    class="form-control"
                                    name="otoFee"  value="">

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="overTimeFee">
                              Phí
                              ngoài
                              giờ
                            </label>

                            <input
                                    type="text"
                                    id="overTimeFee"
                                    placeholder="overTimeFee: "
                                    class="form-control"
                                    name="overTimeFee"  value="">

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="deposit">
                              Tiền cọc
                            </label>

                            <input
                                    type="text"
                                    id="deposit"
                                    placeholder="deposit: "
                                    class="form-control"
                                    name="deposit"  value="">

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="purchase">
                              Thanh
                              toán
                            </label>

                            <input
                                    type="text"
                                    id="purchase"
                                    placeholder="purchase: "
                                    class="form-control"
                                    name="purchase"  value="">

                          </div>
                        </div>
                        <div class="row">

                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="rentTime">
                              Thời hạn
                              thuê
                            </label>

                            <input
                                    type="number"
                                    id="rentTime"
                                    placeholder="Rent Time: "
                                    class="form-control"
                                    name="rentTime"  value="">

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="decorateTime">
                              Thời
                              gian
                              trang
                              trí
                            </label>

                            <input
                                    type="text"
                                    id="decorateTime"
                                    placeholder="decorateTime: "
                                    class="form-control"
                                    name="decorateTime"  value="">

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="electricPrice">
                              Tiền
                              điện
                            </label>

                            <input
                                    type="text"
                                    id="electricPrice"
                                    placeholder="electricPrice: "
                                    class="form-control"
                                    name="electricPrice"  value="">

                          </div>
                          <div
                                  class="col-xs-3">
                            <label
                                    class="control-label"
                                    for="brokerageFee">
                              Phí môi
                              giới
                            </label>

                            <input
                                    type="text"
                                    id="brokerageFee"
                                    placeholder="brokerageFee: "
                                    class="form-control"
                                    name="brokerageFee" value="">

                          </div>
                        </div>
                        <div class="row">
                          <div
                                  class="col-xs-4">
                            <label
                                    class="control-label"
                                    for="managerName">Tên
                              quản lý
                            </label>

                            <form:input path="managerName"
                                    type="text"
                                    id="managerName"
                                    placeholder="Manager's name "
                                    class="form-control"
                                    name="managerName"
                                     value=""/>

                          </div>
                          <div
                                  class="col-xs-4">
                            <label
                                    class="control-label"
                                    for="managerPhone">
                              Số điện thoại quản lý
                            </label>

                            <form:input path="managerPhone"
                                    type="text"
                                    id="managerPhone"
                                    placeholder="Manager's Phone Number: "
                                    class="form-control"
                                    name="managerPhone"
                                    value=""/>

                          </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-12">
                            <div class="checkbox-group">
                                <form:checkboxes items="${typeCodes}" path="typeCode"/>
                            </div>
                            <c:if test="${not empty buildingEdit.id}">
                            <button class="search-button" id="btnAddOrUpdateBuilding"><span class="add-icon"></span>
                              UPDATE
                            </button>
                            <button class="search-button" id="btnCancelBuilding"><span class="add-icon"></span>
                              CANCEL
                            </button>
                            </c:if>
                            <c:if test="${empty buildingEdit.id}">
                            <button
                                    class="search-button"
                                    id="btnAddOrUpdateBuilding"><span class="add-icon"></span> ADD
                            </button>
                            <button class="search-button" id="btnCancelBuilding"><span class="add-icon"></span>
                              CANCEL
                            </button>
                            </c:if>
                          </div>
                        </div>
                        <form:hidden path="id" id="buildingId"/>
                  </form>
                  </form:form>

                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div><!-- /.page-content -->
  </div><!-- /.main-content -->
</div>
<script>
  $('#btnAddOrUpdateBuilding').click(function(e){
            console.log(e);
            e.preventDefault();
            let data = {};
            let typeCode =[];
            let formEditData = $('#listForm').serializeArray();
            $.each(formEditData,function(i,v){
              if(v.name!="typeCode"){
                data["" + v.name +""] = v.value;
              }
              else{
                typeCode.push(v.value);
              }
            })
            data['typeCode'] = typeCode;
            if(typeCode!=""){
              addOrUpdateBuilding(data);
            }else{
                window.location.href = "<c:url value='/admin/building-edit?typeCode=require' />";
            }

          }


  )
  function addOrUpdateBuilding(data){
  $.ajax(
                    {
                      type:"POST",
                      url:"${buildingAPI}",
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
  $('#btnCancelBuilding').click(function (e){
  e.preventDefault();
  window.location.href ="/admin/building-list";
  })
</script>
</body>
</html>
