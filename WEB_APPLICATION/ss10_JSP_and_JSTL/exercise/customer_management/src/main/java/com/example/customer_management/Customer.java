package com.example.customer_management;

public class Customer {
    private String customerName;
    private String birthday;
    private String address;
    private String picture;

    public Customer() {
    }

    public Customer(String customerName, String birthday, String address, String picture) {
        this.customerName = customerName;
        this.birthday = birthday;
        this.address = address;
        this.picture = picture;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
