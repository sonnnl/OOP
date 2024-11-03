package com.javaweb.converter;

import java.util.List;
import java.util.Map;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

@Component
public class BuildingSearchBuilderConverter {

    public BuildingSearchBuilder toBuildingSearchBuilder(Map<String,Object> params, List<String> typeCode) {
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(params, "name", String.class))
                .setFloorArea(MapUtils.getObject(params, "floorArea", Long.class))
                .setDistrict(MapUtils.getObject(params, "district", String.class))
                .setNumberOfBasement(MapUtils.getObject(params, "numberOfBasement", Long.class))
                .setManagerName(MapUtils.getObject(params, "nameManager", String.class))
                .setManagerPhone(MapUtils.getObject(params, "phoneManager", String.class))
                .setRentAreaFrom(MapUtils.getObject(params, "rentAreaMax", Long.class))
                .setRentAreaFrom(MapUtils.getObject(params, "rentAreaMin", Long.class))
                .setRentPriceFrom(MapUtils.getObject(params, "rentPriceMin", Long.class))
                .setRentPriceTo(MapUtils.getObject(params, "rentPriceMax", Long.class))
                .setStaffId(MapUtils.getObject(params, "staffId", Long.class))
                .setStreet(MapUtils.getObject(params, "street", String.class))
                .setWard(MapUtils.getObject(params, "ward", String.class))
                .setTypeCode(typeCode)
                .build()
                ;
        return buildingSearchBuilder;
    }

}
