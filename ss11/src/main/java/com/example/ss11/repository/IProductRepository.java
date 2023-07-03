package com.example.ss11.repository;

import com.example.ss11.model.Product;

import java.util.List;


public interface IProductRepository {
    List<Product> getAll();

    void addProduct(Product product);

    Product getByID(String id);

    void editProduct(Product product, String name, Double price, Long quantity, String info);

    void delete(Product product);

    List<Product> searchProductByName(String name);
}
