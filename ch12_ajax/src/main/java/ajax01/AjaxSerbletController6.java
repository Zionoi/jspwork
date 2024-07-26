package ajax01;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxSerbletController6 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> alist = new MemberMgr().getAllMember();
		
		// 1. JSONArray [{},{},{}]
//		JSONArray jArr = new JSONArray();
//		for(Member mem : alist) {
//			JSONObject jobj = new JSONObject();
//			jobj.put("id", mem.getId());
//			jobj.put("name", mem.getName());
//			jobj.put("gender", mem.getGender());
//			jobj.put("email", mem.getEmail());
//			jArr.add(jobj);
//			
//		}
//		response.setContentType("application/json; charset=utf-8");
//		response.getWriter().println(jArr);
		
		//2. GSON
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(alist,response.getWriter());
	}

}
