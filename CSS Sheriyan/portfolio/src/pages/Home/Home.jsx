import React from "react";
import Leftside from "./../../components/Leftside/Leftside";
import Rightside from "./../../components/Rightside/Rightside";
import "./Home.css";
function Home() {
  return (
    <>
      <div className="main">
        <div className="container">
          <Leftside />
          <Rightside />
        </div>
      </div>
    </>
  );
}

export default Home;
