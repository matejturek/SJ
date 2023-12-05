import React, { createContext, useContext, useEffect, useState } from 'react';

const ProductsContext = createContext();
const ReviewsContext = createContext();
const UserContext = createContext();

export const DataProvider = ({ children }) => {
    const [products, setProducts] = useState([]);
    const [reviews, setReviews] = useState([]);
    const [user, setUser] = useState();


    const fetchProducts = async () => {
      try {
        const response = await fetch('http://localhost/xbeat/getProducts.php');
        const data = await response.json();
  
        setProducts(data);
      } catch (error) {
        console.error('Error fetching products:', error);
      }
    };

      const fetchReviews = async () => {
        try {
          const response = await fetch('http://localhost/xbeat/getReviews.php');
          const data = await response.json();
    
          setReviews(data);
        } catch (error) {
          console.error('Error fetching reviews:', error);
        }
      };
  
    // Fetch products when the component mounts
    useEffect(() => {
      fetchProducts();
      fetchReviews()
    }, []);
    

  return (
    <ProductsContext.Provider value={{ products, setProducts }}>
      <ReviewsContext.Provider value={{ reviews, setReviews }}>
        <UserContext.Provider value={{ user, setUser }}>
          {children}
        </UserContext.Provider>
      </ReviewsContext.Provider>
    </ProductsContext.Provider>
  );
};

export const useProducts = () => {
  return useContext(ProductsContext);
};

export const useReviews = () => {
  return useContext(ReviewsContext);
};

export const useUser = () => {
  return useContext(UserContext);
};