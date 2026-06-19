package sahildhamande.customException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {
 @ExceptionHandler(CourceNotFoundException.class)
 public ResponseEntity<ErrorMessage> handleCourceNotFoundException(CourceNotFoundException c){
	 ErrorMessage err=new ErrorMessage();
	 err.setStatus(HttpStatus.NOT_FOUND.value()); 
	 err.setMessage(c.getErrorMsg()); //err.setMessage("cource not found exception")
	 return new ResponseEntity<>(err,HttpStatus.NOT_FOUND);
 }
}
