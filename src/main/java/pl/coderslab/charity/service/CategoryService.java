package pl.coderslab.charity.service;

import pl.coderslab.charity.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> getAllCategories();
    void saveCategory(Category category);
    Category getCategoryById(Long id);
    void deleteCategoryByID(Long id);
}
