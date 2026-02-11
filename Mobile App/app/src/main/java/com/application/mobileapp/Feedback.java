package com.application.mobileapp;

public class Feedback {

    private String Description, Created;
    private int ID, ticketID,logID;

    public Feedback(String description, String created, int ID, int ticketID, int logID) {
        Description = description;
        Created = created;
        this.ID = ID;
        this.ticketID = ticketID;
        this.logID = logID;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getCreated() {
        return Created;
    }

    public void setCreated(String created) {
        Created = created;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public int getLogID() {
        return logID;
    }

    public void setLogID(int logID) {
        this.logID = logID;
    }
}
