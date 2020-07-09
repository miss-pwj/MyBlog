package com.lcl.service.impl;

import com.lcl.entity.Options;
import com.lcl.entity.custom.OptionsCustom;
import com.lcl.mapper.OptionsMapper;
import com.lcl.mapper.custom.OptionsMapperCustom;
import com.lcl.service.OptionsService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author lcl
 * @Description
 */

@Service
public class OptionsServiceImpl implements OptionsService {

	@Autowired
	private OptionsMapperCustom optionsMapperCustom;

	@Autowired
	private OptionsMapper optionsMapper;

	@Override
	public OptionsCustom getOptions() throws Exception {
		Options options = optionsMapperCustom.getOptions();
		OptionsCustom optionsCustom = new OptionsCustom();
		if(options!=null) {
			BeanUtils.copyProperties(options, optionsCustom);
		}
		return optionsCustom;
	}

	@Override
	public void insertOptions(Options options) throws Exception {
		optionsMapper.insertSelective(options);
	}

	@Override
	public void updateOptions(Options options) throws Exception {
		optionsMapper.updateByPrimaryKeySelective(options);
	}
}
