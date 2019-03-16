const setAllButtonsInactive = () => {
  const layoutButtons = document.querySelectorAll(".layout_icon");
  layoutButtons.forEach((button) => {
    button.classList.remove('layout_active');
  });
};


const layoutPickerInit = () => {
  const layoutButtons = document.querySelectorAll(".layout_icon");
  layoutButtons.forEach((button) => {
    button.classList.remove('layout_active');
    button.addEventListener("click", () => {
      setAllButtonsInactive();
      event.currentTarget.classList.add('layout_active');
    });
    document.querySelector("#layout_icon_02").classList.add('layout_active');
  });
};

export {layoutPickerInit};
