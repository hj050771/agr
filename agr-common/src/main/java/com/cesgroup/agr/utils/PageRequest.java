package com.cesgroup.agr.utils;

public class PageRequest {
    private int pageSize;
    private int pageNum;
    private String orders;

    public PageRequest(){}

    public PageRequest(int pageNum,int pageSize,String orders){
        this.pageSize = pageSize;
        this.pageNum = pageNum;
        this.orders = orders;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public String getOrders() {
        return orders;
    }

    public void setOrders(String orders) {
        this.orders = orders;
    }
}
