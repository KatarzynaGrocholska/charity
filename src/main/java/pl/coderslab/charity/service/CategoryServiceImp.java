package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.repository.CategoryRepository;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImp implements CategoryService{

    @Autowired
    private CategoryRepository categoryRepository;

    public CategoryServiceImp(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @Override
    public void saveCategory(Category category) {

        this.categoryRepository.save(category);
    }

    @Override
    public Category getCategoryById(Long id) {
        Optional<Category> optional= categoryRepository.findById(id);
        Category category = null;
        if(optional.isPresent()){
            category= optional.get();
        }else {
            throw new RuntimeException("Nie znaleziono takiej kategorii");
        }
        return category;
    }

    @Override
    public void deleteCategoryByID(Long id) {
        this.categoryRepository.deleteById(id);

    }
}
