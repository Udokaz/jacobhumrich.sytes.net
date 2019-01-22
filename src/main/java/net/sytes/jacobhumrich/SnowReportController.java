/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.sytes.jacobhumrich;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author jacob
 */
@RestController
@RequestMapping(path = "/snowreport",
                produces="appilication/json")
@CrossOrigin(origins="*")
public class SnowReportController {
    
    
    @GetMapping("/{location}")
    public String getLocation(@PathVariable("location") long id){
        return "snowreport";
    }
}
