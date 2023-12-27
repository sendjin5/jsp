package ch03;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/Test09JavaCtrl.do")
public class Test09JavaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] names = {"구예진","박나연","신승원","오태훈","백준철","박진권","김현경"};

        ArrayList<String> lst1 = new ArrayList<>();
        lst1.add("이슬비");
        lst1.add("한선");
        lst1.add("이소윤");
        lst1.add("김이호");

        HashMap<String, String> map = new HashMap<>();
        map.put("name", "김기태");
        map.put("age","42");
        map.put("height","173.6");
        map.put("hobby","coding");

        List<Member> mList = new ArrayList<>();
        mList.add(new Member(1, "kim", "1234", "김보경", 10000));
        mList.add(new Member(2, "shin", "1004", "신승원", 5000));
        mList.add(new Member(3, "oh", "4321", "오태훈", 20000));

        request.setAttribute("names", names);
        request.setAttribute("lst1", lst1);
        request.setAttribute("map", map);
        request.setAttribute("mList", mList);

        RequestDispatcher view = request.getRequestDispatcher("test09.jsp");
        view.forward(request, response);
    }
}