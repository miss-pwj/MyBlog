package com.lcl.service;

import com.github.pagehelper.PageInfo;
import com.lcl.entity.Log;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lcl
 * @Description
 */


public interface LogService {

    List<Log> findAllLog();

    Log findLogByUserId(int id);

    int logCount();

    boolean addLog(Log log);

    boolean deleteLogById(int id);

    boolean deleteAll();

    PageInfo<Log> findAllLogsBypage(int pageNum);
}
