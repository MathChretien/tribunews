import {getPageNr} from './changePage';

const setAllButtonsInactive = () => {
  const layoutButtons = document.querySelectorAll(".layout_icon");
  layoutButtons.forEach((button) => {
    button.classList.remove('layout_active');
  });
};

const saveLayoutToDB = (pageID, newLayoutNr) => {
  console.log('updating for page:' + pageID);
  const params = {
    page_id: pageID,
    page_layout: newLayoutNr
  };
  fetch("/change_layout", {
    method: "POST",
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(params)
    });
};

const updatePageLayout = (layout_str) => {
  // console.log('updating: layout ==' + layout_str);
  setAllButtonsInactive();
  const activeLayoutButton = document.getElementById("layout_icon_0" + layout_str);
  activeLayoutButton.classList.add('layout_active');
};

const layoutPickerInit = () => {
  const layoutButtons = document.querySelectorAll(".layout_icon");
  layoutButtons.forEach((button) => {
    button.addEventListener("click", () => {
      setAllButtonsInactive();
      event.currentTarget.classList.add('layout_active');
      const layoutID = event.currentTarget.id;
      // console.log("layoutID" + layoutID);
      const layout = layoutID.split('_')[2][1];
      // console.log("layout" + layout);
      const pageID = document.getElementById("picture_page_id").value;
      console.log("updating voor pageid:" + pageID);
      saveLayoutToDB(pageID,layout);
    });
  });
};

export {layoutPickerInit, updatePageLayout};
