package com.application.mobileapp;

public class User {

    private int ID;
    private String Title;
    private String First_name;
    private String Last_Name;
    private String Position;
    private String Skills;
    private String Email;
    private String Username;
    private String isAssigner;
    private String isTeamLeader;
    private String TeamLeading;
    private String TeamUnder;
    private String DivisionUnder;
    private String Created;

    public User(int ID, String title, String first_name, String last_Name, String position, String skills, String email, String username, String isAssigner, String isTeamLeader, String teamLeading, String teamUnder, String divisionUnder, String created) {
        this.ID = ID;
        Title = title;
        First_name = first_name;
        Last_Name = last_Name;
        Position = position;
        Skills = skills;
        Email = email;
        Username = username;
        this.isAssigner = isAssigner;
        this.isTeamLeader = isTeamLeader;
        TeamLeading = teamLeading;
        TeamUnder = teamUnder;
        DivisionUnder = divisionUnder;
        Created = created;
    }

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

    public String getFirst_name() {
        return First_name;
    }

    public void setFirst_name(String first_name) {
        First_name = first_name;
    }

    public String getLast_Name() {
        return Last_Name;
    }

    public void setLast_Name(String last_Name) {
        Last_Name = last_Name;
    }

    public String getPosition() {
        return Position;
    }

    public void setPosition(String position) {
        Position = position;
    }

    public String getSkills() {
        return Skills;
    }

    public void setSkills(String skills) {
        Skills = skills;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getIsAssigner() {
        return isAssigner;
    }

    public void setIsAssigner(String isAssigner) {
        this.isAssigner = isAssigner;
    }

    public String getIsTeamLeader() {
        return isTeamLeader;
    }

    public void setIsTeamLeader(String isTeamLeader) {
        this.isTeamLeader = isTeamLeader;
    }

    public String getTeamLeading() {
        return TeamLeading;
    }

    public void setTeamLeading(String teamLeading) {
        TeamLeading = teamLeading;
    }

    public String getTeamUnder() {
        return TeamUnder;
    }

    public void setTeamUnder(String teamUnder) {
        TeamUnder = teamUnder;
    }

    public String getDivisionUnder() {
        return DivisionUnder;
    }

    public void setDivisionUnder(String divisionUnder) {
        DivisionUnder = divisionUnder;
    }

    public String getCreated() {
        return Created;
    }

    public void setCreated(String created) {
        Created = created;
    }
}
