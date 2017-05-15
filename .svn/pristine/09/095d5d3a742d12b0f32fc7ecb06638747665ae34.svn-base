package com.dianxin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dianxin.dao.TemplateMapper;
import com.dianxin.model.bo.Category;
import com.dianxin.model.bo.Template;

@Transactional(readOnly=true)
@Service
public class TemplateService {

	@Resource
	private TemplateMapper templateMapper;
	
	public Template getTemplate(Integer template_id){
		return templateMapper.selectTemplateById(template_id);
	}
	
	public List<Category> getTemplateCate(Integer template_id) {
		List<Category> list = templateMapper.selectTemplateCate(template_id);
		
		if (list == null) return null;
		for (Category category : list) {
			List<Category> items = templateMapper.selectSubCate(category.getCategory_id());
			category.setSublist(items);
		}
		
		return list;
	}
	
	public int queryListCount(String name,String typeid){
		return templateMapper.queryListCount(name,typeid);
	}

	public List<Template> queryList(Integer page, Integer page_size,String name,String typeid){
		Integer startIndex =  (page - 1) * page_size + 1;
		Integer endIndex = startIndex + page_size - 1;
		return templateMapper.queryList(startIndex, endIndex,name,typeid);
	}
	
	public List<Template> selectTemplateByDeviceType(String id) {
		return templateMapper.selectTemplateByDeviceType(id);
	}
	
	public Template insertTemplate(Template template){
		templateMapper.insertTemplate(template);
		return template;
	}
	
	public void updateTemplate(Template template){
		templateMapper.updateTemplate(template);
	}
	
	public Category insetFirCategory(Category category){
		templateMapper.insertCategoryRid(category);
		return category;
	}
	
	public void insetSecCategory(Integer template_id,String name,Integer pid){
		templateMapper.insertSubCategory(template_id, name, pid);
	}
	
	public void updateCategory(Integer category_id,String name){
		templateMapper.updateCategory(category_id, name);
	}
	
	public void delCategory(Integer template_id){
		templateMapper.delCategory(template_id);
	}
	
	public void delCategoryById(Integer category_id){
		templateMapper.delCategoryById(category_id);
	};
	
	public void delTemplate(Integer template_id){
		templateMapper.delTemplate(template_id);
	}
}
