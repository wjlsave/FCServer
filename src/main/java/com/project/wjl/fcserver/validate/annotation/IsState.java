package com.project.wjl.fcserver.validate.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.project.wjl.fcserver.validate.impl.IsStateClass;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.PARAMETER,ElementType.FIELD})
@Constraint(validatedBy = IsStateClass.class)

public @interface IsState {
	String[] values() default {"0","1"};
    String message() default "state格式不正确";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
