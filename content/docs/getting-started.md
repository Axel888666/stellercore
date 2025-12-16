---
title: "快速入门"
linkTitle: "快速入门"
weight: 10
description: >
  5分钟快速上手星核动力科技产品
---

# 快速入门指南

欢迎使用星核动力科技产品！本指南将帮助您在5分钟内快速上手我们的核心产品。

## 准备工作

### 系统要求
- 操作系统: Linux/Windows/macOS
- 内存: 最少4GB，推荐8GB以上
- 存储: 最少10GB可用空间
- 网络: 稳定的互联网连接

### 账户注册
1. 访问 [星核动力科技官网](https://stellercore.github.io)
2. 点击"注册账户"按钮
3. 填写基本信息并验证邮箱
4. 完成实名认证（企业用户）

## StellerData 快速开始

### 步骤1: 创建项目
```bash
# 使用命令行工具创建新项目
stellerdata create-project my-first-project
cd my-first-project
```

### 步骤2: 配置数据源
```yaml
# config.yaml
datasources:
  - name: "mysql_db"
    type: "mysql"
    host: "localhost"
    port: 3306
    database: "test_db"
    username: "user"
    password: "password"
```

### 步骤3: 导入数据
```bash
# 导入CSV文件
stellerdata import --source csv --file data.csv --table users

# 或者连接数据库
stellerdata connect --datasource mysql_db
```

### 步骤4: 执行查询
```sql
-- 简单查询示例
SELECT 
    COUNT(*) as total_users,
    AVG(age) as avg_age
FROM users 
WHERE created_date >= '2024-01-01';
```

## StellerCloud 快速部署

### 步骤1: 安装CLI工具
```bash
# 下载并安装CLI工具
curl -fsSL https://get.stellercloud.com | sh
stellercloud version
```

### 步骤2: 登录账户
```bash
stellercloud login
# 输入您的用户名和密码
```

### 步骤3: 创建应用
```bash
# 创建新应用
stellercloud app create my-app
cd my-app

# 初始化项目结构
stellercloud init --template nodejs
```

### 步骤4: 部署应用
```bash
# 部署到云端
stellercloud deploy

# 查看部署状态
stellercloud status
```

## StellerAI 模型训练

### 步骤1: 准备数据
```python
import pandas as pd
from stellerai import Dataset

# 加载数据
df = pd.read_csv('training_data.csv')
dataset = Dataset.from_pandas(df)
```

### 步骤2: 创建模型
```python
from stellerai import Model

# 创建分类模型
model = Model.create(
    type='classification',
    algorithm='random_forest',
    target_column='label'
)
```

### 步骤3: 训练模型
```python
# 训练模型
model.train(dataset)

# 评估性能
metrics = model.evaluate()
print(f"准确率: {metrics['accuracy']:.2f}")
```

### 步骤4: 部署预测
```python
# 部署为API服务
model.deploy(name='my-classifier')

# 进行预测
result = model.predict({'feature1': 1.0, 'feature2': 2.0})
```

## 常用命令参考

### StellerData
```bash
stellerdata --help              # 查看帮助
stellerdata list-projects       # 列出所有项目
stellerdata query "SELECT ..."  # 执行SQL查询
stellerdata export --format csv # 导出数据
```

### StellerCloud
```bash
stellercloud apps               # 列出所有应用
stellercloud logs my-app        # 查看应用日志
stellercloud scale my-app 3     # 扩展应用实例
stellercloud env set KEY=VALUE  # 设置环境变量
```

### StellerAI
```bash
stellerai models               # 列出所有模型
stellerai train config.yaml    # 使用配置文件训练
stellerai predict model.pkl    # 使用模型预测
stellerai deploy model-name    # 部署模型服务
```

## 示例项目

我们提供了一些示例项目帮助您快速理解产品功能：

### 电商推荐系统
```bash
git clone https://github.com/stellercore/ecommerce-recommendation
cd ecommerce-recommendation
stellerdata import --config data-config.yaml
stellerai train --config model-config.yaml
```

### 实时数据分析
```bash
git clone https://github.com/stellercore/realtime-analytics
cd realtime-analytics
stellercloud deploy --config cloud-config.yaml
```

### 智能客服机器人
```bash
git clone https://github.com/stellercore/chatbot-demo
cd chatbot-demo
stellerai train --type nlp --config chatbot-config.yaml
```

## 下一步

恭喜！您已经完成了快速入门。接下来您可以：

1. 📖 [深入学习产品文档](/docs/)
2. 🛠️ [查看最佳实践指南](/docs/best-practices/)
3. 💬 [加入开发者社区](https://community.stellercore.com)
4. 🎯 [申请技术支持](/support/)

## 获得帮助

如果您在使用过程中遇到问题：

- 📧 发送邮件至: support@stellercore.com
- 📞 拨打技术热线: +86-755-8888-8888
- 💬 在线客服: 工作日 9:00-18:00
- 📚 查看 [FAQ 常见问题](/docs/faq/)

---

*最后更新: 2024年12月16日*