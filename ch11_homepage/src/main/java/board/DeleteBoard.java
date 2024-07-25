package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
//		String nowPage = request.getParameter("nowPage");
		
		Board delBean = new Board();
		delBean.setNum(Integer.parseInt(request.getParameter("num")));
		delBean.setPass(request.getParameter("pass"));
		
		HttpSession session = request.getSession();
		Board inBean = (Board)session.getAttribute("bean");
//		
//		if(inBean.getPass().equals(delBean.getPass())) {
//			new BoardDao().deleteBoard(delBean);
//			String url = "list.jsp?nowPage=1"; 
//			response.sendRedirect(url);
//		}else {
//			out.println("<script>");
//			out.println("alert('비밀번호가 맞지 않습니다.')");
//			out.println("history.back()");
//			out.println("</script>");
			
			
//		}
	}

}
