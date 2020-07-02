package com.project.wjl.fcserver.util;

public class Result<T> {
	private int code = 0;
	private String msg = "操作成功";
	private T data = null;

	public Result<T> setCode(int code) {
		this.code = code;
		return this;
	}

	public int getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

	public Result<T> setMsg(String msg) {
		this.msg = msg;
		return this;
	}

	public T getData() {
		return data;
	}

	public Result<T> setData(T data) {
		this.data = data;
		return this;
	}

}