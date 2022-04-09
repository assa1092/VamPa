package com.vam.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.AttachMapper;
import com.vam.model.AttachImageVO;

@Service
public class AttachServiceImpl implements AttachService{
	
	@Autowired
	private AttachMapper attachMapper;
	
	Logger logger = LoggerFactory.getLogger(AttachServiceImpl.class);
	

	@Override
	public List<AttachImageVO> getAttachList(int bookId) {

		logger.info("getAttachList () -------------- : ");
		
		return attachMapper.getAttachList(bookId);
	}

}
