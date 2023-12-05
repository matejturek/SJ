import React, { useContext, useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { AiOutlineSearch, AiOutlineShoppingCart, AiOutlineUser } from 'react-icons/ai';
import commonContext from '../../contexts/common/commonContext';
import cartContext from '../../contexts/cart/cartContext';
import AccountForm from '../form/AccountForm';
import SearchBar from './SearchBar';
import { useUser } from '../../DataContext';


const Header = () => {

    const { toggleForm, toggleSearch } = useContext(commonContext);
    const { cartItems } = useContext(cartContext);
    const [isSticky, setIsSticky] = useState(false);
    const {user, setUser} = useUser()

    console.log('user', user)

    // handle the sticky-header
    useEffect(() => {
        const handleIsSticky = () => window.scrollY >= 50 ? setIsSticky(true) : setIsSticky(false);

        window.addEventListener('scroll', handleIsSticky);

        return () => {
            window.removeEventListener('scroll', handleIsSticky);
        };
    }, [isSticky]);


    const cartQuantity = cartItems.length;

    const deleteUser = async () => {
        const url = 'http://localhost/xbeat/deleteUser.php';

            const body = JSON.stringify({
                username: user.username,
              })


            try {
              const response = await fetch(url, {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json',
                },
                body,
              });
          
              const data = await response.json();
          
              if (data.status === 'success') {
                setUser()
              }  else {
                console.log(data.message)
              }
            } catch (error) {
                console.log(error)
            }
      };


    return (
        <>
            <header id="header" className={isSticky ? 'sticky' : ''}>
                <div className="container">
                    <div className="navbar">
                        <h2 className="nav_logo">
                            <Link to="/">X-Beat</Link>
                        </h2>
                        <nav className="nav_actions">
                            <div className="search_action">
                                <span onClick={() => toggleSearch(true)}>
                                    <AiOutlineSearch />
                                </span>
                                <div className="tooltip">Search</div>
                            </div>

                            <div className="cart_action">
                                <Link to="/cart">
                                    <AiOutlineShoppingCart />
                                    {
                                        cartQuantity > 0 && (
                                            <span className="badge">{cartQuantity}</span>
                                        )
                                    }
                                </Link>
                                <div className="tooltip">Cart</div>
                            </div>

                            <div className="user_action">
                                <span>
                                    <AiOutlineUser />
                                </span>
                                <div className="dropdown_menu">
                                    {
                                        user? (
                                            <>
                                            <h4>Hello {user?.username}</h4>
                                            <button
                                                type="button"
                                                onClick={() => setUser()}
                                            >
                                                Logout
                                            </button>
                                            <button
                                                type="button"
                                                onClick={() => deleteUser()}
                                            >
                                                Delete
                                            </button>
                                            <button
                                                type="button"
                                                onClick={() => toggleForm(true)}
                                            >
                                                Change password
                                            </button>
                                            </>
                                        ) : (
                                            <button
                                                type="button"
                                                onClick={() => toggleForm(true)}
                                            >
                                                Login / Signup
                                            </button>
                                        )
                                    }
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </header>

            <SearchBar />
            <AccountForm />
        </>
    );
};

export default Header;