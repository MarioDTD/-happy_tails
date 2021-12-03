const initShare = () => {
  const share = document.querySelector(".share");
  const sharedSpan = document.querySelector(".shared-span");
  share.addEventListener("click", (event) => {
    const url = window.location.href;
    navigator.clipboard
      .writeText(url)
      .then(() => {
        sharedSpan.classList.remove("d-none");
      })
      .catch(() => console.log("something went wrong"));
  });
};

export { initShare };
