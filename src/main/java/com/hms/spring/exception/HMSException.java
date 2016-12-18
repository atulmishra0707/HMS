package com.hms.spring.exception;

public class HMSException extends Exception {

	private static final long serialVersionUID = 4152372170541508940L;

	/**
	 * 
	 */
	public HMSException() {
		super();
 	}

	/**
	 * @param arg0
	 * @param arg1
	 */
	public HMSException(String message, Throwable ex) {
		super(message, ex);
 	}

	/**
	 * @param arg0
	 */
	public HMSException(String message) {
		super(message);
 	}

	/**
	 * @param arg0
	 */
	public HMSException(Throwable ex) {
		super(ex);
 	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "HMSException: ["
				+ getMessage() + "]";
	}
	
	
	
}
