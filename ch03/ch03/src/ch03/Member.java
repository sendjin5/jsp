package ch03;

public class Member {
    private int no;
    private String id;
    private String pw;
    private String name;
    private int point;

    public Member() {}

    public Member(int no, String id, String pw, String name, int point) {
        this.no = no;
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.point = point;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    @Override
    public String toString() {
        return "Member{" +
                "no=" + no +
                ", id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", name='" + name + '\'' +
                ", point=" + point +
                '}';
    }
}
