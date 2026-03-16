const user = {
  name: "서정원",
  nickname: "lucas114",
  birth: "2001.10.01",
  phone: "010-xxxx-xxxx",
  email: "lucas1144@naver.com"
};

document.getElementById("userName_common").textContent = user.name;
document.getElementById("userNickname_common").textContent = user.nickname;
document.getElementById("userBirth_common").textContent = user.birth;
document.getElementById("userPhonenumber_common").textContent = user.phone;
document.getElementById("userEmail_common").textContent = user.email;



const matchData = [
  { title: "마음에 들었던 기록", date: "2026.03.09 09:10" },
  { title: "abc", date: "2026.03.08 14:30" },
  { title: "엊그제 했던거", date: "2026.03.07 18:20" },
  { title: "제목123", date: "2026.03.06 11:00" },
  { title: "기록할만한 내용", date: "2026.03.05 11:00" }
];

const rows = document.querySelectorAll(".match-row");

console.log("rows:", rows.length);

rows.forEach((row, index) => {
  const title = row.querySelector(".match-title");
  const date = row.querySelector(".match-date");

  if (matchData[index]) {
    title.textContent = matchData[index].title;
    date.textContent = matchData[index].date;
  } else {
    title.textContent = "";
    date.textContent = "";
  }
});