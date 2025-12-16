# 星核动力科技官网部署说明

## 项目概述

这是星核动力科技（深圳）有限公司的官方网站，基于Hugo静态网站生成器构建。

## 部署状态

✅ **代码已推送到GitHub**: https://github.com/Axel888666/stellercore.github.io

## 下一步操作

### 1. 启用GitHub Pages

1. 访问 GitHub 仓库: https://github.com/Axel888666/stellercore.github.io
2. 进入 **Settings** > **Pages**
3. 在 **Source** 下选择 **"GitHub Actions"**
4. 保存设置

### 2. 等待自动部署

- GitHub Actions 会自动构建和部署网站
- 部署完成后，网站将在以下地址可访问：
  **https://axel888666.github.io/stellercore.github.io/**

### 3. 自定义域名（可选）

如果需要使用自定义域名（如 www.stellercore.com）：

1. 在 **Settings** > **Pages** 中设置 **Custom domain**
2. 在DNS提供商处添加CNAME记录指向 `axel888666.github.io`
3. 等待DNS传播完成

## 网站特性

### 🎨 设计特色
- 现代化企业门户设计
- 星核动力科技品牌色彩（深蓝色系）
- 完全响应式，支持移动端
- 专业的企业形象展示

### 📱 页面结构
- **首页**: 公司介绍和核心业务展示
- **产品与服务**: StellerData、StellerCloud、StellerAI等产品
- **解决方案**: 金融科技、智能制造、医疗健康、教育科技
- **技术支持**: 多层次技术支持服务
- **关于我们**: 公司历程、团队介绍、资质荣誉
- **联系我们**: 全国办公地点和联系方式
- **新闻动态**: 公司新闻和产品发布
- **技术文档**: 产品文档和开发者资源

### 🚀 技术栈
- **Hugo**: 静态网站生成器
- **Bootstrap 5**: CSS框架
- **Font Awesome**: 图标库
- **GitHub Actions**: 自动化部署
- **GitHub Pages**: 免费托管

## 本地开发

### 环境要求
- Hugo Extended v0.146.0+
- Git

### 开发命令
```bash
# 启动开发服务器
hugo server -D

# 构建生产版本
hugo --minify

# 部署到GitHub
git add .
git commit -m "Update website"
git push origin master
```

## 维护说明

### 更新内容
1. 编辑 `content/` 目录下的Markdown文件
2. 提交并推送到GitHub
3. GitHub Actions会自动重新部署

### 添加新页面
```bash
# 添加新产品页面
hugo new products/new-product.md

# 添加新闻文章
hugo new blog/news-title.md
```

### 自定义样式
- 编辑 `assets/scss/_styles_project.scss`
- 修改 `assets/scss/_variables_project.scss` 中的品牌色彩

## 联系信息

- **GitHub仓库**: https://github.com/Axel888666/stellercore.github.io
- **网站地址**: https://axel888666.github.io/stellercore.github.io/
- **技术支持**: 如有问题请在GitHub仓库中创建Issue

---

**部署完成时间**: 2024年12月16日  
**版本**: v1.0  
**状态**: ✅ 已成功部署