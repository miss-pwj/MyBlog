package com.lcl.entity;

import java.util.Date;

/**
 * @author lcl
 * @date 2020/5/13 23:24
 * @Description
 */
public class Log {

    private int id;
    private String operate;
    private Date operateTime;
    private User user;

    public Log() {
    }

    public Log(int id, String operate, Date operateTime, User user) {
        this.id = id;
        this.operate = operate;
        this.operateTime = operateTime;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", operate='" + operate + '\'' +
                ", operateTime=" + operateTime +
                ", user=" + user +
                '}';
    }
}
