package com.wedpt.springjavamvc.service;

import org.springframework.stereotype.Service;

@Service
public class UserService {

    public String handlHome(){
        return "hello service" ;
    }
    
}
