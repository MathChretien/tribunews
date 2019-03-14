const changePageInit = () => {
  let page = document.querySelector(".num");
  let title_page = document.querySelector("#num-change-page");
  console.log(page);

  const changeButtonBack = document.getElementById("back-button");
  if (changeButtonBack) changeButtonBack.addEventListener('click', (event) => {
    page.html('<%= j @newspaper.pages[i][:number]%>');

    console.log('yeah Back');
      console.log(page);

  });

  const changeButtonForward = document.getElementById("forward-button");
  if (changeButtonForward) changeButtonForward.addEventListener('click', (event) => {
    page.innerHTML = parseInt(page.innerHTML,10) + 1;
    title_page.innerHTML = "Page n° <%= @newspaper.pages[i][:number]%>";
    console.log('yeah Forward');
     console.log(page);

  });
      console.log(page);

};


 export {changePageInit};
