package com.chunjae.dto;

public class Fna {
    private int fno;
    private String question;
    private String answer;
    private int cnt;

    public int getFno() {
        return fno;
    }

    public void setFno(int fno) {
        this.fno = fno;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public Fna() {
    }

    public Fna(int fno, String question, String answer, int cnt) {
        this.fno = fno;
        this.question = question;
        this.answer = answer;
        this.cnt = cnt;
    }
}
