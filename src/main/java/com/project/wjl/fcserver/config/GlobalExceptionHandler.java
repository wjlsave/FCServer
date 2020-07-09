package com.project.wjl.fcserver.config;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;

import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.project.wjl.fcserver.util.Result;

@RestControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(value = BindException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public Result<List<String>> handleBindGetException(BindException ex) {
		Result<List<String>> result = new Result<List<String>>();
        // 获取所有异常
        List<String> errors = ex.getBindingResult()
                .getFieldErrors()
                .stream()
                .map(x -> x.getDefaultMessage())
                .collect(Collectors.toList());
        result.errorResult(400, "提交的数据校验失败");
        result.setData(errors);
        return result;
    }
	
	@ExceptionHandler(value = MethodArgumentNotValidException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public Result<List<String>> handleBindGetException(MethodArgumentNotValidException ex) {
		Result<List<String>> result = new Result<List<String>>();
        // 获取所有异常
        List<String> errors = ex.getBindingResult()
                .getFieldErrors()
                .stream()
                .map(x -> x.getDefaultMessage())
                .collect(Collectors.toList());
        result.errorResult(400, "提交的数据校验失败");
        result.setData(errors);
        return result;
    }
	
	@ExceptionHandler(value = ValidationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result<List<String>> handleBindException(ValidationException ex) {

        Result<List<String>> result = new Result<List<String>>();
        // 获取所有异常
        List<String> errors = new LinkedList<String>();
        if(ex instanceof ConstraintViolationException){
            ConstraintViolationException exs = (ConstraintViolationException) ex;
            Set<ConstraintViolation<?>> violations = exs.getConstraintViolations();
            for (ConstraintViolation<?> item : violations) {
                errors.add(item.getMessage());
            }
        }
        result.errorResult(400, "提交的数据校验失败");
        result.setData(errors);
        return result;
    }
}
