package com.jsinc.service.community;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jsinc.jsincDAO.CommunityDAO;
import com.jsinc.jsincDTO.CommunityDTO;
import com.jsinc.jsincDTO.MemberDTO;

@Service
public class AllServiceImpl implements ServiceCom{
	@Autowired
	CommunityDAO dao;
	
	

	@Override
	public void execute(CommunityDTO dto) {
		// TODO Auto-generated method stub
		
	}

	//전체 커뮤니티 리스트를 가져온다.
	@Override
	public void getExe(Model model) {
		ArrayList<CommunityDTO> list=(ArrayList<CommunityDTO>)dao.allCom();
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request= (HttpServletRequest)map.get("request");
		HttpSession session=request.getSession();
		ServletContext application = session.getServletContext();
		MemberDTO memDto =(MemberDTO)application.getAttribute("user");
		
		int empNo = memDto.getEmpNo();
		ArrayList<CommunityDTO> lists =(ArrayList<CommunityDTO>)dao.joinOrNot(empNo);
		System.out.println(lists.get(0).getTitle()); 
		model.addAttribute("join",lists);
		model.addAttribute("allList",list);
	}
	
	
	
}
