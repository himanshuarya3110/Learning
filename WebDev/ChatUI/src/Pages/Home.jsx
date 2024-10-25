import React from "react";

function Home() {
  return (
    <>
      <div className="flex">
        <div className="p-4 m-2 w-[40vh] border rounded-lg">leftside</div>
        <div className="p-4 m-2 w-full border rounded-lg">
          <div className="py-2 flex justify-between border rounded-lg">
            <div className="flex">
              <div className="mx-4">icon</div>
              <div className="mx-4">chat Name</div>
            </div>
            <div className="flex">
              <div className="mx-4">call icon</div>
              <div className="mx-4">options</div>
            </div>
          </div>
          <div className="h-[70vh] w-full border rounded-lg mt-1">
            chat Area
          </div>
          <div className="py-2 flex justify-between mt-1 border rounded-lg">
            <div className="mx-4">Typing</div>
            <div className="mx-4">send</div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Home;
