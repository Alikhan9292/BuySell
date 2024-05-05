package com.example.buysell.controllers;

import antlr.StringUtils;
import com.example.buysell.models.CartItem;
import com.example.buysell.models.ShoppingCart;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.ShoppingCartService;
import lombok.RequiredArgsConstructor;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class CartController {
    @Autowired
    private ProductService productService;
    @Autowired
    private ShoppingCartService shoppingCartService;
    @PostMapping("/addToCart")
    public String addToCart(HttpServletRequest request, Model model, @RequestParam("id") Long id,
                            @RequestParam("quantity") int quantity) {
        // sessiontToken
        String sessionToken = (String) request.getSession(true).getAttribute("sessiontToken");
        if (sessionToken == null) {
            sessionToken = UUID.randomUUID().toString();
            request.getSession().setAttribute("sessiontToken", sessionToken);
            shoppingCartService.addShoppingCartFirstTime(id, sessionToken, quantity);

        }
        else {
            shoppingCartService.addToExistingShoppingCart(id,sessionToken,quantity);
        }
        return "redirect:/";

    }

    @GetMapping("/shoppingCart")
    public String ShowShoppingCartView(HttpServletRequest request, Model model) {
        String sessionToken = (String) request.getSession(true).getAttribute("sessionToken");
        if (sessionToken == null) {
            model.addAttribute("shoppingCart", new ShoppingCart());

        }
        else {
            ShoppingCart shoppingCart = shoppingCartService.getShoppingCartBySessionToken(sessionToken);
            model.addAttribute("shoppingCart", shoppingCart);

        }
        return "shoppingCart";
    }
}
