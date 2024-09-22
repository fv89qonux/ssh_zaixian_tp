package com.vote.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @Func 投票信息表
 * @author Justerdu 2017-03-11
 */
public class Subject {

	private Integer id; // 投票id
	private String subjectName; // 投票名
	private String optionType; // 选项类型（单选、多选）
	private int optionNum; // 选项数目
	private Date createTime; // 创建时间
	private String remark; // 备注
	
	private Set<Option> options =new HashSet<Option>(); 

	public Subject() {
		super();
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

	public Set<Option> getOptions() {
		return options;
	}

	public void setOptions(Set<Option> options) {
		this.options = options;
	}

}