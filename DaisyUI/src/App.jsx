import "./App.css";
import NavBar from "./UI/NavBar";
import Carousel from "./UI/Carousel";
import Stat from "./UI/Stat";
import Footer from "./UI/Footer";

function App() {
  return (
    <>
      <div className="max-w-4xl mx-auto">
        <NavBar />
        <Carousel />
        <Stat />
      </div>
      <Footer />
    </>
  );
}

export default App;
