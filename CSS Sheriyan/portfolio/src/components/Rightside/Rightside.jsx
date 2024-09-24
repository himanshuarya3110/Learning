import React from "react";
import "./Rightside.css";
import NavBar from "./../Navbar/NavBar";
import About from "./../../pages/About/About";
import Resume from "./../../pages/Resume/Resume";
import Portfolio from "./../../pages/Portfolio/Portfolio";
import Contact from "./../../pages/Contact/Contact";

function Rightside() {
  return (
    <div class="right">
      <NavBar />
      <div class="contain">
        <About />
        <Resume />
        <Portfolio />
        <Contact />
      </div>
    </div>
  );
}

export default Rightside;
