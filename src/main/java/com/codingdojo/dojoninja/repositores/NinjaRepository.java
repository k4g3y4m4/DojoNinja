package com.codingdojo.dojoninja.repositores;

import com.codingdojo.dojoninja.models.Ninja;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import javax.transaction.Transactional;
import java.util.List;

public interface NinjaRepository extends CrudRepository<Ninja, Long> {

    List<Ninja> findAll();

    //INSERT INTO ninja (name, level, available) VALUES ('Yoshi', 1, 1);


    //Select * from ninjas inner join dojos on ninjas.dojo_id = dojos.id where dojos.id = ?
    @Transactional
    @Modifying
    @Query(value = "SELECT * FROM db_ninjas_dojo_java.ninjas WHERE dojo_id = ?1", nativeQuery = true)
    Ninja findAllNinjasByDojo(Long id);

}
