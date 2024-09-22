package com.vote.service;

import java.util.List;

import org.json.JSONObject;

import com.vote.dao.IOptionDAO;
import com.vote.dao.ISubjectDAO;
import com.vote.dao.IUserOptionDAO;
import com.vote.model.Option;
import com.vote.model.Subject;
import com.vote.model.UserOption;

public class UserOptionService implements IUserOptionService {

	private IUserOptionDAO userOptionDAO;
	private IOptionDAO optionDAO;
	private ISubjectDAO subjectDAO;
	
	@Override
	public String publishVote(Integer optionId, Integer subjectId, Integer userId) {
		String voteStatus = "亲,投票成功哦···";
		try {
			String hql = " from UserOption o where " +
					"o.subjectId = '" + subjectId + "' and " +
//					"o.optionId = '" + optionId + "' and " +
					"o.userId = '" + userId + "'";
			
			String optionHql = " from Option o where " +
					"o.optionId= '" + optionId + "' and " +
					"o.subjectId = '" + subjectId + "'";
			
			UserOption userOption = userOptionDAO.findOne(hql);
            if(userOption != null){
            	voteStatus = "亲,不能重复投票哦···";
            } else{
            	userOption = new UserOption();
            	userOption.setSubjectId(subjectId);
            	userOption.setUserId(userId);
            	userOption.setIsVoted("已投");
            	userOption.setOptionId(optionId);
            	userOptionDAO.save(userOption);
            	
            	
            	// 并更新该投票该选项的票数
            	Option option = optionDAO.findOne(optionHql);
            	int votes = option.getVotes();
            	option.setVotes(votes + 1);
            	optionDAO.update(option);
            	
            	voteStatus = "亲,投票成功哦···";
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return voteStatus;
	}

	public IUserOptionDAO getUserOptionDAO() {
		return userOptionDAO;
	}

	public void setUserOptionDAO(IUserOptionDAO userOptionDAO) {
		this.userOptionDAO = userOptionDAO;
	}

	public IOptionDAO getOptionDAO() {
		return optionDAO;
	}

	public void setOptionDAO(IOptionDAO optionDAO) {
		this.optionDAO = optionDAO;
	}

	@Override
	public JSONObject findVotedSubjectByUserId(int userId) {
		JSONObject result = new JSONObject(true);
		try {
			String userOptionHql = " from UserOption o where " + "o.userId = '" + userId + "'";
			List<UserOption> userOptionList = userOptionDAO.findList(userOptionHql);
			if(userOptionList != null) {
				int tempSubjectId = 0;
				JSONObject optionInfo = new JSONObject(true);
				JSONObject subjectInfo = new JSONObject(true);
				for(UserOption uo : userOptionList) {
					
					int subjectId = uo.getSubjectId();
					int optionId = uo.getOptionId();
					if(tempSubjectId != subjectId){
						subjectInfo = new JSONObject(true);
						optionInfo = new JSONObject(true);
					}
					
					tempSubjectId = subjectId;
					
					String subjectHql = " from Subject s where s.id='" + subjectId + "' ";
					Subject subject = subjectDAO.findOne(subjectHql);
					
					String optionHql = "from Option where optionId = '" + optionId + "' order by id asc";
					Option option = optionDAO.findOne(optionHql);
					
					
					subjectInfo.put("subjectId", subject.getId());
					subjectInfo.put("subjectName", subject.getSubjectName());
					
					optionInfo.put(String.valueOf(option.getOptionId()), option.getOptionContent());
					
					subjectInfo.put("optionInfo", optionInfo);
					result.put(String.valueOf(subjectId), subjectInfo);
				}
			} else {
				result.put("result", "尚未有投票记录");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ISubjectDAO getSubjectDAO() {
		return subjectDAO;
	}

	public void setSubjectDAO(ISubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}
	
}
