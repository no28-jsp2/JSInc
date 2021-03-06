package com.jsinc.services.todo;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jsinc.jsincDAO.ToDoListDAO;
import com.jsinc.jsincDTO.ToDoListDTO;

// 수정 서비스
@Service
public class EditService implements ServiceIf{
	@Autowired
	ToDoListDAO dao;
	
	// by성택_수정하기_20200606
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		
		ToDoListDTO dto = (ToDoListDTO) session.getAttribute("editPage");
		dto.setsDate(request.getParameter("todo"));
		dto.seteDate(request.getParameter("eDate"));
		
		dao.edit(dto);
		
	}

}
