package sahildhamande.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import sahildhamande.model.CourceModel;
import sahildhamande.model.LoginModel;
import sahildhamande.model.RegisterModel;
import sahildhamande.model.SubjectModel;
import sahildhamande.repository.RepositoryImple;

@Service
public class CourSrviceImpl implements CourceService{

	@Autowired
	RepositoryImple repository;
	
	@Override
	public boolean isAddCource(CourceModel CourceModel) {
		
		return repository.isAddCource(CourceModel);
	}

	@Override
	public List<CourceModel> getAllCource() {
		
		return repository.getAllCource();
	}

	@Override
	public boolean isDleleteCourceById(int cid) {
		
		return repository.isDleleteCourceById(cid);
	}

	@Override
	public boolean isFinalUpdate(CourceModel courcemodel) {
          
		return repository.isFinalUpdate(courcemodel);
	}

	@Override
	public List<CourceModel> getCourceByName(String name) {
	
		return repository.getCourceByName(name);
	}

	@Override
	public boolean isAddSubject(SubjectModel model) {
		
		return repository.isAddSubject(model);
	}

	@Override
	public List<Object[]> getAllSubjects() {
		
		return repository.getAllSubjects();
	}


	public boolean isRegister(RegisterModel register) {
	
		return repository.isRegister(register);
	}

	@Override
	public Integer getLoginUserId(String username) {
         
		return repository.getLoginUserId(username);
	}
	@Autowired
	PasswordEncoder passwordencoder; //comment for user defined

	@Override                          //this things are provided by user
	public RegisterModel loginUser(String username, String password) {
		RegisterModel validUser = repository.findByUsername(username);
		
		if(validUser != null && passwordencoder.matches(password,
                validUser.getPassword()))
		{
			return validUser;
		}
		return null;
		
	}

	/*
	@Override
	public boolean isLoginCheck(LoginModel login) {
		
		return repository.isLoginCheck( login);
	}

	//testing
	//@Override
	/*public RegisterModel getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return repository.getUserByUsername(username);
	}
	*/

}
