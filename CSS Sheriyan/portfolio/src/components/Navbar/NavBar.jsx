import React from "react";
import "./Navbar.css";

function NavBar() {
  return (
    <>
      <div class="navBar">
        {/* <div class="tab">
          <h1>selectedTab</h1>
        </div> */}
        <div class="nav">
          <a href="/">
            <h2>About</h2>
          </a>
          <a href="/">
            <h2>Resume</h2>
          </a>
          <a href="/">
            <h2>Portfolio</h2>
          </a>
          <a href="/">
            <h2>Contact</h2>
          </a>
        </div>
      </div>
    </>
  );
}

export default NavBar;
