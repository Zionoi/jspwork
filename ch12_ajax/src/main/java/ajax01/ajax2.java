/*
 * package ajax01;
 * 
 * import jakarta.servlet.ServletException; import
 * jakarta.servlet.annotation.WebServlet; import
 * jakarta.servlet.http.HttpServlet; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse; import java.io.IOException;
 * 
 * public class ajax2 extends HttpServlet { private static final long
 * serialVersionUID = 1L;
 * 
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { String name =
 * request.getParameter("name"); int age =
 * Integer.parseInt(request.getParameter("age"));
 * response.getWriter().print("이름 : "+ name + " / ");
 * response.getWriter().print("나이 : "+ age); }
 * 
 * }
 */