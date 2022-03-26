package com.codingdojo.dojoninja.repositores;

import com.codingdojo.dojoninja.models.Dojo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DojoRepository extends CrudRepository<Dojo,Long> {
    //Select * from ninjas where dojo_id = ?
    List<Dojo> findAll();

    Optional<Dojo> findById(Long id);

    Dojo findDojoById(Long id);
}
