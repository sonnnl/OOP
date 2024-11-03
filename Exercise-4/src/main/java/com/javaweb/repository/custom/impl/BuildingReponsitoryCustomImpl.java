package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingReponsitoryCustom;
import com.javaweb.utils.NumberUtils;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class BuildingReponsitoryCustomImpl implements BuildingReponsitoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Value("${spring.datasource.url}")
    private String datasourceUrl;

    @Value("${spring.datasource.username}")
    private String datasourceUsername;

    @Value("${spring.datasource.password}")
    private String datasourcePassword;


    public static void joinTable(BuildingSearchBuilder bsb, StringBuilder sql) {
        Long staffId = bsb.getStaffId();
        if(staffId!=null) {
            sql.append(" Inner join assignmentbuilding ab on ab.buildingid = building.id ");
        }
        Long rentAreaMin = bsb.getRentAreaFrom();
        Long rentAreaMax = bsb.getRentAreaTo();
        if(rentAreaMin!=null || rentAreaMax!=null ) {
            sql.append(" Inner join rentarea r on r.buildingid = b.id");
        }
    }

    public static void normalQuery(BuildingSearchBuilder bsb,StringBuilder where) {

        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for(Field item: fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.contains("rentArea") && !fieldName.contains("rentPrice")) {

                    Object fieldValue = item.get(bsb);
                    String value = fieldValue != null ? fieldValue.toString() : "";
                    if(NumberUtils.isLong(value)) {
                        where.append(" AND building." + fieldName + "=" + value);
                    }
                    else {
                        where.append(" AND building." + fieldName +" like '%" + value +"%' ");
                    }
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void specialQuery(BuildingSearchBuilder bsb,StringBuilder where) {
        Long staffId = bsb.getStaffId();
        if(staffId!=null) {
            where.append(" AND ab.staffid = " + staffId );
        }
        Long rentAreaMin = bsb.getRentAreaFrom();
        Long rentAreaMax = bsb.getRentAreaTo();
        if(rentAreaMin!=null ) {
            where.append(" AND r.value >= " + rentAreaMin );
        }
        if(rentAreaMax!=null ) {
            where.append(" AND r.value <= " + rentAreaMax );
        }
        Long rentPriceMin = bsb.getRentPriceFrom();
        Long rentPriceMax = bsb.getRentPriceTo();
        if(rentPriceMin!=null ) {
            where.append(" AND building.rentprice >= " + rentPriceMin );
            System.out.println(rentPriceMin);
        }
        if(rentPriceMax!=null ) {
            where.append(" AND building.rentprice <= " + rentPriceMax );
        }
    }
    //	@Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder bsb){
        StringBuilder sqlQuery = new StringBuilder("select building.* from building ") ;
        joinTable(bsb,sqlQuery);
        StringBuilder where = new StringBuilder(" Where 1=1 ");
        normalQuery(bsb,where);
        specialQuery(bsb, where);
        sqlQuery.append(where);
        Query query = entityManager.createNativeQuery(sqlQuery.toString(),BuildingEntity.class);
        return query.getResultList();
    }

}
