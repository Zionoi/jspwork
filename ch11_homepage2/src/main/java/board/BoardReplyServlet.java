package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nowPage = request.getParameter("nowPage");
		
		Board board = new Board();
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setPass(request.getParameter("pass"));
		board.setIp(request.getParameter("ip"));
		board.setRef(Integer.parseInt(request.getParameter("ref")));
		board.setPos(Integer.parseInt(request.getParameter("pos")));
		board.setDepth(Integer.parseInt(request.getParameter("depth")));
		
		BoardDao bDao = new BoardDao();
		bDao.replyPosUpdate(board.getRef(),board.getPos());
		bDao.replyBoard(board);
		
		response.sendRedirect("list.jsp?nowPage="+nowPage);
	}

}
