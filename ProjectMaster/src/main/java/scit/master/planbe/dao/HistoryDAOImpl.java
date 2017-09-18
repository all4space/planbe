package scit.master.planbe.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class HistoryDAOImpl implements HistoryDAO {

	@Autowired
	SqlSession Sqlsession;

	@Override
	public String getCodeContent(int CODENO) {
		HistoryMapper mapper = Sqlsession.getMapper(HistoryMapper.class);
		return mapper.getCodeContent(CODENO);
	}
}
