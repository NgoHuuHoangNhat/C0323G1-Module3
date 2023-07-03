package com.example.ss11.repository;

import com.example.ss11.model.Product;

import java.util.*;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productMap = new HashMap<>();

    static {
        productMap.put(1, new Product("1", "Bánh Kem", 50000.0, 100L, "Ngon"));
        productMap.put(2, new Product("2", "Kẹo Mút", 2000.0, 200L, "Chụt chụt"));
        productMap.put(3, new Product("3", "Xe Đồ Chơi", 150000.0, 300L, "Chạy nhanh"));
        productMap.put(4, new Product("4", "Nước Ngọt", 10000.0, 400L, "Ực ực"));
        productMap.put(5, new Product("5", "Bia", 15000.0, 500L, "Say lắm"));

    }

    @Override
    public List<Product> getAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void addProduct(Product product) {
        int key = 1;
        while (true) {
            if (!productMap.containsKey(key)) {
                productMap.put(key, product);
                break;
            }
            key++;
        }
    }

    @Override
    public Product getByID(String id) {
        Set<Integer> keySet = productMap.keySet();
        for (Integer key : keySet) {
            if (productMap.get(key).getId().equals(id)) {
                System.out.println(key);
                return productMap.get(key);

            }
        }
        return null;
    }

    @Override
    public void editProduct(Product product, String name, Double price, Long quantity, String info) {
        Set<Integer> keySet = productMap.keySet();
        for (Integer key : keySet) {
            Product p = productMap.get(key);
            if (p.equals(product)) {
                p.setName(name);
                p.setPrice(price);
                p.setQuantity(quantity);
                p.setInfo(info);
                break;
            }
        }
    }

    @Override
    public void delete(Product product) {
        Set<Integer> keySet = productMap.keySet();
        for (Integer key : keySet) {
            Product p = productMap.get(key);
            if (p.equals(product)) {
                productMap.remove(key);
            }
            break;
        }
    }

    @Override
    public List<Product> searchProductByName(String name) {
        List<Product> productList = new ArrayList<>();
        Set<Integer> keySet = productMap.keySet();
        for (Integer key : keySet) {
            Product p = productMap.get(key);
            if (p.getName().toLowerCase().contains(name)) {
                productList.add(p);
            }
        }
        if (productList.size() == 0) {
            return null;
        }
        return productList;
    }


}
