package com.myshop.yura.controller;

import com.myshop.yura.entity.Lot;
import com.myshop.yura.entity.ShoppingCart;
import com.myshop.yura.entity.Users;
import com.myshop.yura.service.LotService;
import com.myshop.yura.service.ShoppingCartService;
import com.myshop.yura.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ShoppingCartController {

    @Autowired
    UsersService usersService;

    @Autowired
    LotService lotService;

    @Autowired
    ShoppingCartService shoppingCartService;

    @RequestMapping(value = "shoppingCart")
    public String getShoppingCartPage(ModelMap modelMap) {
        Users loggedUser = new Users();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            List<Users> user = usersService.getByEmail(userDetails.getUsername());
            loggedUser = user.get(0);
            modelMap.put("username", user.get(0).getName());
        }
        List<ShoppingCart> shoppingCartList = shoppingCartService.getByUser(loggedUser.getName());
        modelMap.put("carts", shoppingCartList);
        return "shoppingCart";
    }

    @RequestMapping(value = "/addToCart")
    public ModelAndView addToCart(
            @RequestParam(value = "name") String productName
    ) {
        Users loggedUser = new Users();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            List<Users> user = usersService.getByEmail(userDetails.getUsername());
            loggedUser = user.get(0);
        }
        List<Lot> lotList = lotService.getByName(productName);
        Lot lot = lotList.get(0);
        ShoppingCart shoppingCart = new ShoppingCart(lot.getName(), lot.getPrice(), lot.getImage(), loggedUser.getName());
        shoppingCartService.addCart(shoppingCart);
        String page = "";
        if (lot.getType().equals("smartphone")){
            page = "products";
        } else if (lot.getType().equals("notebook")){
            page = "products/?type=notebook";
        }
        return new ModelAndView("redirect:/" + page);
    }

    @RequestMapping(value = "/removeItem")
    public ModelAndView removeItemFromCart(
            @RequestParam(value = "id") int id
    ) {
        shoppingCartService.removeCart(id);
        return new ModelAndView("redirect:/shoppingCart");
    }
}
