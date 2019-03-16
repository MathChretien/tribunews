import Sortable from "sortablejs";
const dragAndDropInit = () => {

  var libraryBox = document.querySelector("#library");
  new Sortable(libraryBox, {
    group: "shared",
    onAdd: function (evt) {
      const photo = event.target.querySelector("[data-chosen='true']");
      if (!photo) return
      photo.dataset.chosen = "false";
    },
  });

  var boxes = document.querySelectorAll("[data-boxes='true']");

  (boxes || []).forEach(box => {
    new Sortable(box, {
      group: "shared",
      onAdd: function (evt) {
        addPictureToBox(box)
      },
    });
  })

  const addPictureToBox = (box) => {
    const newPhoto = box.querySelector("[data-chosen='false']");
    const oldPhoto = box.querySelector("[data-chosen='true']");
    placeBackInLibrary(oldPhoto)
    if (!newPhoto) return
      console.log( newPhoto.dataset)
    console.log( box.dataset)
    newPhoto.dataset.chosen = "true";
    makeApiCall({
       picture_id: newPhoto.dataset.id,
       box_id: box.dataset.boxNumber
     });
  }

  const makeApiCall = params => {
    console.log(params)
    fetch("/box_photo", {
      method: "post",
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
      body: JSON.stringify(params)
    });
  };
  const placeBackInLibrary = photo => {
    if (!photo) return
    libraryBox.appendChild(photo);
  }
};

 export {dragAndDropInit};
