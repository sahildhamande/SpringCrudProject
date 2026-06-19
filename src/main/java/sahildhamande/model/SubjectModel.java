package sahildhamande.model;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class SubjectModel {
 private int id;
 private String name;
 private MultipartFile img;
 private MultipartFile pdf;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public MultipartFile getImg() {
	return img;
}
public void setImg(MultipartFile img) {
	this.img = img;
}
public MultipartFile getPdf() {
	return pdf;
}
public void setPdf(MultipartFile pdf) {
	this.pdf = pdf;
}
private List<String> cource;
public List<String> getCource() {
	return cource;
}
public void setCource(List<String> cource) {
	this.cource = cource;
}
}
