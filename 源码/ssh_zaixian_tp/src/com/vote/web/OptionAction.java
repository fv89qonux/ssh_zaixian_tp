package com.vote.web;

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
import com.opensymphony.xwork2.ActionSupport;
import com.vote.model.Option;
import com.vote.service.IOptionService;

public class OptionAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Integer optionId; // 选项id
	private Integer subjectId; // 所属投票id
	private String optionContent; // 选项内容
	private String remark; // 备注

	private IOptionService optionService;
	
	private Option Option = new Option();

	public void findAllOption() throws UnsupportedEncodingException {

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
		String[] cols = { "subjectId", "optionContent"};
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

		List<Option> list1 = optionService.findAllOption();
		String total = String.valueOf(list1.size());
		List<Option> list = optionService.findOptionByKeyword(searchValue, startId, endId, orderColumn, orderDir);

		Map<Object, Object> info = new HashMap<Object, Object>();
		info.put("data", list);
		info.put("recordsTotal", total);
		info.put("recordsFiltered", String.valueOf(optionService
				.getOptionFiltered(searchValue)));
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

	public void addOption() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();

		try {
			int subjectId = Integer.parseInt(request.getParameter("subjectId"));
			String optionContent = request.getParameter("optionContent");
			
			Option option = new Option();
			option.setSubjectId(subjectId);
			option.setOptionContent(optionContent);
			option.setVotes(0);
			
			optionService.addOption(option);

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

	public void updateOption() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			int optionId = Integer.parseInt(request.getParameter("optionId"));
			int subjectId = Integer.parseInt(request.getParameter("subjectId"));
			String optionContent = request.getParameter("optionContent");
			int votes = Integer.parseInt(request.getParameter("votes"));
			
			Option option = new Option();
			option.setOptionId(optionId);
			option.setSubjectId(subjectId);
			option.setOptionContent(optionContent);
			option.setVotes(votes);
			
			optionService.updateOption(option);
			
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

	public void deleteOption() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();

		try {
			int optionId = Integer.parseInt(request.getParameter("optionId"));

			optionService.deleteOptionById(optionId);

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

	public void findOptionsBySubjectId() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();

		try {
			int subjectId = Integer.parseInt(request.getParameter("subjectId"));

			List<Option> list = optionService.findOptionsBySubjectId(subjectId);

			JSONObject json = new JSONObject();
			json.put("result", list);
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
	
	public Integer getOptionId() {
		return optionId;
	}

	public void setOptionId(Integer optionId) {
		this.optionId = optionId;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public String getOptionContent() {
		return optionContent;
	}

	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public IOptionService getOptionService() {
		return optionService;
	}

	public void setOptionService(IOptionService optionService) {
		this.optionService = optionService;
	}

	public Option getOption() {
		return Option;
	}

	public void setOption(Option option) {
		Option = option;
	}

}
