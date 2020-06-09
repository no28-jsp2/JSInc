package com.jsinc.jsincDAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsinc.jsincDTO.MessageDTO;

@Repository
public class MessageDAO {
	private static final String namespace="com.jsinc.mybatis.message";
	@Autowired
	private SqlSession sqlSession;
	public void sendMes(MessageDTO dto) {
		sqlSession.insert(namespace+".sendMes",dto);
	}
	
	public List<MessageDTO> sentView(int empNo){
		return sqlSession.selectList(namespace+".sentView",empNo);
	}
}
