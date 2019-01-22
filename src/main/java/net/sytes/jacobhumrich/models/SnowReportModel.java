/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.sytes.jacobhumrich.models;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author jacob
 */
public class SnowReportModel {
    
    
    private String key = "d71b4607e9dad9c3ae88d2d1d90242de/";
    private String api = "https://api.darksky.net/forecast/";
    private String location;
    private String dodgeRidge = "38.190059,%20-119.956797";
    private String bearValley = "38.492402,%20-120.044274";
    private String squawValley = "39.194167,%20-120.260251";
    private String northStar = "39.274864,%20-120.120420";
    private String heavenly = "38.924078,%20-119.916188";
    private String sierraAtTahoe = "38.801330,%20-120.082478";
    
    
    RestTemplate rest = new RestTemplate();
    
    public void setLocation( String location){
        if("dodgeRidge".equals(location))
            this.location = dodgeRidge;
        if("bearValley".equals(location))
            this.location = bearValley;
        if("squawValley".equals(location))
            this.location = squawValley;
        if("northStar".equals(location))
            this.location = northStar;
        if("heavenly".equals(location))
            this.location = heavenly;
        if("sierraAtTahoe".equals(location))
            this.location = sierraAtTahoe;
    }
    
    //Calls Darksky api with the location.
    public ResponseEntity<String> callLocation(){
        
        
            ResponseEntity<String> response = rest.getForEntity(api + key + location, String.class);
            if(response.getStatusCode() != HttpStatus.OK)
                System.out.println("Unable to callLocation");

            ObjectMapper mapper = new ObjectMapper();
        try{
            JsonNode root = mapper.readTree(response.getBody());
            System.out.println("JSON root = " + root);
        }catch(Exception e){
            System.out.println("Unable to parse json " + e);
        }
            
        return response;   
        
    }
    
    
    
    //dodge ridge https://api.darksky.net/forecast/d71b4607e9dad9c3ae88d2d1d90242de/38.190059,%20-119.956797
    //Bear Valley https://api.darksky.net/forecast/d71b4607e9dad9c3ae88d2d1d90242de/38.492402,%20-120.044274
    //Squaw Valley https://api.darksky.net/forecast/d71b4607e9dad9c3ae88d2d1d90242de/39.194167,%20-120.260251
    //North Star https://api.darksky.net/forecast/d71b4607e9dad9c3ae88d2d1d90242de/39.274864,%20-120.120420
    //Heavenly https://api.darksky.net/forecast/d71b4607e9dad9c3ae88d2d1d90242de/38.924078,%20-119.916188
    //Sierra At Tahoe https://api.darksky.net/forecast/d71b4607e9dad9c3ae88d2d1d90242de/38.801330,%20-120.082478
}
