import {getPageNr} from './changePage';

const setAllButtonsInactive = () => {
  const layoutButtons = document.querySelectorAll(".layout_icon");
  layoutButtons.forEach((button) => {
    button.classList.remove('layout_active');
  });
};

const updatePageLayout = (pageNr, newLayoutNr) => {
  console.log('updating for page:' + pageNr);
  const currentPage = getPageNr();
  if (currentPage == null) {
    console.log("ERROR GETTING PAGENR");
  }
  const params = {
    page_id: pageNr,
    page_layout: newLayoutNr
  };
  fetch("/change_layout", {
    method: "patch",
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(params)
    });
};

const layoutPickerInit = () => {
  const layoutButtons = document.querySelectorAll(".layout_icon");
  layoutButtons.forEach((button) => {
    button.classList.remove('layout_active');
    button.addEventListener("click", () => {
      setAllButtonsInactive();
      event.currentTarget.classList.add('layout_active');
      const pageNr = getPageNr();
      const layoutID = event.currentTarget.id;
      console.log("layoutID" + layoutID);
      const layoutNr = parseInt(layoutID.split('_')[2], 10) - 1;
      console.log("layoutNr" + layoutNr);
      updatePageLayout(pageNr,layoutNr);
    });
    document.querySelector("#layout_icon_02").classList.add('layout_active');
  });
};

export {layoutPickerInit};
