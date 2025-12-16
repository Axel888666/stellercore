#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
处理转换后的Markdown内容，提取关键信息并生成星核动力科技网站内容
"""

import os
import re
from pathlib import Path

def clean_markdown_content(content):
    """清理Markdown内容，移除pandoc转换产生的多余标记"""
    # 移除pandoc的div标记
    content = re.sub(r':::+.*?:::+', '', content, flags=re.DOTALL)
    content = re.sub(r':::: .*?\n', '', content)
    content = re.sub(r':::.*?\n', '', content)
    
    # 清理图片路径
    content = re.sub(r'!\[\]\(images/', '![](refer/images/', content)
    
    # 清理链接
    content = re.sub(r'\[([^\]]+)\]\(javascript:void\(\)\)', r'\1', content)
    content = re.sub(r'\{[^}]*\}', '', content)  # 移除属性标记
    
    # 清理多余的换行
    content = re.sub(r'\n\n+', '\n\n', content)
    
    return content.strip()

def extract_key_content(file_path):
    """从转换后的文件中提取关键内容"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 清理内容
    cleaned = clean_markdown_content(content)
    
    # 提取标题和主要内容
    lines = cleaned.split('\n')
    key_content = []
    
    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        # 保留标题
        if line.startswith('#'):
            key_content.append(line)
        # 保留重要段落（非空且不是标记）
        elif len(line) > 20 and not line.startswith('![') and not line.startswith('['):
            key_content.append(line)
        # 保留列表项
        elif line.startswith('-') or line.startswith('*'):
            key_content.append(line)
    
    return '\n\n'.join(key_content)

def process_all_files():
    """处理所有转换后的文件"""
    converted_dir = Path('converted_md')
    results = {}
    
    for md_file in converted_dir.glob('*.md'):
        print(f"处理文件: {md_file.name}")
        key_content = extract_key_content(md_file)
        results[md_file.stem] = key_content
    
    return results

def generate_summary_report(results):
    """生成内容摘要报告"""
    report = "# 参考内容摘要报告\n\n"
    
    for filename, content in results.items():
        report += f"## {filename}\n\n"
        # 只显示前500字符作为摘要
        summary = content[:500] + "..." if len(content) > 500 else content
        report += summary + "\n\n---\n\n"
    
    return report

if __name__ == "__main__":
    print("开始处理转换后的内容...")
    results = process_all_files()
    
    # 生成摘要报告
    report = generate_summary_report(results)
    
    with open('content_summary.md', 'w', encoding='utf-8') as f:
        f.write(report)
    
    print(f"处理完成！共处理 {len(results)} 个文件")
    print("摘要报告已保存到 content_summary.md")