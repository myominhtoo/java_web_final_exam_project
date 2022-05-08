
const date = document.getElementById("date");
const data = new Date();
date.textContent = data.getFullYear()+"/"+data.getMonth()+"/"+data.getDate()+"/"+" "+data.getHours()+":"+data.getMinutes()+":"+data.getSeconds();