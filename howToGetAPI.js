class User {
    constructor(UserId,UserName,Password,FullName,Email,Phone,Avatar,Role,IsActive){
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
const api_url = "http://localhost:3000";
async function getApi(url){
    const response = await fetch(url);
    var data = await response.json();
    console.log(data.result);
}
getApi(api_url+"/user/all");
const user = new User("00412123","string 65", "string 65", "string 65", "", "", "", "1", "1",);
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
// thêm user
async function postApi(url,user){
    const response = await fetch(url, {
        method: "POST", // thay đổi method POST, PUT or DELETE
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(user),
    });
    var data = await response.json();
    console.log(data.result);
}
// postApi(api_url+"/user/add",user);
postApi(api_url+"/user/add",user1);