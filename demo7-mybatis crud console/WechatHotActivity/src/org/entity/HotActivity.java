package org.entity;

public class HotActivity {
	private int seqId;

	private String activityTitle;
	
	private String activityLink;
	
	private char activitySeq;
	
	private String recSt;
	
	public void setSeqId(int value) {
		this.seqId = value;
	}
	public int getSeqId() {
		return this.seqId;
	}

	public void setActivityTitle(String value) {
		this.activityTitle = value;
	}
	public String getActivityTitle() {
		return this.activityTitle;
	}
	
	public void setActivityLink(String value) {
		this.activityLink = value;
	}
	public String getActivityLink() {
		return this.activityLink;
	}
	
	public void setActivitySeq(char value) {
		this.activitySeq = value;
	}
	public char getActivitySeq() {
		return this.activitySeq;
	}
	
	public void setRecSt(String value) {
		this.recSt = value;
	}
	public String getRecSt() {
		return this.recSt;
	}
	
}