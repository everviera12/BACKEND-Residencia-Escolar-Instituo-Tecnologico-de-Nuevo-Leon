const usuariosModel = require("../model/usuario.model");

const getAllUsers = async (req, res) => {
  try {
    const usuario = await usuariosModel.getAllUsers();
    res.status(200).json(usuario);
  } catch (error) {
    console.error(error);
    res.status(500).send("Error interno del servidor");
  }
};

const getUserById = async (req, res) => {
  try {
    const { id } = req.params;
    const usuario = await usuariosModel.getUserById(id);

    if (!usuario) {
      return res.status(404).send("Usuario no encontrado");
    }

    res.status(200).json(usuario);
  } catch (err) {
    if (err.code === "22P02") {
      return res.status(400).send("ID del usuario no válido");
    }
    console.error(err);
    res.status(500).send("Error interno del servidor");
  }
};

const deleteUser = async (req, res) => {
  try {
    const { id } = req.params;
    const usuarioDeleted = await usuariosModel.deleteUser(id);
    if (!usuarioDeleted) {
      return res.status(404).send("Usuario no encontrado");
    }
    res.status(200).json({
      message: "Usuario eliminado correctamente",
      client: usuarioDeleted,
    });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error interno del servidor");
  }
};


module.exports = {
  getAllUsers,
  deleteUser,
  getUserById,
};
