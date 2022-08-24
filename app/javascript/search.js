function search() {
  const open = document.getElementById("drawer-toggle");
  const pullDown = document.getElementById("search-bar")

  open.addEventListener("mouseover", function() {
    this.setAttribute("style", "cursor: pointer;")
  });

  open.addEventListener("click", function() {
    if (pullDown.classList.contains("open")) {
      pullDown.classList.remove("open")
    } else {
      pullDown.classList.add("open")
    }
  });
};

window.addEventListener('load', search);