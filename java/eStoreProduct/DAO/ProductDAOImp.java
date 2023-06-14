package eStoreProduct.DAO;

import java.sql.*;
import java.util.*;

import eStoreProduct.model.Product;

public class ProductDAOImp implements ProductDAO{
	
	private static final String JDBC_DRIVER = "org.postgresql.Driver";
	private static final String DB_URL = "jdbc:postgresql://192.168.110.48:5432/plf_training";
	private static final String USERNAME = "plf_training_admin";
	private static final String PASSWORD = "pff123";

	@Override
	public List<String> getAllProductCategories() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Product> getProductsByCategory(String category) {
		List<Product> products = new ArrayList<>();
		System.out.println(category + " from model");
		try {
			Class.forName(JDBC_DRIVER);
			Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
			System.out.println(category + " from model");
			String query = "SELECT * FROM productsdata WHERE category = ? ";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, category);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				double price = resultSet.getDouble("price");
				String description = resultSet.getString("description");
				String imageUrl = resultSet.getString("image_url");

				Product product = new Product(id, name, price, description, imageUrl, category);
				products.add(product);
			}
			System.out.println(products.toString());
			resultSet.close();
			statement.close();
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return products;
	}

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();

		try {
			Class.forName(JDBC_DRIVER);
			Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);

			String query = "SELECT * FROM productsData";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				double price = resultSet.getDouble("price");
				String description = resultSet.getString("description");
				String imageUrl = resultSet.getString("image_url");
				String category = resultSet.getString("category");

				Product product = new Product(id, name, price, description, imageUrl, category);
				products.add(product);
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return products;
	}

	public List<String> getAllCategories() {
		List<String> categories = new ArrayList<>();

		try {
			// Load the JDBC driver
			Class.forName(JDBC_DRIVER);

			// Establish the database connection
			Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);

			// Prepare the SQL query
			String query = "SELECT DISTINCT category FROM productsData";
			PreparedStatement statement = connection.prepareStatement(query);

			// Execute the query
			ResultSet resultSet = statement.executeQuery();

			// Process the result set
			while (resultSet.next()) {
				// Retrieve category information from the result set
				String category = resultSet.getString("category");

				// Add the category to the list
				categories.add(category);
			}

			// Close the result set, statement, and connection
			resultSet.close();
			statement.close();
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return categories;
	}

	public Product getProductById(int productId) {
		Product product = null;
		try {
			Class.forName(JDBC_DRIVER);
			Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
			String query = "SELECT * FROM productdetails WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, productId);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				// Retrieve the product details from the result set
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				double price = resultSet.getDouble("price");
				String description = resultSet.getString("description");
				String imageUrl = resultSet.getString("image_url");
				String category = resultSet.getString("category");

				// Create a new Product object
				product = new Product(id, name, price, description, imageUrl, category);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return product;

	}
	

}
