const burger = document.getElementById("burger");
const navigation = document.getElementById("navigation");

burger.addEventListener("click", function() {
  if (navigation.style.display === "none") {
    navigation.style.display = "block";
  } else {
    navigation.style.display = "none";
  }
});

navigation.addEventListener("click", function(event) {
  if (event.target.tagName === "A") {
    navigation.style.display = "none";
  }
});
