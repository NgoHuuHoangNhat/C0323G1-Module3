package com.example.ss11.service;

import com.example.ss11.model.Product;
import com.example.ss11.repository.IProductRepository;
import com.example.ss11.repository.ProductRepository;

import java.util.List;


public class ProductService implements IProductService {
    private static IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getAll() {
        return productRepository.getAll();
    }

    @Override
    public void addProduct(Product product) {
        productRepository.addProduct(product);
    }

    @Override
    public Product getByID(String id) {
        return productRepository.getByID(id);
    }

    @Override
    public void editProduct(Product product, String name, Double price, Long quantity, String info) {
        productRepository.editProduct(product, name, price, quantity, info);
    }

    @Override
    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }

    @Override
    public List<Product> searchProductByName(String name) {
        return productRepository.searchProductByName(name);
    }
}
