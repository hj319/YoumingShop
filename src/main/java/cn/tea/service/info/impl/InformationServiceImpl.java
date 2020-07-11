package cn.tea.service.info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tea.dao.info.InformationMapper;
import cn.tea.pojo.Information;
import cn.tea.service.info.InformationService;
@Service
public class InformationServiceImpl implements InformationService {

	@Autowired
	private InformationMapper infoMapper;
	public boolean addInfor(Information info) {
		int result=infoMapper.addInfor(info);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	public List<Information> getInfo(Integer uid) {
		// TODO Auto-generated method stub
		return infoMapper.getInfo(uid);
	}

}
