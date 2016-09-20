package com.beans;

public class Animal {
    
    private String kind;
    private String sound;
    
    public String getKind() {
        return kind;
    }
    public void setKind(String kind) {
        this.kind = kind;
    }
    public String getSound() {
        return sound;
    }
    public void setSound(String sound) {
        this.sound = sound;
    }
    public void info(){
        System.out.println("kind:"+getKind()+" sound:"+getSound());
    }

}
