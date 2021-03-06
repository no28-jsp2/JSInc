package com.jsinc.services.todo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jsinc.jsincDAO.ToDoListDAO;

// 삭제 서비스
@Service
public class DeleteService implements ServiceIf{
	@Autowired
	ToDoListDAO dao;
	
	// by성택_삭제하기_20200606
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		dao.delete(request.getParameter("btns"));
	}
}
