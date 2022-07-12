package models;

import java.io.Serializable;

public class Role implements Serializable{
    private int rID;
    private String rName;

    public Role() {
    }

    public Role(int rID, String rName) {
        this.rID = rID;
        this.rName = rName;
    }

    public int getrID() {
        return rID;
    }

    public void setrID(int rID) {
        this.rID = rID;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }
}
