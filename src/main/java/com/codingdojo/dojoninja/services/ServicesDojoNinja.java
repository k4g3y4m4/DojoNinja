package com.codingdojo.dojoninja.services;


import com.codingdojo.dojoninja.models.Dojo;
import com.codingdojo.dojoninja.models.Ninja;
import com.codingdojo.dojoninja.repositores.DojoRepository;
import com.codingdojo.dojoninja.repositores.NinjaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServicesDojoNinja {
    @Autowired
    private DojoRepository dojoRepository;
    @Autowired
    private NinjaRepository ninjaRepository;

    public List<Dojo> getAllDojos(){
        return dojoRepository.findAll();
    }

    public Dojo createDojo(Dojo dojo){
        return dojoRepository.save(dojo);
    }

    public Ninja createNinja(Ninja ninja) { return ninjaRepository.save(ninja);}

    public Ninja findAllNinjasByDojo(Long dojo_id){
        return ninjaRepository.findAllNinjasByDojo(dojo_id);
    }

    public Dojo findDojoById(Long id){ return dojoRepository.findDojoById(id);}
}
