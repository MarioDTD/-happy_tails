const likeInput = function () {
  const likeButton = document.getElementById("like_button");
  likeButton.addEventListener("click", (event) => {
    const likeButton = document.getElementById("like_button");
    likeButton.value = likeButton.value === "❤️" ? "♡" : "❤️";
  });
};

export { likeInput };
