const index = {
    index: (req,res) => {
        return res.render('index');
    },
    searchResults: (req,res) => {
        return res.render('search-results');
    },
    headerLogueado: (req,res) => {
        return res.render('headerLogueado');
    }
};

module.exports = index;