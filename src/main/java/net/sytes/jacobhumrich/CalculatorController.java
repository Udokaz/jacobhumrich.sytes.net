/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.sytes.jacobhumrich;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author jacob
 */
@Controller
@RequestMapping("/Calculator")
public class CalculatorController {
    @GetMapping
    public String home(){
        return "Calculator";
    }
    
}
