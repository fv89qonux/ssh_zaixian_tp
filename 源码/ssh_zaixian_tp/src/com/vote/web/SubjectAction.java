package com.vote.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.vote.model.Subject;
import com.vote.service.IOptionService;
import com.vote.service.ISubjectService;

public class SubjectAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Integer id; // 投票id
	private String subjectName; // 投票名
	private String optionType; // 选项类型（单选、多选）
	private int optionNum; // 选项数目
	private Date createTime; // 创建时间
	private String remark; // 备注

	private ISubjectService subjectService;
	private IOptionService optionService;
	private Subject subject = new Subject();

	public void findAllSubject() throws UnsupportedEncodingException {

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
		// 获取排序方式 默认为desc
		String orderDir = "desc"; 
		// 定义列名
		String[] cols = { "subjectName", "optionType", "optionNum", "createTime" };
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

		List<Subject> list1 = subjectService.findAllSubject();
//		String total = String.valueOf(list1.size());
		String total;
		if(list1 == null || list1.size() == 0){
			total = String.valueOf(0);
		}else{
			total = String.valueOf(list1.size());
		}
		List<Subject> list = subjectService.findSubjectByKeyword(searchValue, startId, endId, orderColumn, orderDir);

		Map<Object, Object> info = new HashMap<Object, Object>();
		info.put("data", list);
		info.put("recordsTotal", total);
		info.put("recordsFiltered", String.valueOf(subjectService
				.getSubjectFiltered(searchValue)));
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

	public void addSubject() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();

		try {
			subjectName = request.getParameter("subjectName");
			String optionType = request.getParameter("optionType");
			int optionNum = Integer.parseInt(request.getParameter("optionNum"));
			Date nowDate = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date createTime = sdf.parse(sdf.format(nowDate));
			
			Subject subject = new Subject();
			subject.setSubjectName(subjectName);
			subject.setOptionType(optionType);
			subject.setOptionNum(optionNum);
			subject.setCreateTime(createTime);
			
			subjectService.addSubject(subject);
			
			Subject addedSubject = subjectService.findSubjectBySubjectName(subjectName);

			JSONObject json = new JSONObject();
			json.put("result", addedSubject);
			json.put("status", "success");
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateSubject() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			subjectName = request.getParameter("subjectName");
			String optionType = request.getParameter("optionType");
			int optionNum = Integer.parseInt(request.getParameter("optionNum"));
			
			Subject subject = new Subject();
			subject.setId(id);
			subject.setSubjectName(subjectName);
			subject.setOptionType(optionType);
			subject.setOptionNum(optionNum);
			
			subjectService.updateSubject(subject);
			
			JSONObject json = new JSONObject();
			json.put("status", "success");

			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteSubject() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();

		try {
			int id = Integer.parseInt(request.getParameter("id"));

			subjectService.deleteSubjectById(id);

			JSONObject json = new JSONObject();
			json.put("status", "success");

			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Func 根据投票id查找对应的投票信息
	 * @author Justerdu 2017-03-13
	 */
	public void findSubjectInfoById() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();

		try {
			int id = Integer.parseInt(request.getParameter("id"));

			Subject subject = subjectService.findSubjectById(id);

			JSONObject json = new JSONObject();
			json.put("result", subject);
			json.put("status", "success");

			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @Func 删除投票（同时需删除其子选项）
	 * @author Justerdu 2017-03-13
	 */
	public void deleteSubjectInfoAndOptionsInfoById() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();

		try {
			int id = Integer.parseInt(request.getParameter("id"));

			// 根据subjectId删除对应的投票选项
			optionService.deleteOptionsBySubjectId(id);
			subjectService.deleteSubjectById(id);

			JSONObject json = new JSONObject();
			json.put("status", "success");

			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getOptionType() {
		return optionType;
	}

	public void setOptionType(String optionType) {
		this.optionType = optionType;
	}

	public int getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public ISubjectService getSubjectService() {
		return subjectService;
	}

	public void setSubjectService(ISubjectService subjectService) {
		this.subjectService = subjectService;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public IOptionService getOptionService() {
		return optionService;
	}

	public void setOptionService(IOptionService optionService) {
		this.optionService = optionService;
	}
	
}
