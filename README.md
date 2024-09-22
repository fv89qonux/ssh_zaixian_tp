## 本项目实现的最终作用是基于SSH在线调查问卷管理系统
## 分为2个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 投票管理
 - 投票结果查看
 - 用户管理
 - 管理员登录
### 第2个角色为用户角色，实现了如下功能：
 - 个人信息修改
 - 投票查看
 - 查看主题
 - 查看我的投票
 - 查看投票
 - 用户注册
 - 用户登录
## 数据库设计如下：
# 数据库设计文档

**数据库名：** ssh_zaixian_tp

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [tb_option](#tb_option) |  |
| [tb_subject](#tb_subject) |  |
| [tb_users](#tb_users) |  |
| [tb_user_option](#tb_user_option) |  |

**表名：** <a id="tb_option">tb_option</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | OPTION_ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | OPTION_CONTENT |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  3   | VOTES |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  4   | SUBJECT_ID |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  5   | remark |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |

**表名：** <a id="tb_subject">tb_subject</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | SUBJECT_NAME |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  3   | optionType |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  4   | OPTION_NUM |   int   | 10 |   0    |    N     |  N   |       |   |
|  5   | CREATE_TIME |   datetime   | 19 |   0    |    N     |  N   |       |   |
|  6   | remark |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |

**表名：** <a id="tb_users">tb_users</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | username |   varchar   | 255 |   0    |    N     |  N   |       | 用户名  |
|  3   | password |   varchar   | 255 |   0    |    N     |  N   |       | 密码  |
|  4   | REALNAME |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  5   | AGE |   int   | 10 |   0    |    N     |  N   |       |   |
|  6   | sex |   varchar   | 255 |   0    |    N     |  N   |       | 性别  |
|  7   | PHONE |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  8   | ROLE |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  9   | remark |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |

**表名：** <a id="tb_user_option">tb_user_option</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | ID |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | USER_ID |   int   | 10 |   0    |    N     |  N   |       | 用户ID  |
|  3   | SUBJECT_ID |   int   | 10 |   0    |    N     |  N   |       |   |
|  4   | IS_VOTED |   varchar   | 255 |   0    |    Y     |  N   |   NULL    |   |
|  5   | remark |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 备注  |
|  6   | OPTION_ID |   int   | 10 |   0    |    Y     |  N   |   NULL    |   |

