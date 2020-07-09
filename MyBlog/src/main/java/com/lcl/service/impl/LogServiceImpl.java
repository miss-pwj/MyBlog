package com.lcl.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lcl.mapper.LogMapper;
import com.lcl.entity.Log;
import com.lcl.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author lcl
 * @Description
 */
@Service
public class LogServiceImpl implements LogService {

    @Autowired
    LogMapper logMapper;

    @Override
    public List<Log> findAllLog() {
        List<Log> logs = logMapper.findAll();
        return logs;
    }

    @Override
    public Log findLogByUserId(int id) {
        Log log = logMapper.findByUserId(id);
        return log;
    }

    @Override
    public int logCount() {

        int count = logMapper.count();
        return count;
    }

    @Override
    public boolean addLog(Log log) {

        boolean b = logMapper.insert(log);
        return b;
    }

    @Override
    public boolean deleteLogById(int id) {
        return logMapper.delete(id);
    }

    @Override
    public boolean deleteAll() {
        return logMapper.deleteAll();
    }

    @Override
    public PageInfo<Log> findAllLogsBypage(int pageNum) {
        int pageSize=10;
        Page page = PageHelper.startPage(pageNum,pageSize,true);
        List<Log> logs = logMapper.findAll();
        PageInfo<Log> pageInfo = new PageInfo<>(logs);
        System.err.println(page);
        return pageInfo;
    }
}
