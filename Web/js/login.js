import db from "./FirebaseConfig.js";

const loginbtn = document.querySelector('#loginbtn');

const mail = document.querySelector('#username');
const password = document.querySelector('#password');

loginbtn.addEventListener('click',function(){
    if(checklogin()) {
        window.location.href = "../page/manage.html";
    }
    else{
        alert("Email hoặc password sai tdông tin!!!");
    }
})

function checklogin(){
    const dbref = ref(db,'Account');
    onValue(dbref,(snapshot) =>{
        var students = [];

        snapshot.forEach(childSnapshot =>{
            if(mail.value == ChildSnapshot.val().Mail && password.value == ChildSnapshot.val().PassWord){
                return true;
            }
        });
    })
    return false;
}