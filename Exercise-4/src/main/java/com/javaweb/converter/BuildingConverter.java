package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity item) {
        // Map the common fields using ModelMapper
        BuildingSearchResponse response = modelMapper.map(item, BuildingSearchResponse.class);
        // Set the custom fields manually
        // Set the address as a concatenation of street, ward, and districtCode
        response.setAddress(item.getStreet() + ", " + item.getWard() + ", " + item.getDistrict().getDistrictName());
        // Convert list of RentAreaEntity to a comma-separated rentArea string
        List<RentAreaEntity> lRAE = item.getListRentArea();
        response.setRentArea(lRAE.stream()
                .map(RentAreaEntity::getValue) // Lấy giá trị từ RentAreaEntity
                .collect(Collectors.joining(","))); // Nối bằng dấu phẩy

        return response;
    }
}