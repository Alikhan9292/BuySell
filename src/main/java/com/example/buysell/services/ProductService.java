package com.example.buysell.services;

import com.example.buysell.models.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {
    private List<Product> products = new ArrayList<>();
    private long ID = 0;

    {
        products.add(new Product(++ID, "PlayStation 5", "Simple description", 670000, "Astana", "sulpak"));
        products.add(new Product(++ID, "Iphone 15", "Simple description", 500000, "Almaty", "technodom"));
        products.add(new Product(++ID, "Dyson", "Simple description", 420000, "Aktobe", "alser"));
    }

    public List<Product> listProducts() {
        return products;
    }

    public void saveProduct(Product product) {
        product.setId(++ID);
        products.add(product);
    }

    public void deleteProduct(Long id) {
        products.removeIf(product -> product.getId().equals(id));
    }

    public Product getProductById(Long id) {
        for (Product product : products) {
            if (product.getId().equals(id)) return product;
        }
        return null;
    }

    public void updateProduct(Long id, Product newProductData) {
        for (Product product : products) {
            if (product.getId().equals(id)) {
                product.setTitle(newProductData.getTitle());
                product.setDescription(newProductData.getDescription());
                product.setPrice(newProductData.getPrice());
                product.setCity(newProductData.getCity());
                product.setAuthor(newProductData.getAuthor());
                break;
            }
        }
    }
}
