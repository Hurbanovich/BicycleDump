package com.kreva.controller;


import com.kreva.model.Product;
import com.kreva.servise.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ProductController {
    private int page;
    private ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping(value = "/product")
    public ModelAndView allProduct(@RequestParam(defaultValue = "1") int page) {
        List<Product> products = productService.allProduct(page);
        int productCount = productService.productCount();
        int pagesCount = (productCount + 9)/10;
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productPage");
        modelAndView.addObject("page", page);
        modelAndView.addObject("productList", products);
        modelAndView.addObject("productCount", productCount);
        modelAndView.addObject("pagesCount", pagesCount);
        this.page = page;
        return modelAndView;
    }
    @GetMapping(value = "/addProduct")
    public ModelAndView addPageProduct(@ModelAttribute("message") String message) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("editProduct");
        return modelAndView;
    }

    @PostMapping(value = "/addProduct")
    public ModelAndView addProduct(@ModelAttribute("product") Product product) {
        ModelAndView modelAndView = new ModelAndView();
        if (productService.checkSeries(product.getSeries())) {
            modelAndView.setViewName("redirect:/product");
            modelAndView.addObject("page", page);
            productService.add(product);
        } else {
            modelAndView.addObject("message","part with series\"" + product.getSeries() + "\" already exists");
            modelAndView.setViewName("redirect:/product");
        }
        return modelAndView;
    }

    @GetMapping(value = "/editProduct/{id}")
    public ModelAndView editPageProduct(@PathVariable("id") int id,
                                        @ModelAttribute("message") String message) {
        Product product = productService.getById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("editProduct");
        modelAndView.addObject("product", product);
        return modelAndView;
    }

    @PostMapping(value = "/editProduct")
    public ModelAndView editFilm(@ModelAttribute("prouct") Product product) {
        ModelAndView modelAndView = new ModelAndView();
        if (productService.checkSeries(product.getSeries()) || productService.getById(product.getId()).getSeries().equals(product.getSeries())) {
            modelAndView.setViewName("redirect:/product");
            modelAndView.addObject("page", page);
            productService.edit(product);
        } else {
            modelAndView.addObject("message","part with series \"" + product.getSeries() + "\" already exists");
            modelAndView.setViewName("redirect:/editProduct/" +  + product.getId());
        }
        return modelAndView;
    }

    @GetMapping(value="/deleteProduct/{id}")
    public ModelAndView deleteFilm(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        int productCount =productService.productCount();
        int page = ((productCount - 1) % 10 == 0 && productCount > 10 && this.page == (productCount + 9)/10) ?
                this.page - 1 : this.page;
        modelAndView.setViewName("redirect:/product");
        modelAndView.addObject("page", page);
        Product product = productService.getById(id);
        productService.delete(product);
        return modelAndView;
    }


}
