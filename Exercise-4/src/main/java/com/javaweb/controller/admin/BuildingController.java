package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;
    @Autowired
    private BuildingService buildingService;
    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
//        Lấy dữ liệu ở DB

        List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest);

        BuildingSearchResponse item1 = new BuildingSearchResponse();
        item1.setId(1L);
        item1.setName("Không tìm thấy tòa nhà nào");
        item1.setAddress("");
        item1.setFloorArea(0L);
        item1.setManagerName("");
        item1.setBrokerageFee(0.0);
        item1.setEmptyArea("");
        item1.setManagerPhone("");
        item1.setNumberOfBasement(0L);
        item1.setServiceFee("");
        item1.setRentArea("");
        item1.setRentPrice(0L);
        if(responseList.size()==0){
            responseList.add(item1);
        }

        // Add list to ModelAndView
        mav.addObject("buildingList", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districtCode", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
        return mav;
    }
    @GetMapping(value = "/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("buildingEdit", buildingDTO);  // New building by default
        setCommonAttributes(mav);
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");

        // Load the building data based on the provided id
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setId(id);
        buildingDTO.setName("SON KSHMR");

        mav.addObject("buildingEdit", buildingDTO);
        setCommonAttributes(mav);

        return mav;
    }

    // Helper method to set common attributes
    private void setCommonAttributes(ModelAndView mav) {
        mav.addObject("districtCode", districtCode.type());
        mav.addObject("typeCodes", buildingType.type());
    }

}

