package com.lcl.aop.annotation;

import java.lang.annotation.*;

/**
 * @author lcl
 * @date 2020/5/13 23:07
 * @Description
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogAnnotation {

    //        /**
//         * 要执行的操作类型比如：add操作
//         **/
//    public String operationType() default "";
//
//        /**
//         * 要执行的具体操作比如：添加用户
//         **/
//        public String operationName() default "";

    String value();
}