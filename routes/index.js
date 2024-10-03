var express = require('express');
var router = express.Router();
const usuariosController = require("../src/controller/usuarios.controller");

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post("/login", usuariosController.login); 


module.exports = router;
