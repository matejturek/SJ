import React, { useContext, useRef, useState } from 'react';
import commonContext from '../../contexts/common/commonContext';
import useForm from '../../hooks/useForm';
import useOutsideClose from '../../hooks/useOutsideClose';
import useScrollDisable from '../../hooks/useScrollDisable';
import { useUser } from '../../DataContext';

const AccountForm = () => {

    const { isFormOpen, toggleForm } = useContext(commonContext);
    const { inputValues, handleInputValues } = useForm();
    const { user, setUser } = useUser();
    const [error, setError] = useState()
    const formRef = useRef();

    useOutsideClose(formRef, () => {
        toggleForm(false);
    });

    useScrollDisable(isFormOpen);

    const [isSignupVisible, setIsSignupVisible] = useState(false);


    // Signup-form visibility toggling
    const handleIsSignupVisible = () => {
        setIsSignupVisible(prevState => !prevState);
    };

    const handleFormSubmit = async (e) => {
        e.preventDefault()
        //Register
        if (isSignupVisible) {
            setError()
            
            const url = 'http://localhost/xbeat/register.php';

            const body = JSON.stringify({
                username: inputValues.username,
                password: inputValues.password,
                email: inputValues.email
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
                setUser({id: data.id, username: inputValues.username})
                toggleForm(false)
              } else {
                setError(data.message)
              }
            } catch (error) {
                setError(error)
            }
        }
        //Login
        else {
            const url = 'http://localhost/xbeat/login.php';

            const body = JSON.stringify({
                username: inputValues.username,
                password: inputValues.password
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
                setUser({id: data.id, username: inputValues.username})
                toggleForm(false)
              }  else {
                setError(data.message)
              }
            } catch (error) {
                setError(error)
            }
        }
    }

    const handleChangePassword = async (e) => {
        e.preventDefault()
        setError()
        const url = 'http://localhost/xbeat/setPassword.php';

        if (inputValues.password !== inputValues.conf_password) {
            setError("Passwords does not match")
        }

        const body = JSON.stringify({
            username: user.username,
            old_password: inputValues.old_password,
            password: inputValues.password,
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
    }

    if (isFormOpen && user) {
        return <>
         <div className="backdrop">
                <div className="modal_centered">
                    <form id="account_form" ref={formRef} onSubmit={handleChangePassword}>

                        {/*===== Form-Body =====*/}
                        <div className="form_body">

                            <div className="input_box">
                            Old password
                                <input
                                    type="password"
                                    name="old_password"
                                    className="input_field"
                                    onChange={handleInputValues}
                                    required
                                />
                                New password
                                <input
                                    type="password"
                                    name="password"
                                    className="input_field"
                                    onChange={handleInputValues}
                                    required
                                />
                                Repeat new password
                                <input
                                    type="password"
                                    name="conf_password"
                                    className="input_field"
                                    onChange={handleInputValues}
                                    required
                                />
                            </div>

                            <button
                                type="submit"
                                className="btn login_btn"
                            >
                                Change password
                            </button>

                        </div>
                        {
                            error && (<p>{error}</p>)
                        }

                        {/*===== Form-Close-Btn =====*/}
                        <div
                            className="close_btn"
                            title="Close"
                            onClick={() => toggleForm(false)}
                        >
                            &times;
                        </div>

                    </form>
                </div>
            </div>
        </>
    }


    return (
        <>
            {
                isFormOpen && (
                    <div className="backdrop">
                        <div className="modal_centered">
                            <form id="account_form" ref={formRef} onSubmit={handleFormSubmit}>

                                {/*===== Form-Header =====*/}
                                <div className="form_head">
                                    <h2>{isSignupVisible ? 'Signup' : 'Login'}</h2>
                                    <p>
                                        {isSignupVisible ? 'Already have an account ?' : 'New to X-Beat ?'}
                                        &nbsp;&nbsp;
                                        <button type="button" onClick={handleIsSignupVisible}>
                                            {isSignupVisible ? 'Login' : 'Create an account'}
                                        </button>
                                    </p>
                                </div>

                                {/*===== Form-Body =====*/}
                                <div className="form_body">
                                    {
                                        isSignupVisible && (
                                            <div className="input_box">
                                                <input
                                                    type="text"
                                                    name="username"
                                                    className="input_field"
                                                    value={inputValues.username || ''}
                                                    onChange={handleInputValues}
                                                    required
                                                />
                                                <label className="input_label">Username</label>
                                            </div>
                                        )
                                    }

                                    <div className="input_box">
                                        <input
                                            type="email"
                                            name="email"
                                            className="input_field"
                                            value={inputValues.email || ''}
                                            onChange={handleInputValues}
                                            required
                                        />
                                        <label className="input_label">Email</label>
                                    </div>

                                    <div className="input_box">
                                        <input
                                            type="password"
                                            name="password"
                                            className="input_field"
                                            value={inputValues.password || ''}
                                            onChange={handleInputValues}
                                            required
                                        />
                                        <label className="input_label">Password</label>
                                    </div>

                                    {
                                        isSignupVisible && (
                                            <div className="input_box">
                                                <input
                                                    type="password"
                                                    name="conf_password"
                                                    className="input_field"
                                                    value={inputValues.conf_password || ''}
                                                    onChange={handleInputValues}
                                                    required
                                                />
                                                <label className="input_label">Confirm Password</label>
                                            </div>
                                        )
                                    }

                                    <button
                                        type="submit"
                                        className="btn login_btn"
                                    >
                                        {isSignupVisible ? 'Signup' : 'Login'}
                                    </button>

                                </div>
                                {
                                    error && (<p>{error}</p>)
                                }

                                {/*===== Form-Close-Btn =====*/}
                                <div
                                    className="close_btn"
                                    title="Close"
                                    onClick={() => toggleForm(false)}
                                >
                                    &times;
                                </div>

                            </form>
                        </div>
                    </div>
                )
            }
        </>
    );
};

export default AccountForm;