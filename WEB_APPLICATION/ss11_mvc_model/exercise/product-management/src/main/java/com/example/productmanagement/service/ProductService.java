package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;

import java.util.HashMap;
import java.util.*;

public class ProductService implements IProductService {
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Samsung Galaxy S7 Edge", 3000.5, "Đây là Samsung Galaxy S7 Edge", "Samsung"));
        products.put(2, new Product(2, "Iphone 14 pro max", 2500, "Đây là Iphone 14 pro max", "Iphone"));
        products.put(3, new Product(3, "Oppo Reno 9", 1500, "Đây là Oppo Reno 9", "Oppo"));
        products.put(4, new Product(4, "Xiaomi Redmi Note 11", 2100.4, "Đây là Xiaomi Redmi Note 11", "Xiaomi"));
        products.put(5, new Product(5, "Huawei P40 Pro Plus", 2700, "Đây là Huawei P40 Pro Plus", "Huawei"));
        products.put(6, new Product(6, "Nokia Lumina 570", 2100, "Đây là Nokia Lumina 570", "Nokia"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
