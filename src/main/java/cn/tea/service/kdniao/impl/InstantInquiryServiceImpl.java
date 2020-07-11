package cn.tea.service.kdniao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.tea.kdniao.KdniaoTrackQueryAPI;
import cn.tea.service.kdniao.InstantInquiryService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Service
public class InstantInquiryServiceImpl implements InstantInquiryService {
	
	
	@Override
	public String getOrderTracesByJson(String expCode, String expNo) {
		KdniaoTrackQueryAPI api = new KdniaoTrackQueryAPI();
		try {
			return api.getOrderTracesByJson(expCode,expNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

}
