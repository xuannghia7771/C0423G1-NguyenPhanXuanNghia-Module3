package com.example.user_management.service;

import com.example.user_management.model.User;

import java.util.*;

public interface IUserService {
    void insertUser(User user);

    User selectUser(int id);

    Map<Integer,User> selectAllUsers();

    void deleteUser(int id);

    void updateUser(int id,User user);
    User search(String country);

    List<User> sortByName();
}
