import React from "react";
import "./About.css";
import Card from "../../components/Card";

function About() {
  return (
    <>
      <div className="data">
        <p>
          Hey there! I'm [Your Name], currently pursuing my Master of Computer
          Applications at NIT Allahabad with a keen interest in web development.
          I'm passionate about crafting engaging websites and learning the ins
          and outs of front-end technologies.
        </p>
        <br />
        <p>
          My journey into web development began with a curiosity for creating
          interactive and visually appealing interfaces. I've been diving into
          HTML, CSS, and JavaScript, and I'm excited to explore frameworks like
          React and Vue.js to bring my projects to life.
        </p>
        <br />
        <p>
          As a student, I'm constantly exploring new concepts and techniques in
          web development, eager to apply them to real-world projects. I enjoy
          the challenge of solving problems and optimizing code to create
          seamless user experiences.
        </p>
        <br />
        <p>
          Outside of coding, I love to stay updated with industry trends,
          participate in hackathons, and collaborate with peers on innovative
          projects. I believe in the power of continuous learning and am always
          seeking opportunities to expand my skills.
        </p>
        <br />
        <p>
          Let's connect and share our enthusiasm for building the web of
          tomorrow!
        </p>
        <br />
        <h2>What I'm Doing</h2>
        <Card />
        <Card />
        <Card />
        <Card />
        <Card />
        <Card />
        <Card />
        <Card />
      </div>
    </>
  );
}

export default About;
