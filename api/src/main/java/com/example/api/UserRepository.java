package com.example.api;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.cdi.JpaRepositoryExtension;


public interface UserRepository extends JpaRepository<User,Integer> {
User findbyEmailandPassword(String email,String password);
    
}
