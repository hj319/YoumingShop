package cn.tea.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tea.kdniao.KdniaoTrackQueryAPI;
import cn.tea.service.kdniao.InstantInquiryService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class InstantInquiryController {
	@Autowired
	private InstantInquiryService inquiryService;
	
	@RequestMapping(value="instantList",method=RequestMethod.POST)
	@ResponseBody
	public String getOrderTracesByJson(@RequestParam("expNo") String expNo,@RequestParam("expCode") String expCode,
			HttpSession session) {
		List<String> oiqlist= new ArrayList<String>();
		System.out.println(expNo);
		System.out.println(expCode);
		try {
            //第一个参数是快递公司简称（YD -- 韵达速递）
            //第二个参数是需要查询的快递单号
			//"ZTO", "75368303558896"
            String result = inquiryService.getOrderTracesByJson(expCode, expNo);
            JSONObject jsonObject = JSONObject.fromObject(result);
            String ShipperCode = jsonObject.getString("ShipperCode");
            String LogisticCode = jsonObject.getString("LogisticCode");
            JSONArray Traces = jsonObject.getJSONArray("Traces");
            System.out.print(result+"\n");
            if(ShipperCode=="ZTO") ShipperCode="中通快递";
            String sc=ShipperCode;
            String lc=LogisticCode;
            //快递名称
            List<String> sclist=new ArrayList<String>();
            sclist.add(sc);
            session.setAttribute("sclist", sclist);
            //快递单号
            List<String> lclist=new ArrayList<String>();
            sclist.add(lc);
            session.setAttribute("lclist", lclist);
            System.out.println("快递名称"+ShipperCode);
            System.out.println("快递单号"+LogisticCode);
            for(int i = 0; i < Traces.size(); i++) {
                JSONObject object = (JSONObject) Traces.get(i);
                String AcceptTime = object.getString("AcceptTime");
                String AcceptStation = object.getString("AcceptStation");
                String s="时间："+AcceptTime+"\t"+AcceptStation;
                oiqlist.add(s);
                System.out.println("时间："+AcceptTime+"\t"+AcceptStation);
            }           
        } catch (Exception e) {
            e.printStackTrace();
        }
		System.out.println(oiqlist);
		session.setAttribute("oiqlist", oiqlist);
		if(oiqlist==null) {
			return "false";
		}
		return "true";
	}
}
