package com.lcl.service.impl;

import com.lcl.entity.Link;
import com.lcl.entity.custom.LinkCustom;
import com.lcl.mapper.LinkMapper;
import com.lcl.mapper.custom.LinkMapperCustom;
import com.lcl.service.LinkService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lcl
 * @Description
 */
@Service
public class LinkServiceImpl implements LinkService {
	
	@Autowired
	private LinkMapperCustom linkMapperCustom;
	
	@Autowired
	private LinkMapper linkMapper;
	@Override
	public Integer countLink(Integer status) throws Exception {
		Integer linkCount = linkMapperCustom.countLink(status);
		return linkCount;
	}
	
	@Override
	public List<LinkCustom> listLink(Integer status) throws Exception {
		List<LinkCustom> linkList = linkMapperCustom.listLink(status);
		return linkList;
	}

	@Override
	public void insertLink(Link link) throws Exception {
		linkMapper.insertSelective(link);
	}

	@Override
	public void deleteLink(Integer id) throws Exception {
		linkMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateLink(Link link) throws Exception {
		linkMapper.updateByPrimaryKeySelective(link);
	}

	@Override
	public LinkCustom getLinkById(Integer id) throws Exception {
		Link link = linkMapper.selectByPrimaryKey(id);
		LinkCustom linkCustom = new LinkCustom();
		BeanUtils.copyProperties(link,linkCustom);
		return linkCustom;
	}

}
