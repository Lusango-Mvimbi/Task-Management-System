package com.application.mobileapp;

import java.util.Date;

public class Tasks {

    /*
    Variable Declaration Please not change when you change the ones on the database as they have to match the JSON variables
     */
    private int ID;
    private String Title;
    private String Priority_level;
    private String Category;
    private String Description;
    private String Created_By;
    private String Assigned_To;
    private String Assigned_By;
    private String Status;
    private String Viewed;
    private String Date_Created;
    private String Date_Deadline;
    private String Date_Completed;

    /**
     * Constructor
     *
     * @param ID
     * @param title
     * @param priority_level
     * @param category
     * @param description
     * @param created_By
     * @param assigned_To
     * @param assigned_By
     * @param status
     * @param viewed
     * @param date_Created
     * @param date_Deadline
     * @param date_Completed
     */
    public Tasks(int ID, String title, String priority_level, String category, String description, String created_By, String assigned_To, String assigned_By, String status, String viewed, String date_Created, String date_Deadline, String date_Completed) {
        this.ID = ID;
        Title = title;
        Priority_level = priority_level;
        Category = category;
        Description = description;
        Created_By = created_By;
        Assigned_To = assigned_To;
        Assigned_By = assigned_By;
        Status = status;
        Viewed = viewed;
        Date_Created = date_Created;
        Date_Deadline = date_Deadline;
        Date_Completed = date_Completed;
    }

    //Gettters and Setters
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getPriority_level() {
        return Priority_level;
    }

    public void setPriority_level(String priority_level) {
        Priority_level = priority_level;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String category) {
        Category = category;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getCreated_By() {
        return Created_By;
    }

    public void setCreated_By(String created_By) {
        Created_By = created_By;
    }

    public String getAssigned_To() {
        return Assigned_To;
    }

    public void setAssigned_To(String assigned_To) {
        Assigned_To = assigned_To;
    }

    public String getAssigned_By() {
        return Assigned_By;
    }

    public void setAssigned_By(String assigned_By) {
        Assigned_By = assigned_By;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getViewed() {
        return Viewed;
    }

    public void setViewed(String viewed) {
        Viewed = viewed;
    }

    public String getDate_Created() {
        return Date_Created;
    }

    public void setDate_Created(String date_Created) {
        Date_Created = date_Created;
    }

    public String getDate_Deadline() {
        return Date_Deadline;
    }

    public void setDate_Deadline(String date_Deadline) {
        Date_Deadline = date_Deadline;
    }

    public String getDate_Completed() {
        return Date_Completed;
    }

    public void setDate_Completed(String date_Completed) {
        Date_Completed = date_Completed;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "ID=" + ID +
                ", Title='" + Title + '\'' +
                ", Priority_level='" + Priority_level + '\'' +
                ", Category='" + Category + '\'' +
                ", Description='" + Description + '\'' +
                ", Created_By='" + Created_By + '\'' +
                ", Assigned_To='" + Assigned_To + '\'' +
                ", Assigned_By='" + Assigned_By + '\'' +
                ", Status='" + Status + '\'' +
                ", Viewed='" + Viewed + '\'' +
                ", Date_Created=" + Date_Created +
                ", Date_Deadline=" + Date_Deadline +
                ", Date_Completed=" + Date_Completed +
                '}';
    }
}
