import Head from "next/head";
import Front from "./home";
import type { NextPage } from "next";

const Home: NextPage = () => {
  return (
    <>
      <Head>
        <title>Bricks</title>
        <meta name="description" content="Created with 🏗 scaffold-eth" />
      </Head>
      <Front/>
    </>
  );
};

export default Home;
