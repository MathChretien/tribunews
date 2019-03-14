const fullscreenInit = () => {

  const fullscreenButton = document.getElementById('btn_fullscreen');



  if (fullscreenButton) fullscreenButton.addEventListener('click', (event) => {
    console.log("awel");
    document.querySelector(".navbar-wagon").classList.toggle("hidden");
    const newspaperShowWrapper = document.querySelector(".wrapper");
    if (!document.fullscreenElement) {
      document.documentElement.requestFullscreen();
      fullscreenButton.innerHTML = "<i class="fas fa-compress">;
    } else {
      if (document.exitFullscreen) {
        document.exitFullscreen();
        fullscreenButton.innerHTML = "<i class="fas fa-expand">;

      }
    }
  });
};


export {fullscreenInit};
