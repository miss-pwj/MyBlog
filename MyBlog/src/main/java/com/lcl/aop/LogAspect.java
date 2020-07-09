package com.lcl.aop;

import com.lcl.aop.annotation.LogAnnotation;
import com.lcl.entity.Log;
import com.lcl.entity.User;
import com.lcl.service.LogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Date;

/**
 * @author lcl
 * @date 2020/5/13 23:00
 * @Description
 */

@Component("logAspect")
@Aspect
public class LogAspect {
    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

    static{
        System.err.println("进入日志界面");
    }


    @Autowired
    private LogService logService;


    @Pointcut("execution(* com.lcl.service.UserService.getUserBy*(..))")
    public void pointcutLogin() {
    }
//    @Pointcut("execution(* com.lcl.controller.UserController.userLogOut(..))")
//    public void pointcutLogout() {
//    }
    @Pointcut("execution(* com.lcl.service.UserService.insertUser(..))")
    public void pointcutaddUser() {
    }
    @Pointcut("execution(* com.lcl.service.UserService.updateUser(..))")
    public void pointcutupdateUser() {
    }
    @Pointcut("execution(* com.lcl.service.UserService.deleteUser(..))")
    public void pointcutdeleteUser() {
    }

    @AfterReturning(pointcut = "pointcutLogin()", returning = "user")
    public void afterLogin(JoinPoint jp, User user) {
        System.out.println("AOP------日志登录--------");
        if(user != null){
            Log log = new Log();
            log.setUser(user);
            log.setOperate("用户登录");
            log.setOperateTime(new Date());
            System.err.println("添加登录日志:"+ logService.addLog(log)+";"+log);

            // 获取方法签名
            MethodSignature methodSignature = (MethodSignature) jp.getSignature();
            // 获取方法
            Method method = methodSignature.getMethod();
            // 获取方法上面的注解
            LogAnnotation logAnno = method.getAnnotation(LogAnnotation.class);
            // 获取操作描述的属性值
            String operateType = logAnno.value();

            logger.info("方法签名："+method);
            logger.info("方法类型："+operateType);
            logger.info("时间："+log.getOperateTime());
            logger.info("用户："+log.getId());
        }


    }


    @AfterReturning(pointcut = "pointcutaddUser()", argNames = "jp")
    public void pointcutaddUser(JoinPoint jp) {
        Log log = new Log();
        Object[] user = jp.getArgs();
        log.setUser((User)user[0]);
        log.setOperate("用户添加");
        log.setOperateTime(new Date());
        System.err.println("添加用户添加日志:"+ logService.addLog(log)+";"+log);
        // 获取方法签名
        MethodSignature methodSignature = (MethodSignature) jp.getSignature();
        // 获取方法
        Method method = methodSignature.getMethod();
        // 获取方法上面的注解
        LogAnnotation logAnno = method.getAnnotation(LogAnnotation.class);
        // 获取操作描述的属性值
        String operateType = logAnno.value();

        logger.info("方法签名："+method);
        logger.info("方法类型："+operateType);
        logger.info("时间："+log.getOperateTime());
        logger.info("用户："+log.getId());


    }
  @AfterReturning(pointcut = "pointcutupdateUser()", argNames = "jp")
    public void pointcutupdateUser(JoinPoint jp) {
        Log log = new Log();
        Object[] user = jp.getArgs();
        log.setUser((User)user[0]);
        log.setOperate("用户修改");
        log.setOperateTime(new Date());
        System.err.println("添加用户修改日志:"+ logService.addLog(log)+";"+log);
        // 获取方法签名
        MethodSignature methodSignature = (MethodSignature) jp.getSignature();
        // 获取方法
        Method method = methodSignature.getMethod();
        // 获取方法上面的注解
        LogAnnotation logAnno = method.getAnnotation(LogAnnotation.class);
        // 获取操作描述的属性值
        String operateType = logAnno.value();

        logger.info("方法签名："+method);
        logger.info("方法类型："+operateType);
        logger.info("时间："+log.getOperateTime());
        logger.info("用户："+log.getId());

    }
  @AfterReturning(pointcut = "pointcutdeleteUser()", argNames = "jp")
    public void pointcutdeleteUser(JoinPoint jp) {
        Log log = new Log();
        Object[] user = jp.getArgs();
         User u = new User();
         u.setUserId((Integer)user[0]);
        log.setUser(u);
        log.setOperate("用户删除");
        log.setOperateTime(new Date());
        System.err.println("添加用户删除日志:"+ logService.addLog(log)+";"+log);
        // 获取方法签名
        MethodSignature methodSignature = (MethodSignature) jp.getSignature();
        // 获取方法
        Method method = methodSignature.getMethod();
        // 获取方法上面的注解
        LogAnnotation logAnno = method.getAnnotation(LogAnnotation.class);
        // 获取操作描述的属性值
        String operateType = logAnno.value();

        logger.info("方法签名："+method);
        logger.info("方法类型："+operateType);
        logger.info("时间："+log.getOperateTime());
        logger.info("用户："+log.getId());


    }

}
