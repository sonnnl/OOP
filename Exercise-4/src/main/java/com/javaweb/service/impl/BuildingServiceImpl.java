package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();  //tim toa nha
        //danh sach tat ca nhan vien
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAsignment = building.getUserEntities();  //danh sach tat ca nhan vien co check = 1
        //danh sach nv co check = 1
        List<StaffResponseDTO> staffResponse = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity user : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(user.getFullName());
            staffResponseDTO.setStaffId(user.getId());
            if(staffAsignment.contains(user)){
                staffResponseDTO.setChecked("checked");
            }else{
                staffResponseDTO.setChecked("");
            }
            staffResponse.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponse);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        List<String> typeCode = buildingSearchRequest.getTypeCode();
        Map<String, Object> params = new HashMap<>();
        params.put("name", buildingSearchRequest.getName());
        params.put("floorArea", buildingSearchRequest.getFloorArea());
        params.put("district", buildingSearchRequest.getDistrict());
        params.put("ward", buildingSearchRequest.getWard());
        params.put("street", buildingSearchRequest.getStreet());
        params.put("numberOfBasement", buildingSearchRequest.getNumberOfBasement());
        params.put("managerName", buildingSearchRequest.getManagerName());
        params.put("managerPhone", buildingSearchRequest.getManagerPhone());
        params.put("rentAreaFrom", buildingSearchRequest.getAreaFrom());
        params.put("rentAreaTo", buildingSearchRequest.getAreaTo());
        params.put("rentPriceFrom", buildingSearchRequest.getRentPriceFrom());
        params.put("rentPriceTo", buildingSearchRequest.getRentPriceTo());
        params.put("staffId", buildingSearchRequest.getStaffId());
        BuildingSearchBuilder  buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(params,typeCode);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder);
        List<BuildingSearchResponse> res = new ArrayList<>();
        for(BuildingEntity buildingEntity : buildingEntities){
            BuildingSearchResponse building = buildingConverter.toBuildingSearchResponse(buildingEntity);
            res.add(building);
        }
        return res;
    }
    public static String listToString(List<String> list) {
        if (list == null || list.isEmpty()) {
            return ""; // Trả về chuỗi rỗng nếu list null hoặc rỗng
        }

        StringBuilder result = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            result.append(list.get(i));
            if (i < list.size() - 1) {
                result.append(","); // Thêm dấu phẩy nếu không phải phần tử cuối
            }
        }
        return result.toString();
    }
    @Override
    public BuildingDTO addOrUpdate(BuildingDTO buildingDTO) {
        Long buildingId = buildingDTO.getId();
        BuildingEntity building = modelMapper.map(buildingDTO, BuildingEntity.class);
        building.setTypeCode(listToString(buildingDTO.getTypeCode()));
        buildingRepository.save(building);
        buildingDTO.setId(building.getId());
        return buildingDTO;

    }

}
