package homework;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/Homework_servlet/*")
public class HomeworkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, 
			IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		HomeworkDAO dao= new HomeworkDAO();
		
		if(uri.indexOf("homework_secret.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			HomeworkDTO dto=new HomeworkDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insertCrypt(dto);
		}else if(uri.indexOf("homework_login_secret.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디:"+userid);
			System.out.println("패스워드:"+passwd);
			HomeworkDTO dto=new HomeworkDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheckOracle(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/ch06/login_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
