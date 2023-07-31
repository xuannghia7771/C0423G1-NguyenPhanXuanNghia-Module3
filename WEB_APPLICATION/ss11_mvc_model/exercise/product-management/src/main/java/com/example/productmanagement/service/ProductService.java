package com.example.productmanagement.service;

import com.example.productmanagement.model.Product;

import java.util.HashMap;
import java.util.*;

public class ProductService implements IProductService{
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Samsung 1", "Day la sam sung 1"));
        products.put(2, new Product(2, "Samsung 2", "Day la sam sung 2"));
        products.put(3, new Product(3, "Samsung 3", "Day la sam sung 3"));
        products.put(4, new Product(4, "Samsung 4", "Day la sam sung 4"));
        products.put(5, new Product(5, "Samsung 5", "Day la sam sung 5"));
        products.put(6, new Product(6, "Samsung 6", "Day la sam sung 6"));
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
