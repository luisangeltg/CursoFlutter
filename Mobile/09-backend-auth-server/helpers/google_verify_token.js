const { OAuth2Client } = require('google-auth-library');

const CLIENT_ID = "476938732938-rg47fvrjp2ceidackdq4cbliu74gvdkj.apps.googleusercontent.com";

const client = new OAuth2Client(CLIENT_ID);

const validarGoogleIdToken = async (token) => {
    try {
        const ticket = await client.verifyIdToken({
            idToken: token,
            audience: [
                CLIENT_ID,
                "476938732938-ss7nchd7o5u4oegck95bvadcr2maoe7e.apps.googleusercontent.com",
                "476938732938-rg47fvrjp2ceidackdq4cbliu74gvdkj.apps.googleusercontent.com",
                ""],  // Specify the CLIENT_ID of the app that accesses the backend
            // Or, if multiple clients access the backend:
            //[CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3]
        });
        const payload = ticket.getPayload();
        //const userid = payload['sub'];
        console.log(payload);
        // If request specified a G Suite domain:
        // const domain = payload['hd'];
        return {
            name: payload["name"],
            picture: payload["picture"],
            email: payload["email"]
        };
    } catch (e) {
        console.log("Error: " + e);
        return null;
    }
}

module.exports = {
    validarGoogleIdToken
}