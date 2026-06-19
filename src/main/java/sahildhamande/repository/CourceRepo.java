package sahildhamande.repository;

import java.util.List;

import sahildhamande.model.CourceModel;
import sahildhamande.model.LoginModel;
import sahildhamande.model.RegisterModel;
import sahildhamande.model.SubjectModel;

public interface CourceRepo {

	public boolean isAddCource(CourceModel CourceModel);
	public List<CourceModel> getAllCource();
	public boolean isDleleteCourceById(int cid);
	 public boolean isFinalUpdate(CourceModel courcemodel);
	 public List<CourceModel> getCourceByName(String name);
	 public boolean isAddSubject(SubjectModel model);
	 public List<Object[]> getAllSubjects();
	 public boolean isRegister(RegisterModel register);
	 public Integer getLoginUserId(String username);
	 public RegisterModel findByUsername(String username);
	 
	 //testing
	// public RegisterModel getUserByUsername(String username);
	 
}
