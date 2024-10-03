const express = require("express");
const router = express.Router();
const usuariosController = require("../src/controller/usuarios.controller");

router.get("/", usuariosController.getAllUsers);
router.get("/usuario/:id", usuariosController.getUserById);
router.delete("/usuario/:id", usuariosController.deleteUser);

module.exports = router;
