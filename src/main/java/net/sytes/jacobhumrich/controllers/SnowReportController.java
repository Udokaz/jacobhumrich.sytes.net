/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.sytes.jacobhumrich.controllers;

import net.sytes.jacobhumrich.models.SnowReportModel;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author jacob
 */
@RestController
@RequestMapping("/snowreport")
public class SnowReportController {
    
    @GetMapping
    public ModelAndView getSnow(){
        ModelAndView modelAndView = new ModelAndView("snowReport");
        modelAndView.addObject("message", "test");
        return modelAndView;
    }
    
    @PostMapping("/snowreport")
    public String getAPI(){
        return "API";
    }
    
        
    
}