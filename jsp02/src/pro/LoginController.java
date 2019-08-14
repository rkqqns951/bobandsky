package pro;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;






@WebServlet("/login_servlet/*")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException,
			IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		LoginDAO dao = new LoginDAO();
		if(uri.indexOf("login.do") != -1){//로그인 처리
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			LoginDTO dto=new LoginDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			String page="/pro/login_page.jsp";
			if(!result.equals("로그인 실패")) {//로그인 성공
				//세션 객체 생성
				HttpSession session=request.getSession();
				//세션에 값을 저장
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page="/pro/index.jsp";
				response.sendRedirect(request.getContextPath()+page);
			}else {//로그인 실패
				response.sendRedirect(
						request.getContextPath()+
						page+"?message=error");
			      }
			}else if(uri.indexOf("logout.do") != -1) {//로그아웃 처리
				HttpSession session=request.getSession();
				//세션을 비움(초기화시킴)
				session.invalidate();
				//main 페이지로 이동
				String page=request.getContextPath()
						+"/pro/index.jsp";
				response.sendRedirect(page);
				
		    }else if(uri.indexOf("list.do") != -1) {
			System.out.println("list.do호출..");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("list.do"));
			//HashMap 생성
			Map<String,Object> map=new HashMap<>();
			//dao의 memberList()호출 후 리턴받은 값을 list에 저장
			List<LoginDTO> list=dao.loginList();
			//DAO의 ArrayList에 담은 값들을 Map에 자료 저장
			map.put("list", list);
			//ArrayList에 담겨진 레코드의 갯수를 저장
			map.put("count", list.size());
			
			//최종적으로 map에 담긴값을 setAttribute에 저장
			request.setAttribute("map", map);//key,value
			//출력을 위해 포워딩할 uri지정
			
			String page="/pro/admin_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩
			
		   
		
		}else if(uri.indexOf("join.do") != -1) {//회원등록
			HttpSession session=request.getSession();
			//세션을 비움(초기화시킴)
			session.invalidate();
			//로그인 페이지로 이동
			String page=request.getContextPath()+"/pro/login_page.jsp?message=register";
			response.sendRedirect(page);
			
			
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			
			LoginDTO dto=new LoginDTO();//LoginDTO생성
			
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dao.insert(dto);
		
		 }else if(uri.indexOf("id_check.do")!=-1) {
				String userid = request.getParameter("userid");
				int result = dao.id_check(userid);
				response.getWriter().write(result+"");
			
	}else if(uri.indexOf("view.do") != -1) {
		String userid=request.getParameter("userid");
		//System.out.println("클릭한 아이디:"+userid);
		LoginDTO dto=dao.loginDetail(userid);
		request.setAttribute("dto", dto);
		String page="/pro/admin_view.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
	
	
	}else if(uri.indexOf("update.do") != -1) {
		String userid=request.getParameter("userid");
		String passwd=request.getParameter("passwd");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String hp=request.getParameter("hp");
		LoginDTO dto=new LoginDTO();
		dto.setUserid(userid);
		dto.setPasswd(passwd);
		dto.setName(name);
		dto.setEmail(email);
		dto.setHp(hp);
		//레코드 수정 처리
		dao.update(dto);
		//페이지 이동
		response.sendRedirect(context+"/pro/admin.jsp");
	}else if(uri.indexOf("delete.do") != -1) {
		String userid=request.getParameter("userid");
		//레코드 삭제
		dao.delete(userid);
		//페이지 이동
		response.sendRedirect(context+"/pro/admin.jsp");
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
