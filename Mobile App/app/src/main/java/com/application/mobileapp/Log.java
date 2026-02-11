package com.application.mobileapp;

public class Log {

    private int ID;
    private String Username, Division, Incident, Description, Status, Date_Created;

    public Log(int ID, String username, String division, String incident, String description, String status, String date_Created) {
        this.ID = ID;
        Username = username;
        Division = division;
        Incident = incident;
        Description = description;
        Status = status;
        Date_Created = date_Created;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getDivision() {
        return Division;
    }

    public void setDivision(String division) {
        Division = division;
    }

    public String getIncident() {
        return Incident;
    }

    public void setIncident(String incident) {
        Incident = incident;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getDate_Created() {
        return Date_Created;
    }

    public void setDate_Created(String date_Created) {
        Date_Created = date_Created;
    }
}
