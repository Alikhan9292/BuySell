package com.example.buysell.services;

import com.example.buysell.models.Category;
import com.example.buysell.models.Image;
import com.example.buysell.models.Product;
import com.example.buysell.repositories.CategoryRepository;
import com.example.buysell.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private Long categoryId;

    public List<Product> listProducts(String title) {

        if(title != null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public void saveProduct(Product product, MultipartFile file) throws IOException {
        Image image;
        if(file.getSize() != 0){
            image = toImageEntity(file);
            product.addImageToProduct(image);
        }
        log.info("Saving new Product. Title: {};", product.getTitle());
        productRepository.save(product);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;

    }

    public Optional<Product> changeProductName(Long id, String newName) {
        Product product = productRepository.findById(id).orElseThrow(() ->  new IllegalArgumentException("Product not found with id: " + id));
        product.setTitle(newName);
        productRepository.save(product);
        log.info("Product name updated: {}", product);
        return Optional.of(product);
    }

    public Optional<Product> changeProductDescr(Long id, String newDescr) {
        Product product = productRepository.findById(id).orElseThrow(() ->  new IllegalArgumentException("Product not found with id: " + id));
        product.setDescription(newDescr);
        productRepository.save(product);
        log.info("Product description updated: {}", product);
        return Optional.of(product);
    }

    //newDiscount newPrice

    public Optional<Product> changeProductDiscount(Long id, Double newDiscount) {
        Product product = productRepository.findById(id).orElseThrow(() ->  new IllegalArgumentException("Product not found with id: " + id));
        product.setDiscount(newDiscount);
        productRepository.save(product);
        log.info("Product discount updated: {}", product);
        return Optional.of(product);
    }
    public Optional<Product> changeProductPrice(Long id, int newPrice) {
        Product product = productRepository.findById(id).orElseThrow(() ->  new IllegalArgumentException("Product not found with id: " + id));
        product.setPrice(newPrice);
        productRepository.save(product);
        log.info("Product price updated: {}", product);
        return Optional.of(product);
    }

    public void deleteProduct(Long id){
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id){
        return productRepository.findById(id).orElse(null);
    }
    public Category saveCategory(Category category) {
        return categoryRepository.save(category);
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }
}
