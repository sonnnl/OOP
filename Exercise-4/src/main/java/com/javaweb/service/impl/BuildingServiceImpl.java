package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
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
            staffResponseDTO.getStaffId(user.getId());
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
}
