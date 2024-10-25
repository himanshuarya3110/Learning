import React, { useState } from "react";
import ThemeSwitch from "../UI/ThemeSwitch";
import "./Login.css";

function Login() {
  const [isLogin, setIsLogin] = useState(true);
  const [formData, setFormData] = useState({
    username: "",
    email: "",
    password: "",
  });
  const [errors, setErrors] = useState({});

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const validate = () => {
    const newErrors = {};
    if (!formData.email) newErrors.email = "Email is required.";
    if (!formData.password) newErrors.password = "Password is required.";
    if (!isLogin && !formData.username)
      newErrors.username = "Username is required.";
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validate()) {
      // Handle login or registration logic here
      console.log(isLogin ? "Logging in..." : "Registering...", formData);
    }
  };

  return (
    <div className="flex justify-center items-center h-screen bg-base-200">
      <div className="card w-96 bg-base-100 shadow-xl">
        <div className="card-body">
          <h2 className="text-2xl font-bold text-center">
            {isLogin ? "Login" : "Register"}
          </h2>
          <form onSubmit={handleSubmit}>
            {!isLogin && (
              <div className="form-control">
                <label className="label">
                  <span className="label-text">Username</span>
                </label>
                <input
                  type="text"
                  name="username"
                  placeholder="Username"
                  className="input input-bordered"
                  value={formData.username}
                  onChange={handleChange}
                />
                {errors.username && (
                  <span className="text-red-500">{errors.username}</span>
                )}
              </div>
            )}
            <div className="form-control">
              <label className="label">
                <span className="label-text">Email</span>
              </label>
              <input
                type="email"
                name="email"
                placeholder="Email"
                className="input input-bordered"
                value={formData.email}
                onChange={handleChange}
              />
              {errors.email && (
                <span className="text-red-500">{errors.email}</span>
              )}
            </div>
            <div className="form-control">
              <label className="label">
                <span className="label-text">Password</span>
              </label>
              <input
                type="password"
                name="password"
                placeholder="Password"
                className="input input-bordered"
                value={formData.password}
                onChange={handleChange}
              />
              {errors.password && (
                <span className="text-red-500">{errors.password}</span>
              )}
            </div>
            <div className="form-control mt-6">
              <button type="submit" className="btn btn-primary w-full">
                {isLogin ? "Login" : "Register"}
              </button>
            </div>
          </form>
          <p className="text-center mt-4">
            {isLogin ? "Don't have an account?" : "Already have an account?"}{" "}
            <button
              className="text-primary font-bold"
              onClick={() => setIsLogin(!isLogin)}
            >
              {isLogin ? "Register" : "Login"}
            </button>
          </p>
          <ThemeSwitch />
        </div>
      </div>
    </div>
  );
}

export default Login;
