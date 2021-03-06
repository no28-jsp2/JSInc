package com.jsinc.services.attendance;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jsinc.jsincDTO.AttendanceDTO;

// 출근 시간 기록 서비스
@Service
public class GoWorkService implements ServiceIf {

	// by성택_출근 시간 기록_20200523
	@Override
	public AttendanceDTO execute(Model model){
		Map<String, Object> map = model.asMap();
		AttendanceDTO dto_att = (AttendanceDTO)map.get("dto_att");
		// 출근 시간 생성
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd ");
		SimpleDateFormat time = new SimpleDateFormat(":mm:ss");
		String start = format.format(date) + date.getHours() + time.format(date); 
		// 시간을 24h로 표현하기 위함

		dto_att.setGoWork(start); // 출근시간을 매개변수에 set
		return dto_att; // 출근 시간이 기록된 dto를 리턴
	}
}
