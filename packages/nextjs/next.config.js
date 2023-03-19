// @ts-check

/** @type {import('next').NextConfig} */
const nextConfig = {
  webpack: (config, {dev, isServer }) => {
    if (!dev && !isServer) {
      config.resolve.alias = {
        react: "inferno-compat",
        "react-dom": "inferno-compat",
        ...config.resolve.alias
      };
    }
    return config;
  },
  reactStrictMode: true,
  typescript: {
    ignoreBuildErrors: process.env.NEXT_PUBLIC_IGNORE_BUILD_ERROR === "true",
  },
  eslint: {
    ignoreDuringBuilds: process.env.NEXT_PUBLIC_IGNORE_BUILD_ERROR === "true",
  },
};

module.exports = nextConfig;
