import Sortable from "sortablejs" ;
const dragAndDropInit = () => {

  var libraryBox = document.querySelector("#library");
  new Sortable(libraryBox, {
    group: "shared",
    onAdd: function (event) {
      const photo = document.querySelector("[data-chosen='true']");
      console.log(photo);
      placeBackInLibrary(photo);
      window.location.reload(false);
    },
  });

  var boxes = document.querySelectorAll("[data-boxes='true']");
  (boxes || []).forEach(box => {
    new Sortable(box, {
      group: "shared",
      onAdd: function (evt) {
        addPictureToBox(box)
        window.location.reload(false);
      },
    });
  })

  const addPictureToBox = (box) => {
    console.log("addPictureToBox");
    console.log(box);
    const newPhoto = box.querySelector("[data-chosen='false']");
    const oldPhoto = box.querySelector("[data-chosen='true']");
    if (!newPhoto) return console.log( newPhoto.dataset);

    newPhoto.dataset.chosen = "true";
    makeApiCall({
       picture_id: newPhoto.dataset.id,
       box_id: box.dataset.boxNumber,
       category: "pic"
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
  const makeApiCallBack = params => {
    console.log(params)
    fetch("/back_library", {
      method: "post",
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
      body: JSON.stringify(params)
    });

  };
  const placeBackInLibrary = photo => {
    console.log("placeBackInLibrary");
    console.log(photo);
    if (!photo) return
    photo.dataset.chosen = "false";
    libraryBox.appendChild(photo);
    makeApiCallBack({
       picture_id: photo.dataset.id,
       box_id: null,
       category: null
     });

    // TO SET the CSS on the img < to change
      document.querySelectorAll('.pix-container img').forEach((img) => {
      console.log(img);
      img.width = 150 ;
      img.height = 150;
      })

  }
};

 export {dragAndDropInit};
