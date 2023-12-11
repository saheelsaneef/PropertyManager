package com.Form;


public class Report {

    private int id;
    private double income;
    private String date;
    private String status;

    public Report() {
        super();
    }

    public Report(int id, double income, String date, String status) {
        super();
        this.id = id;
        this.income = income;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
