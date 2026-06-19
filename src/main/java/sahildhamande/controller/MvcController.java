package sahildhamande.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import sahildhamande.config.WebAppInitializer;
import sahildhamande.customException.CourceNotFoundException;
import sahildhamande.model.CourceModel;
import sahildhamande.model.LoginModel;
import sahildhamande.model.RegisterModel;
import sahildhamande.model.SubjectModel;
import sahildhamande.service.CourSrviceImpl;

@Controller
@CrossOrigin(origins="http://127.0.0.1:5500")
public class MvcController {
	@Autowired
	CourSrviceImpl service;
	
	@PostMapping("/savecource")
	public String SaveCource(CourceModel CourceModel)
	{
		boolean b=service.isAddCource(CourceModel);
		return "cource";
	}
	
	@GetMapping("/dashboard")
	public String home()
	{
		//String username=authentication.getName();
		//Integer loginUserId=service.getLoginUserId(username);
		//session.setAttribute("loginUserId",loginUserId);
		//System.out.println("Controller Working");
		return "index";
	}
	
	@GetMapping("/newcourse")
	public String newCourse() {
		return "cource";
	}
	
	@GetMapping("/viewc")
	public String viewcource(Map<String,List<CourceModel>>map)
	{
		List<CourceModel> list=service.getAllCource();
		map.put("courceList",list);
	
		return "viewcource";
	}
	
	@GetMapping("/delCource")
	public RedirectView delCource(@RequestParam("cid") Integer cid) {
		service.isDleleteCourceById(cid);
		RedirectView rd=new RedirectView();
		rd.setUrl("viewc");
		return rd;
	}
	
	@GetMapping("/upd")
	public String updatePage(@RequestParam("cid") Integer cid,@RequestParam("cname") String name,Map<String,Object> map) {
		map.put("cid", cid);
		map.put("cname",name);
		return "update";
	}
	
	@PostMapping("/finalUpdate")
	public RedirectView finalUpdate(CourceModel courcemodel) {
        service.isFinalUpdate(courcemodel);
		RedirectView rd=new RedirectView();
		rd.setUrl("viewc");
		return rd;
		
	}
	
	@GetMapping("/search")
	@ResponseBody
	public ResponseEntity<List<CourceModel>> searchByName(@RequestParam("name") String name)
	{
		System.out.println(name);
		List<CourceModel> list=service.getCourceByName(name);
		if(list.size()==0)
		{
			throw new CourceNotFoundException("cource not found exception");
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
    @GetMapping("/addsubject")
	public String newSubject(Map<String,List<CourceModel>>map) {
    	List<CourceModel> list=service.getAllCource();
    	map.put("courceList", list);
		return "subject";
		
	}
    
    //file uploading 
    /*
    @PostMapping("/upload")
    public String uploadFile(SubjectModel model,Map<String,String> map)
    {
       String name=model.getName();
       MultipartFile image=model.getImg();
       MultipartFile pdf=model.getPdf();
       List<String> checkboxes=model.getCource();
       System.out.println(name+"\t"+image.getOriginalFilename()+"\t"+pdf.getOriginalFilename()+"\t"+checkboxes);
       if(image.isEmpty() || pdf.isEmpty())
       {
    	   map.put("msg", "File not selected properly");
       }
       else
       {
    	   String uploadPdf=WebAppInitializer.docFilepath;
    	   String uploadImg=WebAppInitializer.imgFilepath;
    	   File docDestination=new File(uploadPdf+pdf.getOriginalFilename());
    	   File imdDestination=new File(uploadImg+image.getOriginalFilename());
    	   System.out.println("Image Path = " + imdDestination.getAbsolutePath());
    	   try {
    		   pdf.transferTo(docDestination);
    		   image.transferTo(imdDestination);
    		   boolean b=service.isAddSubject(model);
    		   if(b)
    		   {
    			   map.put("msg","subject added succesfully");
    		   }
    		   else
    		   {
    			   map.put("msg","subject not added");
    		   }
    		   map.put("msg", "File Upladed Sucees");
    	   } catch (IllegalStateException | IOException e)
    	   {
    		   e.printStackTrace();
    	   }
       }
    	return "subject";
    }
    */
    @PostMapping("/upload")
    public String uploadFile(SubjectModel model, Map<String,String> map) {

        MultipartFile image = model.getImg();
        MultipartFile pdf = model.getPdf();

        if(image.isEmpty() || pdf.isEmpty()) {
            map.put("msg", "File not selected properly");
        }
        else {
            try {
                String uploadPdf = WebAppInitializer.docFilepath;
                String uploadImg = WebAppInitializer.imgFilepath;

                File docDestination =
                        new File(uploadPdf + pdf.getOriginalFilename());

                File imgDestination =
                        new File(uploadImg + image.getOriginalFilename());

                System.out.println("PDF Path = " + docDestination.getAbsolutePath());
                System.out.println("IMG Path = " + imgDestination.getAbsolutePath());

                pdf.transferTo(docDestination);
                image.transferTo(imgDestination);

                boolean b = service.isAddSubject(model);

                map.put("msg",
                        b ? "Subject Added Successfully"
                          : "Subject Not Added");

            } catch (Exception e) {
                e.printStackTrace();
                map.put("msg", "Upload Failed");
            }
        }

        return "subject";
    }
    @GetMapping("/viewsubject")
    public String viewSubject(Map<String,List<Object[]>>map) {
    	List<Object[]> list=service.getAllSubjects();
    	System.out.println(list.size());
    	map.put("slist",list);
		return "viewsubject";
    	
    }
    
    @GetMapping("/custlogin")
    public String loginPage() {
        return "myloginpage";
    }
    
    
    @GetMapping("/")
    public String root() {
        return "redirect:/custlogin";
    }
    @GetMapping("/register")
    public String signUp(Map<String,List<CourceModel>>map) {
    	List<CourceModel> list=service.getAllCource();
    	map.put("courceList", list);
    	return "signup";
    }
     //back from regestration done now user want to login
    @GetMapping("/backtologin")
    public String backLogin() {
    	return "myloginpage";
    }
    
    @PostMapping("saveuser")
    public RedirectView saveRegisterUser(RegisterModel register) {
    	service.isRegister(register);
    	RedirectView rv=new RedirectView();
    	rv.setUrl("register");
    	return rv;
    }
}
