package com.application.mobileapp;

public class Notification {

    private int ID;
    private String To_Username;
    private String From_Username;
    private String Description;
    private String Veiwed;
    private String Date_Created;

    public String getFrom_Username() {
        return From_Username;
    }

    public void setFrom_Username(String from_Username) {
        From_Username = from_Username;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTo_Username() {
        return To_Username;
    }

    public void setTo_Username(String to_Username) {
        To_Username = to_Username;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getVeiwed() {
        return Veiwed;
    }

    public void setVeiwed(String veiwed) {
        Veiwed = veiwed;
    }

    public String getDate_Created() {
        return Date_Created;
    }

    public void setDate_Created(String date_Created) {
        Date_Created = date_Created;
    }

    public Notification(int ID, String to_Username, String from_Username, String description, String veiwed, String date_Created) {
        this.ID = ID;
        To_Username = to_Username;
        From_Username = from_Username;
        Description = description;
        Veiwed = veiwed;
        Date_Created = date_Created;
    }
}
