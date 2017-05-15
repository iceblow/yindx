package com.dianxin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dianxin.model.bo.Category;
import com.dianxin.model.bo.Template;

public interface TemplateMapper {

	//根据id取模板信息
	Template selectTemplateById(Integer template_id);
	
	//取设备的模板
	List<Template> selectTemplateByDeviceType(String typeid);
  
	//取模板大分类
	List<Category> selectTemplateCate(Integer template_id);
	
	//根据大分类取小分类
	List<Category> selectSubCate(Integer category_id);
	
	int insertTemplate(Template template);
	
	int updateTemplate(Template template);
	
	int insertCategoryRid(Category category);
	
	int queryListCount(@Param(value="name")String name,@Param(value="typeid")String typeid);
	
	List<Template> queryList(@Param(value="startIndex")Integer startIndex, @Param(value="endIndex") Integer endIndex,
			@Param(value="name")String name,@Param(value="typeid")String typeid);
	
	//添加一个大分类
	int insertCategory(@Param(value="template_id")Integer template_id, @Param(value="name")String name);
	
	//添加一个小分类
	int insertSubCategory(@Param(value="template_id")Integer template_id, @Param(value="name")String name,@Param(value="pid")Integer pid);

	//更新分类名
	int updateCategory(@Param(value="category_id")Integer category_id, @Param(value="name")String name);
	
	int delCategory(Integer template_id);
	
	int delCategoryById(Integer category_id);
	
	int delTemplate(Integer template_id);
	
	Category selectCategoryByCategoryId(@Param(value="category_id")Integer category_id);
}
