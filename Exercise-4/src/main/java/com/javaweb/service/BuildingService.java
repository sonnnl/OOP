package com.javaweb.service;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    public BuildingDTO addOrUpdate(BuildingDTO buildingDTO);


}
