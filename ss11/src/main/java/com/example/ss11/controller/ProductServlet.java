package com.example.ss11.controller;

import com.example.ss11.model.Product;
import com.example.ss11.service.IProductService;
import com.example.ss11.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createProduct":
                showCreateProduct(request, response);
                break;
            case "productInfo":
                showProductInfo(request, response);
                break;
            case "editProduct":
                String id = request.getParameter("id");
                showEditProduct(request, response, id);
                break;
            case "deleteProduct":
                showDeleteProduct(request, response);
                break;
            case "searchProduct":
                showSearchProduct(request, response);
                break;
            default:
                displayList(request, response);
                break;
        }
    }

    private void showSearchProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/searchForm.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Product product = productService.getByID(id);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/deleteForm.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showProductInfo(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Product product = productService.getByID(id);
        request.setAttribute("product", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/productInfo.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response, String id) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/editForm.jsp");
        request.setAttribute("id", id);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/createForm.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void displayList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.getAll();
        request.setAttribute("productList", productList);
        String msg = request.getParameter("msg");
        request.setAttribute("msg", msg);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/listProduct.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createProduct":
                createProduct(request, response);
                break;
            case "editProduct":
                editProduct(request, response);
                break;
            case "deleteProduct":
                deleteProduct(request, response);
                break;
            case "search":
                searchProductByName(request, response);
                break;
        }
    }

    private void searchProductByName(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("searchName");
        List<Product> productList = productService.searchProductByName(searchName);
        String msg = "";
        if (productList == null) {
            msg = "Không có sản phẩm " + searchName;
            request.setAttribute("msg", msg);
        } else {
            msg = "Danh sách sản phẩm:";
            request.setAttribute("msg", msg);
            request.setAttribute("productList", productList);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/searchForm.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Product product = productService.getByID(id);

        productService.deleteProduct(product);
        try {
            response.sendRedirect("/ProductServlet?msg=1%20san%20pham%20da%20bi%20xoa");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        Long quantity = Long.parseLong(request.getParameter("quantity"));
        String info = request.getParameter("info");

        Product product = productService.getByID(id);

        productService.editProduct(product, name, price, quantity, info);
        try {
            response.sendRedirect("/ProductServlet?msg=san%20pham%20nay%20da%20duoc%20sua");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        Long quantity = Long.parseLong(request.getParameter("quantity"));
        String info = request.getParameter("info");

        Product product = productService.getByID(id);
        if (product != null) {
            try {
                response.sendRedirect("/ProductServlet?msg=san%20pham%20nay%20da%20co%20trong%20danh%20sach");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            Product newProduct = new Product(id, name, price, quantity, info);
            productService.addProduct(newProduct);
            try {
                response.sendRedirect("/ProductServlet?msg=them%20moi%20thanh%20cong");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
