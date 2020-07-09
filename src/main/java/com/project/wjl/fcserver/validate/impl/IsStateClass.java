package com.project.wjl.fcserver.validate.impl;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.project.wjl.fcserver.validate.annotation.IsState;

public class IsStateClass implements ConstraintValidator<IsState, Object> {

    private String[] values;

    @Override
    public void initialize(IsState isState) {
        this.values = isState.values();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext constraintValidatorContext) {
    	if(value==null) {
    		return true;
    	}
        Boolean isFlag = false;
        for (int i = 0; i < values.length; i++){
            if (values[i].equals(value.toString())){
                isFlag = true;
                break;
            }
        }
        return isFlag;
    }

}
