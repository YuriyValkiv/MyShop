package com.myshop.yura.controller;

import com.myshop.yura.entity.Lot;
import com.myshop.yura.entity.Users;
import com.myshop.yura.service.LotService;
import com.myshop.yura.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class ProductsController {

    @Autowired
    private LotService lotService;

    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "/products")
    public String getProducts(ModelMap modelMap) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            List<Users> user = usersService.getByEmail(userDetails.getUsername());
            modelMap.put("username", user.get(0).getName());
        }

        List<Lot> lots = lotService.getAll();
        ArrayList<Integer> randomPhoto = new ArrayList<>();
        for (int i = 0; i < lots.size(); i++) {
            randomPhoto.add(i);
        }
        Collections.shuffle(randomPhoto);
        modelMap.put("bigImageOne", lots.get(randomPhoto.get(0)).getImageBig());
        modelMap.put("bigImageTwo", lots.get(randomPhoto.get(1)).getImageBig());
        modelMap.put("bigImageThree", lots.get(randomPhoto.get(2)).getImageBig());

        modelMap.put("products", lots);
        return "products";
    }
}
