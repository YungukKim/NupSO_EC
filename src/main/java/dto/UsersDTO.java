package dto;

public class UsersDTO {
	
	private int userSeq;
	private String userId;
	private String password;
	private String addr;
	private String name;
	private int age;
	private int gender;
	private String phone;
	private String userState;
	private String regDate;
	
	
	
	
	
	public UsersDTO(int userSeq, String userId, String password, String addr, String name, int age, int gender,
			String phone, String userState, String regDate) {
		super();
		this.userSeq = userSeq;
		this.userId = userId;
		this.password = password;
		this.addr = addr;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.phone = phone;
		this.userState = userState;
		this.regDate = regDate;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
	
	
	
	
}
















