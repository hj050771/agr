package com.cesgroup.agr.exceptions;

/**
 * 业务异常
 */
public class ServiceException extends RuntimeException{
    /**
	 * 
	 */
	private static final long serialVersionUID = 4853257434364989726L;

	public ServiceException(String message){
        super(message);
    }

}
