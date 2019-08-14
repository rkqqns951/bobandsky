package information.dto;


public class InformationDTO {
	private int idx; //게시글 번호
	private String name; //이름
	private String email; //이메일
	private String hp;//번호
	private String passwd;//수정 삭제 비밀번호
	private String content;//내용
	private String post_date;//작성일자
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "InformationDTO [idx=" + idx + ", name=" + name + ", email=" + email + ", hp=" + hp + ", passwd="
				+ passwd + ", content=" + content + ", post_date=" + post_date + "]";
	}
	
	
	
	
	public InformationDTO() {

	}
	public InformationDTO(int idx, String name, String email, String hp, String passwd, String content,
			String post_date) {
		super();
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.hp = hp;
		this.passwd = passwd;
		this.content = content;
		this.post_date = post_date;
	}
	
	
}