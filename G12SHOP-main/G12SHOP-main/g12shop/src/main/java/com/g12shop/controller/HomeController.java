package com.g12shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.g12shop.service.CategoriesService;
import com.g12shop.service.ProductTypesService;
import com.g12shop.service.ProductsService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private ProductsService productsService;
	
	@Autowired
	private ProductTypesService productTypesService;
	
	@Autowired
	private CategoriesService categoriesService;

    @GetMapping({"", "/index"})
    public String doGetHome(Model model) {
    	model.addAttribute("isIndexPage", true);
    	
    	model.addAttribute("categories", categoriesService.findAll());
    	model.addAttribute("products", productsService.findAll());
    	model.addAttribute("productTypes", productTypesService.findAll());
        return "index";
    }

    @GetMapping("shopping-cart")
    public String doGetShoppingCart() {
        return "shopping-cart";
    }

    @GetMapping("checkout")
    public String doGetCheckout() {
        return "checkout";
    }

    @GetMapping("about")
    public String doGetAbout(Model model) {
    	model.addAttribute("isAboutPage", true);
    	
        return "about";
    }

    @GetMapping("contact")
    public String doGetContact(Model model) {
    	model.addAttribute("isContactPage", true);
    	
        return "contact";
    }
}
