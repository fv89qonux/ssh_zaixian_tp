package com.vote.model;


/**
 * @Func 投票选项表
 * @author Justerdu 2017-03-11
 */
public class Option {

	private Integer optionId; // 选项id
	private Integer subjectId; // 所属投票id(外键关联)
	private String optionContent; // 选项内容
	private int votes; 			// 票数
	private String remark; // 备注

	public Option() {
		super();
	}

	public Integer getOptionId() {
		return optionId;
	}

	public void setOptionId(Integer optionId) {
		this.optionId = optionId;
	}

	public String getOptionContent() {
		return optionContent;
	}

	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

}