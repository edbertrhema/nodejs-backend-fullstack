import { express } from "express";
import cors from "cors";
// import session from "express-session";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import db from "./config/Database.js";
// import SequelizeStore from "connect-session-sequelize"; // membantu membuat tabel session
import UserRoute from "./routes/UserRoute.js";
import ProductRoute from "./routes/ProductRoute.js";
import AuthRoute from "./routes/AuthRoute.js";
dotenv.config();
const app = express();
try {
  await db.authenticate();
  console.log('Database Connected...');
} catch (error) {
  console.log(error.message);
}

// const sessionStore = SequelizeStore(session.Store)
// const store = new sessionStore({
//     db:db
// });

// membuat database
// (async()=>{
//     await db.sync();
// })();

//session
// app.use(session({ 
//     secret: process.env.SESS_SECRET,
//     resave: false,
//     saveUninitialized: true,
//     store: store,
//     cookie: {
//         secure: 'auto'// untuk auto detect apakah http atau https
//     }
// }));

//cors
app.use(cors({
  credentials: true,
  // berfungsi agar FE mengirimkan req beserta cookie dengan menyertakan credentials
  origin: 'http://localhost:3000' // domain untuk mengakses api
}));

app.use(cookieParser()); // untuk memparsing cookie dari refresh token dan digunakan
app.use(express.json()); //middleware agar dapat menerima data dalam format json
app.use(UserRoute);
app.use(ProductRoute);
app.use(AuthRoute);

//membuat table store
// store.sync();

app.listen(process.env.APP_PORT, () => {
  console.log(`server up and running at port = ${process.env.APP_PORT}`);
});