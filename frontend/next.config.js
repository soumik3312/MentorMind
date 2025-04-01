const nextConfig = {
    reactStrictMode: true,
    swcMinify: true,
    env: {
      NEXT_PUBLIC_API_URL: process.env.NEXT_PUBLIC_API_URL || "http://localhost:5000",
      NEXT_PUBLIC_BLOCKCHAIN_RPC: process.env.NEXT_PUBLIC_BLOCKCHAIN_RPC || "https://rpc.open-campus-codex.gelato.digital",
    },
    webpack: (config) => {
      config.resolve.fallback = {
        ...config.resolve.fallback,
        fs: false,
        net: false,
        tls: false,
      };
      return config;
    },
  };
  
  module.exports = nextConfig;