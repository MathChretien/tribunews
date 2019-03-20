import {getPageNr} from './changePage';

const setAllButtonsInactive = () => {
  const layoutButtons = document.querySelectorAll(".layout_icon");
  layoutButtons.forEach((button) => {
    button.classList.remove('layout_active');
  });
};

// const saveLayoutToDB = (pageID, newLayoutNr) => {
//   console.log('updating for page:' + pageID);
//   const params = {
//     page_id: pageID,
//     page_layout: newLayoutNr
//   };
//   fetch("/change_layout", {
//     method: "POST",
//     headers: {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json'
//     },
//     body: JSON.stringify(params)
//   });
// };

const updatePageLayout = (layout_str) => {
  // console.log('updating: layout ==' + layout_str);
  setAllButtonsInactive();
  const activeLayoutButton = document.getElementById("layout_icon_0" + layout_str);
  if (activeLayoutButton) {
    activeLayoutButton.classList.add('layout_active');
    document.querySelector(".layout-content").style.visibility="visible";
  }
  else if (layout_str=="0") {
    document.querySelector(".layout-content").style.visibility="hidden";

  };

};

const layoutPickerInit = () => {
  const layoutButtons = document.querySelectorAll(".layout_icon");
  layoutButtons.forEach((button) => {
    button.addEventListener("click", (event) => {
      setAllButtonsInactive();
      event.currentTarget.classList.add('layout_active');
      const layoutID = event.currentTarget.dataset.layout;
      // console.log("layoutID" + layoutID);
      // const layout = layoutID.split('_')[2][1];
      // console.log("layout" + layout);
      const pageID = document.getElementById("picture_page_id").value;
      console.log("updating voor pageid:" + pageID);
      // saveLayoutToDB(pageID,layout);
      // window.location.reload(false);
      let input_page = document.querySelector('#layout_picker_page_id');
      let input_layout = document.querySelector('#layout_picker_page_layout');
      input_page.value = pageID;
      input_layout.value = layoutID;
      console.log(input_page);
      console.log(input_layout);
      console.log(layoutID);
      input_layout.parentElement.submit();


    });
  });
};

export {layoutPickerInit, updatePageLayout};
