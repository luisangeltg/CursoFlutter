const { response } = require("express");
const { validarGoogleIdToken } = require("../helpers/google_verify_token");

const azureAuth = async (req, res = response) => {
    //Todo: obtener token
    const token = req.body;

    res.json({
        ok: true,
        token
    });
}

module.exports = {
    azureAuth
}