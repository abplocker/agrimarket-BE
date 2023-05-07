class User { // comment
    constructor(UserId, UserName, Password, FullName, Email, Phone, Avatar, Role, IsActive){
        this.UserId = UserId;
        this.UserName = UserName;
        this.Password = Password;
        this.FullName = FullName;
        this.Email = Email;
        this.Phone = Phone;
        this.Avatar = Avatar;
        this.Role = Role;
        this.IsActive = IsActive;
    }
};

const api_url = "http://localhost:3000";                  // comment
var example_token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7IlVzZXJJRCI6IkEwMSIsIlVzZXJOYW1lIjoiYWRtaW4iLCJQYXNzd29yZCI6ImFkbWluIiwiRnVsbE5hbWUiOiJhZG1pbiIsIkVtYWlsIjoiYWRtaW5AZ21haWwuY29tIiwiUGhvbmUiOiIwMTIzNDU2Nzg5IiwiQXZhdGFyIjoiIiwiUm9sZSI6MywiSXNBY3RpdmUiOjF9LCJpYXQiOjE2ODE2ODEwMTgsImV4cCI6MTcxMzIxNzAxOH0.1ifSa8ufMd-r0hrOQIsxp3CEhqWQHXcBQG3agMP_rp4";
async function getApi(url){
    const response = await fetch(url, {
        method: "GET",
        headers: {
            'Authorization': example_token
        },
    });
    var data = await response.json();
    console.log(data.result);
}

getApi(api_url + "/user/all");                         // comment
const user = new User("00412123", "string 65", "string 65", "string 65", "", "", "", "1", "1",);
const user1 = ({
    UserId: "user", 
    UserName: "user1", 
    Password: "string 65", 
    FullName: "string 65", 
    Email: "string 65", 
    Phone: "string 65", 
    Avatar: "string 65", 
    Role: "1", 
    IsActive: "1", 
});

// thêm users
async function postApi(url, user){                   // comment
    const response = await fetch(url, {
        method: "POST",                             // thay đổi method POST,... PUT or DELETE...
        headers: {
            "Content-Type": "application/json",
            'Authorization': example_token
        },
        body: JSON.stringify(user),
    });
    var data = await response.json();
    console.log(data.result);
}

// postApi(api_url + "/user/add", user);...
postApi(api_url + "/user/add", user1);