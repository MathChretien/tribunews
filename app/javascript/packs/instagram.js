const instagramInit = () => {
  const boxes = document.querySelector(".photo-box");
  boxes.forEach((box) => {
    box.insertAdjacentHTML('afterbegin','<div class="insta">');
    box.insertAdjacentHTML('beforeend','</div>');
  });
};

export {instagramInit};
