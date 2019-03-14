import Sortable from "sortablejs";
const dragAndDropInit = () => {

  var el1 = document.querySelector(".pix-container");
  var sortable = Sortable.create(el1, {
    group: "shared"
  });

  var el2 = document.querySelector(".layout");
  var sortable = Sortable.create(el2, {
    group: "shared"
  });



  // el2.addEventListener("DOMSubtreeModified", event => {
  //   const photo = event.target.querySelector("[data-choosen='false']");
  //   photo.dataset.choosen = "true";
  //   makeApiCall({
  //     photoId: photo.dataset.photoId,
  //     boxNumber: event.target.dataset.boxNumber
  //   });
  // });

  // el1.addEventListener("DOMSubtreeModified", event => {
  //   const photo = event.target.querySelector("[data-choosen='true']");
  //   photo.dataset.choosen = "false";
  // });

  // const makeApiCall = params => {
  //   fetch("https://en2gr1lgcfj1p.x.pipedream.net/", {
  //     method: "post",
  //     body: JSON.stringify(params)
  //   });
  // };
};
 export {dragAndDropInit};
