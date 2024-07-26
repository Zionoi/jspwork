package ajaxReply;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxSurvletReplyList
 */
public class AjaxSurvletReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ref = Integer.parseInt(request.getParameter("bnum"));
		
		ArrayList<Reply> alist = new ReplyDao().getReplyList(ref);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(alist, response.getWriter());
	}

}
