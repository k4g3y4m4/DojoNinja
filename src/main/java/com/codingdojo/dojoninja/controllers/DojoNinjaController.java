package com.codingdojo.dojoninja.controllers;


import com.codingdojo.dojoninja.models.Dojo;
import com.codingdojo.dojoninja.models.Ninja;
import com.codingdojo.dojoninja.services.ServicesDojoNinja;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.persistence.metamodel.Bindable;
import javax.validation.Valid;
import java.util.List;

@Controller
public class DojoNinjaController {

    @Autowired
    private  ServicesDojoNinja servicesDojoNinja;

    @GetMapping("/")
    public String index() {
        return "redirect:/dojos/new";
    }

    @GetMapping("/dojos/new")
    public String newDojo(@ModelAttribute("dojo") Dojo dojo) {
        return "newDojo.jsp";
    }

    @PostMapping("/newDojo")
    public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
        if(result.hasErrors()) {
            return "redirect:/dojos/new";
        }
        servicesDojoNinja.createDojo(dojo);
        return "redirect:/dojos/new";
    }

    @GetMapping("/ninjas/new")
    public String newNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
        model.addAttribute("dojos", servicesDojoNinja.getAllDojos());
        return "newNinja.jsp";
    }

    @PostMapping("/newNinja")
    public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja,Model model, BindingResult result) {
        if(result.hasErrors()) {
            System.out.println(result);
            List<Dojo> dojos = servicesDojoNinja.getAllDojos();
            model.addAttribute("dojos", dojos);
            return "newNinja.jsp";
        } else {
            servicesDojoNinja.createNinja(ninja);
            return "redirect:/dojos/" + ninja.getDojo().getId();
        }
    }

    @GetMapping("/dojos/{id}")
    public String showDojo(Model model, @PathVariable("id") Long id) {
        Dojo dojo = servicesDojoNinja.findDojoById(id);
        model.addAttribute("dojo", dojo);
        return "showDojo.jsp";
    }

}
