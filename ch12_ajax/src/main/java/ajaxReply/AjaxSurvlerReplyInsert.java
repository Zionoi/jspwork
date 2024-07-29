package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;



/**
 * Servlet implementation class AjaxSurvlerReplyInsert
 */
public class AjaxSurvlerReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		
		Reply reply = new Reply();
		reply.setRef(bnum);
		reply.setContent(content);
		reply.setName(name);
		
		boolean result = new ReplyDao().insertReply(reply);
		
		out.print(result);
		
		
		
	}

}
