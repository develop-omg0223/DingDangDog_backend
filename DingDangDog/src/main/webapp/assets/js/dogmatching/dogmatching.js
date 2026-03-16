function circleClick(circle, circles, radios, index, qIndex, allItems) {
  circles.forEach((c) => c.classList.remove("active"));
  circle.classList.add("active");
  if (radios[index]) {
    radios[index].checked = true;
  }

  const nextItem = allItems[qIndex + 1];
  if (nextItem) {
    setTimeout(() => {
      nextItem.scrollIntoView({ behavior: "smooth", block: "center" });
    }, 200);
  }
}

const surveyForm = document.querySelector("form");
const surveyItems = document.querySelectorAll(".survey-items");

surveyItems.forEach((item, qIndex) => {
  const questionNumber = qIndex + 1;
  const circles = item.querySelectorAll(".circle");
  const radios = item.querySelectorAll(".survey-radio");

  radios.forEach((radio, rIndex) => {
    radio.name = `survey-q${questionNumber}`;
  });

  circles.forEach((circle, cIndex) => {
    circle.addEventListener("click", () => {
      circleClick(circle, circles, radios, cIndex, qIndex, surveyItems);
    });
  });
});

surveyForm.addEventListener("submit", (e) => {
  let firstUnansweredItem = null;

  for (let i = 0; i < surveyItems.length; i++) {
    const radios = surveyItems[i].querySelectorAll(".survey-radio");
    const isChecked = Array.from(radios).some((radio) => radio.checked);

    if (!isChecked) {
      firstUnansweredItem = surveyItems[i];
      break;
    }
  }

  if (firstUnansweredItem) {
    e.preventDefault();
    alert("아직 답변하지 않은 문항이 있습니다");

    firstUnansweredItem.scrollIntoView({
      block: "center",
    });
  }
});