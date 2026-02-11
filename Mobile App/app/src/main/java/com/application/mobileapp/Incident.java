package com.application.mobileapp;

public class Incident {
    private int ID,DivisionID;
    private String Name,TeamID,Created;

    public Incident(int ID, int divisionID, String name, String teamID, String created) {
        this.ID = ID;
        DivisionID = divisionID;
        Name = name;
        TeamID = teamID;
        Created = created;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getDivisionID() {
        return DivisionID;
    }

    public void setDivisionID(int divisionID) {
        DivisionID = divisionID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getTeamID() {
        return TeamID;
    }

    public void setTeamID(String teamID) {
        TeamID = teamID;
    }

    public String getCreated() {
        return Created;
    }

    public void setCreated(String created) {
        Created = created;
    }
}
