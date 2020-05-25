package com.madmax.stool.calendar.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madmax.stool.calendar.controller.CalendarController;
import com.madmax.stool.calendar.model.dao.CalendarDao;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<CalendarController> selectSchedule(String id) {
		// TODO Auto-generated method stub
		return dao.selectSchedule(session,id);
	}
	
	
	
	
	
}