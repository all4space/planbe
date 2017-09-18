package scit.master.planbe.dao;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;

public interface Taskmapper {
	public void Insert(Map<String, Object>map); // 업무 생성
	public ArrayList<TaskVO> getList(Map<String,Object>map,RowBounds rb);//업무 리스트 출력하기
	public TaskVO findTask(TaskVO taskVo);// 업무 찾기
	public void updateTask(TaskVO taskVo); // 업무 수정하기
	public void deleteTask(TaskVO taskVo); // 업무 삭제하기
	public int getTotalCount(Map<String, Object> map); // 총 레코드 수 가져오기
	public ProjectVO projectNoList(MemberVO memberVO); // 프로젝트 넘버 가져오기
	public TaskVO searchTask(Map<String, Object> map); // progress 에서 task 가져오기
	public ArrayList<TaskVO>getTotalList(Map<String,Object>map); // 전체 리스트(페이지 수와 상관없이) 가져오기

}

