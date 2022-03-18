const { Router } = require("express");
const { googleAuth } = require("../controllers/auth");
const { azureAuth } = require("../controllers/azureAuth");
const router = Router();

router.post("/google", googleAuth);
router.post("/azure", azureAuth);

module.exports = router;