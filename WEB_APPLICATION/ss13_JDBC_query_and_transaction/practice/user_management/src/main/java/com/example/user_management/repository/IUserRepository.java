package com.example.user_management.repository;

import com.example.user_management.model.User;

import java.util.*;

public interface IUserRepository {
    void insertUser(User user);

    User selectUser(int id);

    Map<Integer,User> selectAllUsers();

    void deleteUser(int id);

    void updateUser(int id,User user);
    User search(String name);
    List<User> sortByName();
    User getUserById(int id);
    void insertUserStore(User user);
}
