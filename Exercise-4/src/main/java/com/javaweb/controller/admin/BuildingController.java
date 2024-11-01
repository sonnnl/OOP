package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
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
    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
//        Lấy dữ liệu ở DB
        List<BuildingSearchResponse> responseList = new ArrayList<>();
        BuildingSearchResponse item1 = new BuildingSearchResponse();
        item1.setId(1L);
        item1.setName("Tran Thai Son");
        item1.setAddress("Lao Vn");
        item1.setFloorArea(222L);
        item1.setManagerName("Messi");
        item1.setBrokerageFee(2.4);
        item1.setEmptyArea("123m2");
        item1.setManagerPhone("0705946867");
        item1.setNumberOfBasement(4L);
        item1.setServiceFee("2");
        item1.setRentArea("222 m2");
        item1.setRentPrice(222L);
        responseList.add(item1);

        // Item 2
        BuildingSearchResponse item2 = new BuildingSearchResponse();
        item2.setId(2L);
        item2.setName("Twin Tower");
        item2.setAddress("United State of Lao");
        item2.setFloorArea(350L);  // Unique value
        item2.setManagerName("Tran Thai Son");  // Unique value
        item2.setBrokerageFee(1.9);  // Unique value
        item2.setEmptyArea("300m2");  // Unique value
        item2.setManagerPhone("123456789");  // Unique value
        item2.setNumberOfBasement(6L);  // Unique value
        item2.setServiceFee("3");
        item2.setRentArea("350 m2");
        item2.setRentPrice(300L);  // Unique value
        responseList.add(item2);

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

