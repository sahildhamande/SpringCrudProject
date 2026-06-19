package sahildhamande.customException;

public class CourceNotFoundException extends RuntimeException{
	private String errorMsg;
	public CourceNotFoundException(String errorMsg) {
		super(errorMsg);
		this.errorMsg=errorMsg; //couce not found exception
	}
    public String getErrorMsg() {
    	return errorMsg;
    }
}
