package com.project.wjl.fcserver.util;

public class Result<T> {
	private int code = 0;
	private String msg = "操作成功";
	private T data = null;
	
	public Result() {
		super();
		code = 0;
		msg = "操作成功";
	}
	
	public void errorResult(int code,String msg) {
		this.code = code;
		this.msg = msg;
		this.data = null;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}

	

}