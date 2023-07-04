package com.example.pratice.service;

import com.example.pratice.model.User;
import com.example.pratice.repository.IUserRepository;
import com.example.pratice.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    private IUserRepository userRepository = new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userRepository.searchByCountry(country);
    }
}
