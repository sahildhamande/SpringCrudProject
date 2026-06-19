package sahildhamande.repository;



import java.sql.Array;


import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.RowId;
import java.sql.SQLException;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import sahildhamande.model.CourceModel;
import sahildhamande.model.LoginModel;
import sahildhamande.model.RegisterModel;
import sahildhamande.model.SubjectModel;

@Repository
public class RepositoryImple implements CourceRepo{

	@Autowired
	JdbcTemplate template;
	
	@Autowired
	PasswordEncoder passwordencoder; //comment for user defined
	@Override
	public boolean isAddCource(CourceModel CourceModel) {
		int value=template.update("insert into cource values('0',?)",new Object[] {CourceModel.getCourceName()});
		return value>0?true:false;
	}
	
	public List<CourceModel> getAllCource(){
		List<CourceModel> list=template.query("select * from cource",new RowMapper<CourceModel>(){

			@Override
			public CourceModel mapRow(ResultSet rs, int rowNum) throws SQLException {
	               CourceModel model=new CourceModel();
	               model.setCourceName(rs.getString("name"));
	               model.setId(rs.getInt("id"));
				return model;
			}
			
		});
		return list;
		
	}

	@Override
	public boolean isDleleteCourceById(int cid) {
		int value=template.update("delete from cource where id=?",new Object[] {cid});
		return value>0?true:false;
	}

	@Override
	public boolean isFinalUpdate(CourceModel courcemodel) {
         int value=template.update("update cource set name=? where id=?",new Object[] {courcemodel.getCourceName(),courcemodel.getId()});
		return value>0?true:false;
	}

	@Override
	public List<CourceModel> getCourceByName(String name) {
        List<CourceModel> courceList=template.query("select * from cource where name like '%"+name+"%'",
        		new RowMapper<CourceModel>(){

					@Override
					public CourceModel mapRow(ResultSet rs, int rowNum) throws SQLException {
						CourceModel model=new CourceModel();
						model.setId(rs.getInt(1));
						model.setCourceName(rs.getString(2));
						return model;
					}
        	
        });
		return courceList;
	}
	//method to get subject id
	public int getSubjectId() {
		int val=template.queryForObject("select max(id) from sub", Integer.class);
		return val;
	}
	

	@Override
	public boolean isAddSubject(SubjectModel model) {
		String name=model.getName();
	       MultipartFile image=model.getImg();
	       MultipartFile pdf=model.getPdf();
	       List<String> checkboxes=model.getCource();
	       int value=template.update("insert into sub values('0',?,?,?)",new Object[] {name,image.getOriginalFilename(),pdf.getOriginalFilename()});
	       if(value>0)
	       {
	    	   int subId=this.getSubjectId();
	    	   for(String courceid:checkboxes) {
	    		   int cid=Integer.parseInt(courceid);
	    		   value=template.update("insert into csjoin2 values(?,?)", new Object[] {subId,cid});
	    	   }
	       }
		return value>0?true:false;
	}

	@Override
	public List<Object[]> getAllSubjects() {
	
		List<Object[]>list=template.query(
				"select c.name,s.sname,s.sphoto,s.spdf from cource c inner join csjoin2 cs on c.id=cs.cid inner join sub s on s.id=cs.sid ",
				 new RowMapper<Object[]>(){

					@Override
					public Object[] mapRow(ResultSet rs, int rowNum) throws SQLException {
						String imgpath=rs.getString(3);
						Object obj[]=new Object[] {rs.getString(1),rs.getString(2),imgpath,rs.getString(4)};
						return obj;
					}
			
		});
		return list;
	}

	@Override
	public boolean isRegister(RegisterModel register) {
	    String originalPassword=register.getPassword();
	    String encryptedPassword=this.passwordencoder.encode(originalPassword);
	    int value=this.template.update("insert into userdetails values('0',?,?,?,?,?,?)",new PreparedStatementSetter() {

			public void setValues(PreparedStatement ps) throws SQLException {
			 ps.setString(1, register.getName());
			 ps.setString(2, register.getEmail());
			 ps.setString(3, register.getContact());
			 ps.setString(4, register.getUsername());
			 ps.setString(5, encryptedPassword);
			 ps.setInt(6,register.getCid());
			}
			});
		return value>0?true:false;
	}

	@Override
	public Integer getLoginUserId(String username) {
     Integer userId=template.queryForObject("select rid from userdetails where username=?", new Object[] { username }, Integer.class);
		return userId;
	}

	@Override
	public RegisterModel findByUsername(String username) {
		String sql = "select * from userdetails where username = ?";
		List<RegisterModel> list = template.query(sql, new Object[] { username }, new RowMapper<RegisterModel>() {

			@Override
			public RegisterModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				RegisterModel user = new RegisterModel();
				user.setId(rs.getInt("rid"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setContact(rs.getString("contact"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setCid(rs.getInt("cid"));
				return user;
			}
		});
		return list.isEmpty() ? null : list.get(0);
	}

	/*
	@Override
	public boolean isLoginCheck(LoginModel login) {
	      LoginModel dbUser=findByUsername(login.getUsername());
	      if (dbUser == null) {
	          return false;
	      }
	      return passwordencoder.matches(
	              login.getPassword(),
	              dbUser.getPassword()
	      );
	}
	
	//testing
	/*
	public RegisterModel getUserByUsername(String username)
	{
		 List<RegisterModel> list = template.query(
			        "select * from userdetails where username=?",
			        new Object[] { username },
			        new RowMapper<RegisterModel>() {

			            @Override
			            public RegisterModel mapRow(ResultSet rs,
			                    int rowNum) throws SQLException {

			                RegisterModel user =
			                        new RegisterModel();

			                user.setId(rs.getInt("rid"));
			                user.setUsername(
			                        rs.getString("username"));
			                user.setPassword(
			                        rs.getString("password"));

			                return user;
			            }
			        });

			    return list.isEmpty() ? null : list.get(0);
	}
	
	public LoginModel findByUsername(String username) {

	    String sql = "select * from userdetails where username=?";

	    List<LoginModel> list = template.query(
	            sql,
	            new Object[]{username},
	            new RowMapper<LoginModel>() {

	                @Override
	                public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {

	                    LoginModel user = new LoginModel();
	                    System.out.println("Searching username: " + username);
	                    user.setUsername(rs.getString("username"));
	                    user.setPassword(rs.getString("password"));

	                    return user;
	                }
	            }
	    );

	    return list.isEmpty() ? null : list.get(0);
	}
	*/
	

}
