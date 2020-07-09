package com.lcl.mapper;

import com.lcl.entity.Log;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author lcl
 * @date 2020/5/13 23:20
 * @Description
 */

public interface LogMapper {


    List<Log> findAll();

    Log findByUserId(int id);

    int count();

    boolean insert(Log log);

    boolean delete(int id);

    boolean deleteAll();

}
