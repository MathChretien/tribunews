import Sortable from "sortablejs" ;
const dragAndDropInit = () => {
 var isFirefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;


  var libraryBox = document.querySelector("#library");
  new Sortable(libraryBox, {
    group: "shared",

    onAdd: function (event) {
      const photo = document.querySelector("[data-chosen='true']");
      placeBackInLibrary(photo);
      // window.location.reload(false);
    },
  });

  var boxes = document.querySelectorAll("[data-boxes='true']");
  (boxes || []).forEach(box => {
    new Sortable(box, {
      group: "shared",

      onAdd: function (evt) {
        addPictureToBox(box)
        // window.location.reload(false);
      },
    });
  })

  // const makeApiCall = params => {
  //   console.log("makeApiCall inside");
  //   fetch("/box_photo", {
  //     method: "post",
  //     headers: {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json'
  //   },
  //     body: JSON.stringify(params),
  //     mode: "same-origin"
  //   }).then(function(response) {
  //     console.log("makeApiCall response");
  //     console.log(response);
  //     return response.json();
  //   })
  //   .catch(error => console.error('Error:', error));;
  // };
  // const makeApiCallBack = params => {
  //   console.log("makeApiCallBack");
  //   fetch("/back_library", {
  //     method: "post",
  //     headers: {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json'
  //   },
  //     body: JSON.stringify(params),
  //     mode: "same-origin"

  //   });
  // };


  const addPictureToBox = (box) => {
    console.log("addPictureToBox");
    const newPhoto = box.querySelector("[data-chosen='false']");
    const oldPhoto = box.querySelector("[data-chosen='true']");
    if (!newPhoto) return console.log( newPhoto.dataset);

    newPhoto.dataset.chosen = "true";

    let input_photo = document.querySelector('#pic_picture_id');
    let input_box = document.querySelector('#pic_box_id');
    let input_category = document.querySelector('#pic_category');

    input_photo.value = newPhoto.dataset.id;
    input_box.value = box.dataset.boxNumber;
    input_category.value = "pic";
    console.log(input_photo.value);
    console.log(input_box.value);
    input_photo.parentElement.submit();
    // makeApiCall({
    //    picture_id: newPhoto.dataset.id,
    //    box_id: box.dataset.boxNumber,
    //    category: "pic"
    //  });

  };

  const placeBackInLibrary = photo => {
    if (!photo) return
    photo.dataset.chosen = "false";
    libraryBox.appendChild(photo);
    console.log("makeApiCallBack");
    // makeApiCallBack({
    //    picture_id: photo.dataset.id,
    //    box_id: null,
    //    category: null
    //  }).then(function(response) {
    //   console.log("placeBackInLibrary response");
    //   console.log(response);
    //   return response.json();
    // });
    let input_photo = document.querySelector('#photo_box_picture_id');
    input_photo.value = photo.dataset.id;
    console.log(input_photo.value);
    input_photo.parentElement.submit();
  }
};

 export {dragAndDropInit};
