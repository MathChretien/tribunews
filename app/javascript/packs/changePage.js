// import {getPageNr} from './changePage';

const changePageInit = () => {
  let page = document.querySelector(".num");
  let titlePage = document.querySelector("#num-change-page");
  // console.log(page);

  const changeButtonBack = document.getElementById("back-button");

  if (page) {
    let pageTest = page.innerHTML;
    console.log(pageTest);
    if (pageTest === " 1 ") {
     changeButtonBack.style.visibility = "hidden";
   };
 }

 if (changeButtonBack) {
  changeButtonBack.addEventListener('click', (event) => {
    const beforePage = parseInt(page.innerHTML,10) -1 ;
    checkVisibility(beforePage);
    page.innerHTML = beforePage;
    console.log(page);
    titlePage.innerHTML = `Page n°${beforePage}`;

  });
  console.log(page);

};

const changeButtonForward = document.getElementById("forward-button");
if (changeButtonForward) {
  changeButtonForward.addEventListener('click', (event) => {
    const nextPage = parseInt(page.innerHTML,10) + 1;
    checkVisibility(nextPage);
    page.innerHTML = nextPage;
    console.log(page);
    titlePage.innerHTML = `Page n°${nextPage}`;


    fetch("/pages/show/?page="+nextPage, {
      method: "get",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    });
  });
  console.log(page);
};

function checkVisibility(currentPage) {
  if (currentPage < 12) {
    changeButtonForward.style.visibility = "visible";
    changeButtonBack.style.visibility = "visible";
  }
  else {
    changeButtonForward.style.visibility = "hidden";
  };

  if (currentPage === 1) {
    changeButtonBack.style.visibility = "hidden";
    changeButtonForward.style.visibility = "visible";
  }
  else
    changeButtonBack.style.visibility = "visible";
}
};

function getPageNr() {
  const pageElement = document.querySelector(".num");
  if (pageElement) return parseInt(pageElement.innerHTML,10);
  else return null;
}

export {changePageInit, getPageNr};
