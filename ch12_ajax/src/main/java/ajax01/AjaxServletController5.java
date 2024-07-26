package ajax01;

import java.io.IOException;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxServletController5 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Member bean = new MemberMgr().getMember(id);
		
		
		//1. 문자열로 반환 : Member의 toString() 호출
		//response.getWriter().print(bean);
		
//		//2. JSONObject
//		JSONObject jObj = new JSONObject();
//		jObj.put("userId", bean.getId());
//		jObj.put("userName", bean.getName());
//		jObj.put("gender", bean.getGender());
//		jObj.put("email", bean.getEmail());
//		response.setContentType("application/json; charset=utf-8");
//		response.getWriter().print(jObj);
		
		//3. JSONObject를 알아서 넣어주는 GSON라이브러리 사용
		/*
			GSON 라이브러리
			 - 객체 하나만 응답시는 {key:value, key:value,...}의 형태로 만들어져서 응답
			 	> 객체의 필드는 자동으로 key가 됨
			 
			 - 자바 배열이나 ArrayList 응답시 JSONArray [value,value,...] 형태로 만들어져서 응답
			
			
		*/
//		Gson gson = new Gson();
		//.toJson(객체, 시동어); => 객체를 제이슨으로 만들어주는 gson의 메소드
//		gson.toJson(bean,response.getWriter());
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(bean,response.getWriter());
		
	}

}
