package ch03;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Test18Ctrl.do")
public class Test18Ctrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "서블릿 데이터";
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        //URL 이동 - response
        //response.sendRedirect("test18.jsp?msg="+msg);

        //디스패치 및 포워드하여 이동 - view
        /*
        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("test18.jsp");
        view.forward(request, response);
         */

        //세션을 활용하여 데이터 넘기기
        HttpSession ses = request.getSession();
        ses.setAttribute("msg", msg);
        PrintWriter out = response.getWriter();
        out.println("<a href='test18.jsp'>테스트18</a>");

        //out 객체를 생성하여 해당 태그를 출력하여 사이트 이동 - out
        /* PrintWriter out = response.getWriter();
        out.println("<a href='test18.jsp?msg='"+msg+"'>테스트18</a>");  */

    }
}
