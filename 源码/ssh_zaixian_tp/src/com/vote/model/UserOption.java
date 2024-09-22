package com.vote.model;

/**
 * @Func 投票人与投票关联表
 * @author Justerdu 2017-03-13
 */
public class UserOption {

	private Integer id; 
	private Integer userId; // 用户id
	private Integer subjectId; // 投票id
	private Integer optionId; // 选项id
	private String isVoted; // 是否已投
	private String remark; // 备注

	public UserOption() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Integer getOptionId() {
		return optionId;
	}

	public void setOptionId(Integer optionId) {
		this.optionId = optionId;
	}

	public String getIsVoted() {
		return isVoted;
	}

	public void setIsVoted(String isVoted) {
		this.isVoted = isVoted;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}