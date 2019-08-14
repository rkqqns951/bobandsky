package bob.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import bob.dto.BobCommentDTO;
import bob.dto.BobDTO;
import sqlmap.MybatisManager;

public class BobDAO {

	public List<BobDTO> list(){
		List<BobDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("bob.list11");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list; 
	}

	public void insert(BobDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("bob.insert11", dto);
			session.commit();//auto commit이 아님
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
	}//insert()

	//첨부파일 이름 찾기
	public String getFileName(int num) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("bob.getFileName11", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}//getFileName()

	//다운로드 횟수 증가 처리
	public void plusDown(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("bob.plusDown11", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//plusDown()

	public BobDTO view(int num) {
		BobDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("bob.view11", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return dto;
	}//view()
	
	public BobDTO viewReplace(int num) {
		BobDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("bob.view11", num);
			//줄바꿈 처리
			String content=dto.getContent();
			content=content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return dto;
		
	}
	
	
	
	
	//조회수 증가 처리
	public void plusReadCount(int num, HttpSession count_session) {
		SqlSession session=null;
		try {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num)!=null) {
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time>5*1000) {//현재시간-읽은시간>5초
				//24*60*60*1000 하루에 한번
				session.update("bob.plusReadCount11", num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute(
						"read_time_"+num, current_time);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
	}//plusReadCount()

	//댓글 목록을 구하는 코드
	public List<BobCommentDTO> commentList(int num) {
		List<BobCommentDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("bob.commentList11", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( session!= null ) session.close();
		}
		return list;
	}

	//댓글 추가
	public void commentAdd(BobCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("bob.commentAdd11", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
	}

	//답글의 순서 조정
	public void updateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			BobDTO dto=new BobDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("bob.updateStep11", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//updateStep

	//답글 쓰기
	public void reply(BobDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("bob.reply11", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}//reply()

	//비밀번호 체크
	public String passwdCheck(int num, String passwd) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("bob.pass_check11", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return result;
	}

	//수정
	public void update(BobDTO dto) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("bob.update11", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}//update()

	public void delete(int num) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("bob.delete11", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	

}
