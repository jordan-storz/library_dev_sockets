module Paths_socket_service (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jordanstorz/Documents/capstone/socket-service/.stack-work/install/x86_64-osx/lts-6.10/7.10.3/bin"
libdir     = "/Users/jordanstorz/Documents/capstone/socket-service/.stack-work/install/x86_64-osx/lts-6.10/7.10.3/lib/x86_64-osx-ghc-7.10.3/socket-service-0.1.0.0-87EE3ZsYBGfHprmkqhRQIQ"
datadir    = "/Users/jordanstorz/Documents/capstone/socket-service/.stack-work/install/x86_64-osx/lts-6.10/7.10.3/share/x86_64-osx-ghc-7.10.3/socket-service-0.1.0.0"
libexecdir = "/Users/jordanstorz/Documents/capstone/socket-service/.stack-work/install/x86_64-osx/lts-6.10/7.10.3/libexec"
sysconfdir = "/Users/jordanstorz/Documents/capstone/socket-service/.stack-work/install/x86_64-osx/lts-6.10/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "socket_service_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "socket_service_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "socket_service_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "socket_service_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "socket_service_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
