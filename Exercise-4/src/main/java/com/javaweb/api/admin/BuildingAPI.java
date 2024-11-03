package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import jdk.nashorn.internal.ir.Assignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController("buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @PostMapping
    public BuildingDTO addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        BuildingDTO res = buildingService.addOrUpdate(buildingDTO);
        return res;
    }
    @DeleteMapping("/{ids}")
    public void deleteBuilding(@RequestBody List<Long> ids){

    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }
    @PostMapping("/assignment")
    public void updateAssignment(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){

    }
}
