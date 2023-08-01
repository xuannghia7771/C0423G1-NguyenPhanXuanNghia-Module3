package com.example.user_management.repository;

import com.example.user_management.model.User;

import java.sql.SQLException;
import java.util.*;
public interface IUserRepository {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;
}
