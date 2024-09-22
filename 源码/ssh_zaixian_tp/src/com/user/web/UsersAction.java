package com.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.user.model.Users;
import com.user.service.IUsersService;

public class UsersAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String username; 	// 用户名
	private String password; 	// 密码
	private String realname; 	// 姓名
	private int age; 			// 年龄
	private String sex;			// 性别
	private String phone; 		// 联系方式
	private String role; 		// 角色
	private String remark; 		// 备注

	
	private IUsersService usersService;
	private Users user = new Users();
	
	public String login() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		System.out.println(user.getUsername() + " " + user.getPassword());
		
		String role = "error";
		try {
			Users loginUser = usersService.login(user.getUsername(),user.getPassword());
			if (null != loginUser) {	// 登录成功
				ActionContext context = ActionContext.getContext();
				context.getSession().put("LOGINUSER", loginUser);
				role = loginUser.getRole();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("登录用户类型： " + role);
		return role;
	}

	public void findAllUsers() throws UnsupportedEncodingException {

		HttpServletRequest request = ServletActionContext.getRequest();
		// 获取请求次数
		String draw = "0";
		draw = request.getParameter("draw");
		// 数据起始位置
		String start = request.getParameter("start");
		int startId = Integer.parseInt(start);
		// 数据长度
		String length = request.getParameter("length");
		int endId = startId + Integer.parseInt(length);
		// 获取排序方式 默认为asc
		String orderDir = "asc"; 
		// 定义列名
		String[] cols = { "username", "password", "realname", "age", "sex", "phone", "role", "remark" };
		// 获取客户端需要那一列排序
		String orderColumn = "0"; 
		// 排序列
		orderColumn = request.getParameter("order[0][column]");
		orderColumn = cols[Integer.parseInt(orderColumn)];
		orderDir = request.getParameter("order[0][dir]");
		// 搜索过滤
		String searchValue = new String(request.getParameter("search[value]")
				.getBytes("ISO8859-1"), "UTF-8");
		System.out.println("draw: " + draw + " start: " + start + " length: "
				+ length + " orderColumn: " + orderColumn + " orderDir: " + orderDir + " searchValue: " + searchValue);


		List<Users> list1 = usersService.findAllUsers();
//		String total = String.valueOf(list1.size());
		String total;
		if(list1 == null || list1.size() == 0){
			total = String.valueOf(0);
		}else{
			total = String.valueOf(list1.size());
		}
		List<Users> list = usersService.findUsersByKeyword(searchValue, startId, endId, orderColumn, orderDir);
		
		Map<Object, Object> info = new HashMap<Object, Object>();
		info.put("data", list);
		info.put("recordsTotal", total);
		info.put("recordsFiltered", String.valueOf(usersService.getUsersFiltered(searchValue)));
		info.put("draw", draw);
		String json = new Gson().toJson(info);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void addUser() throws IOException {
		
		HttpServletRequest request = ServletActionContext.getRequest();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");
		String remark = request.getParameter("remark");

		Users user = new Users();
		user.setUsername(username);
		user.setPassword(password);
		user.setRealname(realname);
		user.setAge(age);
		user.setSex(sex);
		user.setPhone(phone);
		user.setRole(role);
		user.setRemark(remark);

		usersService.addUser(user);
		
		JSONObject json = new JSONObject();
		json.put("status", "success");

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json.toString());
		out.flush();
		out.close();
	}
	
	public void updateUser() throws IOException {
		
		HttpServletRequest request = ServletActionContext.getRequest();

		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");
		String remark = request.getParameter("remark");

		Users user = new Users();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setRealname(realname);
		user.setAge(age);
		user.setSex(sex);
		user.setPhone(phone);
		user.setRole(role);
		user.setRemark(remark);

		usersService.updateUser(user);
		
		JSONObject json = new JSONObject();
		json.put("status", "success");

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json.toString());
		out.flush();
		out.close();
	}
	
	public void deleteUser() throws IOException {
		
		HttpServletRequest request = ServletActionContext.getRequest();

		String username = request.getParameter("username");
		
		usersService.deleteUserByUsername(username);
		
		JSONObject json = new JSONObject();
		json.put("status", "success");

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json.toString());
		out.flush();
		out.close();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public IUsersService getUsersService() {
		return usersService;
	}

	public void setUsersService(IUsersService usersService) {
		this.usersService = usersService;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

}
