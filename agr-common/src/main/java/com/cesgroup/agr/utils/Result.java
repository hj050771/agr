package com.cesgroup.agr.utils;

/**
 * 	返回结果
 */
public class Result {
	private int status;
	private long count;
	private String msg;
	private Object data;

	public Result setStatus(ResultCode resultCode) {
		this.status = resultCode.code;
		return this;
	}

	public Result setMsg(String msg) {
		this.msg = msg;
		return this;
	}


	public Result setData(Object data) {
		this.data = data;
		return this;
	}

	public int getStatus() {
		return status;
	}

	public String getMsg() {
		return msg;
	}

	public Object getData() {
		return data;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}
}
