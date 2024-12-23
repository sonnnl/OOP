package com.javaweb.entity;

import com.javaweb.enums.districtCode;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="building")
public class BuildingEntity extends BaseEntity{
    @Column(name="name")
    private String name;
    @Column(name="street")
    private String street;
    @Column(name="ward")
    private String ward;
    @Column(name = "district")
    @Enumerated(EnumType.STRING)
    private districtCode district;
    @Column(name="managername")
    private String nameManager;
    @Column(name="managerphone")
    private String managerPhone;
    @Column(name="floorarea")
    private Integer floorArea;
    @Column(name="numberofbasement")
    private Long numberofBasement;

    public Long getNumberofBasement() {
        return numberofBasement;
    }

    public void setNumberofBasement(Long numberofBasement) {
        this.numberofBasement = numberofBasement;
    }

    @Column(name="rentprice")
    private Integer rentPrice;
    @Column(name="servicefee")
    private Integer serviceFee;
    @Column(name="brokeragefee")
    private Integer brokerageFee;

    public List<UserEntity> getUserEntities() {
        return userEntities;
    }

    public void setUserEntities(List<UserEntity> userEntities) {
        this.userEntities = userEntities;
    }

    @Column(name="type")
    private String typeCode;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="assignmentbuilding",
    joinColumns = @JoinColumn(name="buildingid",nullable = false),
    inverseJoinColumns = @JoinColumn(name="staffid",nullable = false)
    )
    private List<UserEntity> userEntities = new ArrayList<>();

    @OneToMany(mappedBy = "building",fetch = FetchType.LAZY)
    private List<RentAreaEntity> listRentArea = new ArrayList<>();

    public List<RentAreaEntity> getListRentArea() {
        return listRentArea;
    }

    public void setListRentArea(List<RentAreaEntity> listRentArea) {
        this.listRentArea = listRentArea;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public String getWard() {
        return ward;
    }

    public districtCode getDistrict() {
        return district;
    }

    public void setDistrict(districtCode district) {
        this.district = district;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }


    public void setWard(String ward) {
        this.ward = ward;
    }
    public String getNameManager() {
        return nameManager;
    }
    public void setNameManager(String nameManager) {
        this.nameManager = nameManager;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }

    public Integer getFloorArea() {
        return floorArea;
    }
    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }
    public Integer getRentPrice() {
        return rentPrice;
    }
    public void setRentPrice(Integer rentPrice) {
        this.rentPrice = rentPrice;
    }
    public Integer getServiceFee() {
        return serviceFee;
    }
    public void setServiceFee(Integer serviceFee) {
        this.serviceFee = serviceFee;
    }
    public Integer getBrokerageFee() {
        return brokerageFee;
    }
    public void setBrokerageFee(Integer brokerageFee) {
        this.brokerageFee = brokerageFee;
    }

}
