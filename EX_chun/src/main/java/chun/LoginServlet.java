
package chun;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		ChunBean cDao = new chunDao().loginRegister(id, pw);
		
		if(cDao!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("idKey", id);
			session.setAttribute("cDaoBean", cDao);
		}
		response.sendRedirect("chunHome.jsp");
	
	}

}
