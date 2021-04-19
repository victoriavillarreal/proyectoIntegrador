const user = {
    register: (req,res) => {
        return res.render('register');
    },
    login: (req,res) => {
        return res.render('login');
    },
    profile: (req,res) => {
        return res.render('profile');
    },
    profileEdit: (req,res) => {
        return res.render('profile-edit');
    }
};

module.exports = user;