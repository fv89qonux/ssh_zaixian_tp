package com.vote.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.vote.service.IUserOptionService;

public class UserOptionAction extends ActionSupport {

	private static final long serialVersionUID = -997621498319402981L;
	private IUserOptionService userOptionService;
	
	public void publishVote() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();

		try {
			int optionId = Integer.parseInt(request.getParameter("optionId"));
			int subjectId = Integer.parseInt(request.getParameter("subjectId"));
			int userId = Integer.parseInt(request.getParameter("userId"));

			String voteStatus = userOptionService.publishVote(optionId, subjectId, userId);

			JSONObject json = new JSONObject();
			json.put("result", voteStatus);
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
	
	public void findVotedSubjectByUserId() throws UnsupportedEncodingException {

		HttpServletRequest request = ServletActionContext.getRequest();
		int userId = Integer.parseInt(request.getParameter("userId"));

		JSONObject result = userOptionService.findVotedSubjectByUserId(userId);

//		Map<Object, Object> info = new HashMap<Object, Object>();
//		info.put("data", result);
		
		String json = new Gson().toJson(result);
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

	public IUserOptionService getUserOptionService() {
		return userOptionService;
	}

	public void setUserOptionService(IUserOptionService userOptionService) {
		this.userOptionService = userOptionService;
	}

}
