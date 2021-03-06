package com.madmax.stool.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.user.model.vo.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public int insertUser(SqlSessionTemplate session, Map param) {
	
		return session.insert("user.insertUser", param);
	}


	@Override
	public User selectUser(SqlSessionTemplate session, String userId) {
		
		return session.selectOne("user.selectUser", userId);
	}


	@Override
	public User selectId(SqlSessionTemplate session, Map param) {
		
		return session.selectOne("user.selectId", param);
	}


	@Override
	public User findPw(SqlSessionTemplate session, Map<String, Object> map) {
	
		return session.selectOne("user.findPw", map);
	}

	@Override
	public int changePw(SqlSessionTemplate session, Map<String, String> map) {

		return session.update("user.changePw", map);
	}


	@Override
	public int updatePw(SqlSessionTemplate session, Map param) {
		
		return session.update("user.updatePw", param);
	}


	@Override
	public int updateUser(SqlSessionTemplate session, Map param) {
		
		return session.update("user.updateUser", param);
	}




	
	

	
	
}
