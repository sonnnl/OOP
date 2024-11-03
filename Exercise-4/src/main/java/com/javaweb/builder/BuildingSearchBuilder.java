package com.javaweb.builder;

import java.util.List;

public class BuildingSearchBuilder {
    private String name;
    private String district; // Updated from districtId to district
    private String street;
    private String ward;
    private String managerName;
    private String managerPhone;
    private Long numberOfBasement;
    private Long floorArea;
    private Long rentPriceFrom;
    private Long rentPriceTo;
    private Long rentAreaFrom;
    private Long rentAreaTo;
    private Long staffId;
    private List<String> typeCode;

    public String getName() {
        return name;
    }

    public String getDistrict() { // Updated getter name
        return district;
    }

    public String getStreet() {
        return street;
    }

    public String getWard() {
        return ward;
    }

    public String getManagerName() {
        return managerName;
    }

    public String getManagerPhone() { // Fixed capitalization for consistency
        return managerPhone;
    }

    public Long getNumberOfBasement() {
        return numberOfBasement;
    }

    public Long getFloorArea() {
        return floorArea;
    }

    public Long getRentPriceFrom() { // Fixed capitalization
        return rentPriceFrom;
    }

    public Long getRentPriceTo() {
        return rentPriceTo;
    }

    public Long getRentAreaFrom() {
        return rentAreaFrom;
    }

    public Long getRentAreaTo() {
        return rentAreaTo;
    }

    public Long getStaffId() {
        return staffId;
    }

    public List<String> getTypeCode() {
        return typeCode;
    }

    private BuildingSearchBuilder(Builder builder) {
        this.name = builder.name;
        this.district = builder.district;
        this.street = builder.street;
        this.ward = builder.ward;
        this.managerName = builder.managerName;
        this.managerPhone = builder.managerPhone;
        this.numberOfBasement = builder.numberOfBasement;
        this.floorArea = builder.floorArea;
        this.rentPriceFrom = builder.rentPriceFrom;
        this.rentPriceTo = builder.rentPriceTo;
        this.rentAreaFrom = builder.rentAreaFrom;
        this.rentAreaTo = builder.rentAreaTo;
        this.staffId = builder.staffId;
        this.typeCode = builder.typeCode;
    }

    public static class Builder {
        private String name;
        private String district; // Updated from districtId to district
        private String street;
        private String ward;
        private String managerName;
        private String managerPhone;
        private Long numberOfBasement;
        private Long floorArea;
        private Long rentPriceFrom;
        private Long rentPriceTo;
        private Long rentAreaFrom;
        private Long rentAreaTo;
        private Long staffId;
        private List<String> typeCode;

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setDistrict(String district) { // Updated setter name
            this.district = district;
            return this;
        }

        public Builder setStreet(String street) {
            this.street = street;
            return this;
        }

        public Builder setWard(String ward) {
            this.ward = ward;
            return this;
        }

        public Builder setManagerName(String managerName) {
            this.managerName = managerName;
            return this;
        }

        public Builder setManagerPhone(String managerPhone) { // Fixed capitalization
            this.managerPhone = managerPhone;
            return this;
        }

        public Builder setNumberOfBasement(Long numberOfBasement) {
            this.numberOfBasement = numberOfBasement;
            return this;
        }

        public Builder setFloorArea(Long floorArea) {
            this.floorArea = floorArea;
            return this;
        }

        public Builder setRentPriceFrom(Long rentPriceFrom) { // Fixed capitalization
            this.rentPriceFrom = rentPriceFrom;
            return this;
        }

        public Builder setRentPriceTo(Long rentPriceTo) {
            this.rentPriceTo = rentPriceTo;
            return this;
        }

        public Builder setRentAreaFrom(Long rentAreaFrom) {
            this.rentAreaFrom = rentAreaFrom;
            return this;
        }

        public Builder setRentAreaTo(Long rentAreaTo) {
            this.rentAreaTo = rentAreaTo;
            return this;
        }

        public Builder setStaffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder setTypeCode(List<String> typeCode) {
            this.typeCode = typeCode;
            return this;
        }

        public BuildingSearchBuilder build() {
            return new BuildingSearchBuilder(this);
        }
    }
}
