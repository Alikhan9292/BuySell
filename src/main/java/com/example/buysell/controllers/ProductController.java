package com.example.buysell.controllers;

import com.example.buysell.models.Category;
import com.example.buysell.models.Product;
import com.example.buysell.repositories.ProductRepository;
import com.example.buysell.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;



    @GetMapping("/")
    public String products(@RequestParam(name = "title", required = false) String title, Model model) {
        model.addAttribute("products", productService.listProducts(title));
        return "products";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model){
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product-info";
    }

    @PostMapping("/product/create")
    public String createProduct(@RequestParam("file") MultipartFile file, Product product) throws IOException {
        productService.saveProduct(product, file);
        return "redirect:/";
    }


    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "redirect:/";
    }

    @PostMapping("/product/createCategory")
    public String addCategory(Category category) {
        productService.saveCategory(category);
        return "redirect:/addCategory";
    }

    @GetMapping("/addProduct")
    public String showAddproduct(Model model){
        model.addAttribute("categories", productService.getAllCategories());
        return "/addProduct";
    }

    @GetMapping("/listProduct")
    public String showListproducts(Model model){
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "listProduct";
    }
    @GetMapping("/addCategory")
    public String products(Model model){
        model.addAttribute("category", new Category());
        model.addAttribute("categories", productService.getAllCategories());
        return "addCategory";
    }

    @PostMapping("/changeName")
    public String changePName(@RequestParam("id") Long id,@RequestParam("newName") String newName){
        productService.changeProductName(id, newName);
        return "redirect:/listProduct";

    }

    @PostMapping("/changeDescription")
    public String changePDescr(@RequestParam("id") Long id,@RequestParam("newDescr") String newDescr){
        productService.changeProductDescr(id, newDescr);
        return "redirect:/listProduct";

    }

    // newDiscount newPrice

    @PostMapping("/changeDiscount")
    public String changePDiscount(@RequestParam("id") Long id,@RequestParam("newDiscount") Double newDiscount){
        productService.changeProductDiscount(id, newDiscount);
        return "redirect:/listProduct";

    }

    @PostMapping("/changePrice")
    public String changePPrice(@RequestParam("id") Long id,@RequestParam("newPrice") int newPrice){
        productService.changeProductPrice(id, newPrice);
        return "redirect:/listProduct";

    }

}
